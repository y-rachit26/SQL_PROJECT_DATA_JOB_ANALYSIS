/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill .
- Focuses on roles with specified salaries, regardless of location.
- It reveals the skills that are most likely to lead to higher salaries.
*/
SELECT
    skills,
    ROUND(Avg(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id-- we need only jobs with skills associated with them
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND salary_year_avg is NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
/*🚀 Top 3 Trends in High-Paying Data Analyst Skills
1️⃣ AI, Machine Learning & Big Data Dominate – Skills like TensorFlow, PyTorch, DataRobot, Kafka, and Hugging Face are highly valued, reflecting the growing demand for AI/ML and real-time data processing.

2️⃣ Cloud, DevOps & Automation Are Key – Tools like Terraform, Ansible, Puppet, and VMware show that automating infrastructure and managing cloud environments are crucial for high salaries.

3️⃣ Specialized & Niche Skills Pay the Most – Solidity ($179K), Golang ($155K), and Couchbase ($160K) highlight that blockchain, backend development, and NoSQL databases can significantly boost earning potential.[
  {
    "skills": "svn",
    "avg_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "golang",
    "avg_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "avg_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820.00"
  },
  {
    "skills": "keras",
    "avg_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226.20"
  },
  {
    "skills": "perl",
    "avg_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118406.68"
  },
  {
    "skills": "notion",
    "avg_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387.26"
  },
  {
    "skills": "scala",
    "avg_salary": "115479.53"
  }
]
🚀 Top 3 Trends in High-Paying Data Analyst Skills
1️⃣ AI, Machine Learning & Big Data Dominate – Skills like TensorFlow, PyTorch, DataRobot, Kafka, and Hugging Face are highly valued, reflecting the growing demand for AI/ML and real-time data processing.

2️⃣ Cloud, DevOps & Automation Are Key – Tools like Terraform, Ansible, Puppet, and VMware show that automating infrastructure and managing cloud environments are crucial for high salaries.

3️⃣ Specialized & Niche Skills Pay the Most – Solidity ($179K), Golang ($155K), and Couchbase ($160K) highlight that blockchain, backend development, and NoSQL databases can significantly boost earning potential.
*/