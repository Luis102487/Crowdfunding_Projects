-- DATA CLEANING
-- Checking for duplicate records
select project_id, count(project_id) as project_count
from luisalva.crowdfunding_dataset.projects
group by project_id
order by project_count;


-- How many crowdfunding projects in the dataset
SELECT
  COUNT(project_id)
FROM
  luisalva.crowdfunding_dataset.projects;

-- What is the timeframe of the data.
SELECT
  MIN(launched) AS first_date,
  MAX(launched) AS last_date
FROM
  luisalva.crowdfunding_dataset.projects;


-- Categories in the dataset
SELECT
  DISTINCT category
FROM
  luisalva.crowdfunding_dataset.projects;


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


-- What projects category has the least almount of success?
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
  category_count 
LIMIT
  1;


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


-- Countries in the dataset
SELECT
  DISTINCT country
FROM
  luisalva.crowdfunding_dataset.projects;

  
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



-- How many statuses are there for projects?
SELECT
  DISTINCT status,
FROM
  luisalva.crowdfunding_dataset.projects


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


-- What is the highest status count in the USA?
SELECT
  status,
  COUNT(status) AS status_count
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  country = 'United States'
GROUP BY
  status
ORDER BY
  status_count DESC;


-- Category with most money pleadge
SELECT
  category,
  SUM(pledged) AS pledge_total
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  pledge_total;


-- Project with the most money pledged
SELECT name, category, country, launched, goal, pledged, backers, status
FROM
  luisalva.crowdfunding_dataset.projects
where pledged = (select max(pledged) from luisalva.crowdfunding_dataset.projects)


-- Project with the most money goal
SELECT
  name,
  category,
  country,
  launched,
  goal,
  pledged,
  backers,
  status
FROM
  luisalva.crowdfunding_dataset.projects
WHERE
  goal = (SELECT MAX(goal)
          FROM
            luisalva.crowdfunding_dataset.projects);


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


-- Average difference between money goal and money pledge




-- Average difference between money goal and money pledged for succesul status  by category
SELECT
  category,
  ROUND(AVG(goal - pledged), 2) AS avg_diff
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  category
ORDER BY
  avg_diff DESC;
--- cambia esta

  
-- Project above average money pledged 
-- category with the average most difference between goal and money pledged
-- Projects with the most difference between goal and money pledged


  

projects by month/year
investigate in projects with status success
average days leaunch date, dateline





investigate money goal vs money pledged
-- 
-- Average difference between money goal and money pledged for succesul status  by categoryey pledged 
-- category with the average most difference between goal and money pledged
-- Projects with the most difference between goal and money pledged
