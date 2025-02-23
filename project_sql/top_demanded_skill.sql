/*
Question: What are the most demanded skill for Data Analyst role?
- Join job postings to inner join table.
-Identify the top 5 in demand skills for a data analyst.
-Focus on all job postings not only 'REMOTE' jobs.
*/





SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id-- we need only jobs with skills associated with them
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND job_work_from_home= TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;