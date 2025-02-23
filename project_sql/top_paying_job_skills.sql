/*Question: What skills are required for top paying Data Analyst jobs?
- Use  the top 10 highest paying Data Analyst roles that are available remotly 
-Add specific skills required for these roles.
Why? Highlights the skills required for the top paying Data Analyst jobs.
*/
WITH top_paying_jobs AS (
SELECT
job_postings_fact.job_id,
job_postings_fact.job_title_short,
job_postings_fact.job_location,
company_dim.name AS company_name,
job_postings_fact.salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim ON 
job_postings_fact.company_id=company_dim.company_id
WHERE job_title_short= 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location='Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT DISTINCT
top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id-- we need only jobs with skills associated with them
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 10
/*
Here is the breakdown of the most demanded skills:
1️⃣ Cloud & Data Engineering Lead – AWS, Azure, Databricks, PySpark show high demand for cloud and big data skills.
2️⃣ Data Analysis & Visualization Matter – Excel, Power BI, PowerPoint highlight the need for reporting and visualization.
3️⃣ Python & Pandas Rule – Python, Pandas, Jupyter confirm Python’s dominance in data analytics.


[
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "python"
  }
]
*/