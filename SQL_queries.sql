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


-- What category has the project with largest amount of suceess?
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


-- Success percentage by category
WITH
  successful AS (
  SELECT
    category,
    COUNT(category) AS success_count
  FROM
    luisalva.crowdfunding_dataset.projects
  WHERE
    status = 'Successful'
  GROUP BY
    category)
SELECT
  p.category,
  COUNT(p.category) AS total_count,
  s.success_count,
  ROUND(s.success_count / COUNT(p.category) * 100, 2) AS success_percentage
FROM
  luisalva.crowdfunding_dataset.projects p
JOIN
  successful s
ON
  p.category = s.category
GROUP BY
  p.category,
  s.success_count
ORDER BY
  success_percentage DESC


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
  pledged,
  goal
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
  AND pledged > (
  SELECT
    ROUND(AVG(pledged), 2)
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


-- Success percentage by category
WITH
  successful AS (
  SELECT
    country,
    COUNT(country) AS success_count
  FROM
    luisalva.crowdfunding_dataset.projects
  WHERE
    status = 'Successful'
  GROUP BY
    country)
SELECT
  p.country,
  COUNT(p.country) AS total_count,
  s.success_count,
  ROUND(s.success_count / COUNT(p.country) * 100, 2) AS success_percentage
FROM
  luisalva.crowdfunding_dataset.projects p
JOIN
  successful s
ON
  p.country = s.country
GROUP BY
  p.country,
  s.success_count
ORDER BY
  success_percentage DESC


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


  -- Successful projects per month
SELECT
  EXTRACT(YEAR_MONTH FROM launched) AS launched_month,
  COUNT(project_id) AS project_count
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  status = 'Successful'
GROUP BY
  launched_month
ORDER BY
  project_count DESC;
  

  -- Average days to deadline by category
SELECT
  category,
  ROUND(AVG(DATE_DIFF(deadline, launched, day)), 1) AS avg_days_to_dealine
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  avg_days_to_dealine DESC


Your task is to provides data-driven recommendations for the types of 
projects they should be looking at for future success.

