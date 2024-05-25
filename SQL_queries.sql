-- Projects by category
SELECT
  category,
  COUNT(project_id) AS project_count
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  project_count DESC;


-- Projects status percentage
SELECT
  status,
  COUNT(status) AS status_count,
  ROUND((COUNT(status)/(
      SELECT
        COUNT(status)
      FROM
        luisalva.crowdfunding_dataset.projects)) * 100, 2) AS status_percentage
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  status
ORDER BY
  status_percentage DESC;


-- What projects category has the largest amount of suceess?
SELECT
  category,
  COUNT(category) AS category_count
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
GROUP BY
  category
ORDER BY
  category_count DESC
LIMIT
  1;


-- Average goal per category
SELECT
  category,
  ROUND(AVG(goal), 2) AS avg_goal
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  avg_goal DESC;


-- Money pledged by category
SELECT
  category,
  SUM(pledged) AS pledge_total
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  pledge_total;


-- Successful projects above average money pledged
SELECT
  name,
  category,
  (pledged - goal) AS difference
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
  AND (pledged - goal) > (
  SELECT
    ROUND(AVG(pledged - goal), 2)
  FROM
    luisalva.crowdfunding_dataset.projects
  WHERE
    status = 'Successful');


-- Average backers by category
SELECT
  category,
  ROUND(AVG(backers), 2) AS avg_backers
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  avg_backers DESC;

  
-- Projects by country
SELECT
  country,
  COUNT(project_id) AS project_count
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  country
ORDER BY
  project_count DESC;


-- Countries with most succesful projects
SELECT
  country,
  COUNT(status) AS success_count
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
GROUP BY
  country
ORDER BY
  success_count DESC;


-- Average goal per country
SELECT
  country,
  ROUND(AVG(goal), 2) AS avg_goal
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  country
ORDER BY
  avg_goal DESC;


-- Country with most backers 
SELECT
  country,
  SUM(backers) AS avg_backers
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  country
ORDER BY
  avg_backers DESC;


-- Average money pledged by country
SELECT
  country,
  ROUND(AVG(pledged), 2) AS avg_pledged
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  country
ORDER BY
  avg_pledged DESC;


-- Top 10 projects with the most difference between money pledged and money goal
SELECT
  category,
  name,
  (pledged - goal) AS difference
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
ORDER BY
  difference DESC
LIMIT 10;


-- Average difference between money pledged and money goal for succesul project status by category
SELECT
  category,
  ROUND(AVG(pledged - goal), 2) AS difference
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
GROUP BY
  category
ORDER BY
  difference DESC;
  

projects by month/year
investigate projects with fail status
success rate by category, out of 100 porject 23 are successull.
 



Your task is to provides data-driven recommendations for the types of 
projects they should be looking at for future success.

