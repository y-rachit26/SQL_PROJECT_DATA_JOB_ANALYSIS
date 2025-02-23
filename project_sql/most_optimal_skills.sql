/* Question :What are the most optimal skill to learn?
- Identifty skills in high demand with high average salaries for Data Analyst roles.
-Target skills that are highly demanded and pay well.
*/

WITH high_paying AS(
    SELECT
    skills,skills_dim.skill_id,
    ROUND(Avg(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id-- we need only jobs with skills associated with them
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND salary_year_avg is NOT NULL
GROUP BY skills,skills_dim.skill_id
),most_demanded AS (
SELECT

    skills,skills_dim.skill_id,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id-- we need only jobs with skills associated with them
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND job_work_from_home= TRUE AND salary_year_avg is NOT NULL
GROUP BY skills,skills_dim.skill_id
ORDER BY demand_count DESC
)
SELECT
    high_paying.skills,
    high_paying.skill_id,
    high_paying.avg_salary,
    most_demanded.demand_count
FROM high_paying
INNER JOIN most_demanded ON high_paying.skill_id=most_demanded.skill_id
WHERE demand_count>15
ORDER BY demand_count DESC
/*HERE IS THE BREAKDOWN OF MOST OPTIMAL SKILLS TO LEARN IN TERMS OF DEMAND AND SALARY:
1. High-Paying Skills: What Sets Them Apart?
	•	Cloud & Big Data Lead in Earnings 💰
	•	Tools like Snowflake, Redshift, Hadoop, and AWS dominate high salaries ($100K+).
	•	As businesses shift to cloud-based analytics, expertise in these platforms is increasingly valuable.
	•	Python: The Ultimate Dual Threat 🐍
	•	Python stands out as both high-paying ($101K) and highly demanded (236 listings).
	•	Beyond data analysis, it powers automation, AI, and cloud applications, making it a must-have skill.
	•	Niche Tools Pay Well but Have Less Competition 🎯
	•	Tools like Looker, Oracle, and Alteryx offer six-figure salaries but aren’t as widely required.
	•	Mastering them can open doors to specialized, high-paying roles in enterprise analytics.

    2. High-Demand Skills: Essential but Not Always Lucrative
	•	SQL & Excel: Core Skills but Growth is Limited 📉
	•	SQL (398 jobs) and Excel (256 jobs) are essential, yet they cap out at mid-level salaries (~$96K).
	•	To break past this, pair them with Python, cloud platforms, or automation tools.
	•	BI Tools Are Valuable, but Need More to Shine 📊
	•	Tableau & Power BI are widely used, but alone, they won’t lead to the highest salaries.
	•	Upskilling into cloud-based analytics or advanced automation makes them more powerful.
	•	Entry-Level Skills Are Common but Need Upskilling 🔑
	•	Tools like PowerPoint, Word, and SQL Server appear frequently but don’t drive high salaries.
	•	Transitioning into cloud, ML, or automation-focused roles is the key to career advancement.

    Key Takeaway: The Winning Formula 🚀
	•	Cloud & Big Data = High Pay 💲
	•	SQL, Excel & BI = Job Security, But Limited Pay Growth 📌
	•	Python & Automation = Career Accelerator 🔥
*/

