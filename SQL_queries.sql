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

projects by month/year
what is the dates of the data.
what categpories of projects have the largest amount of suceess
what categories of projects have the least almount of success

