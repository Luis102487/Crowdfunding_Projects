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

  
-- Projects by category
SELECT
  country,
  COUNT(project_id) AS project_count
FROM
  luisalva.crowdfunding_dataset.projects
GROUP BY
  country
ORDER BY
  project_count DESC;


