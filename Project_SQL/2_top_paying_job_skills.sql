/*data set is from 2023
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/



WITH top_paying_jobs_results AS (
    SELECT
        job_postings_fact.job_id,
        job_postings_fact.job_title,
        company_dim.company_name,
        job_postings_fact.salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
    WHERE
        job_title_short='Data Analyst' AND
        (job_location = 'Anywhere' OR job_location='India' ) AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10 
)

SELECT 
    top_paying_jobs_results.job_id,
    top_paying_jobs_results.job_title,
    top_paying_jobs_results.company_name,
    top_paying_jobs_results.salary_year_avg,
    STRING_AGG(skills_dim.skills, ', ') AS required_skills
FROM top_paying_jobs_results
INNER JOIN skills_job_dim 
    ON top_paying_jobs_results.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY 
    top_paying_jobs_results.job_id, 
    top_paying_jobs_results.job_title, 
    top_paying_jobs_results.company_name, 
    top_paying_jobs_results.salary_year_avg
ORDER BY 
    top_paying_jobs_results.salary_year_avg DESC

/*
# Top 5 Skills in High-Paying Data Analyst Jobs (2023):
# 1. SQL         - 8 mentions
# 2. Python      - 7 mentions
# 3. Tableau     - 6 mentions
# 4. R           - 4 mentions
# 5. Snowflake   - 3 mentions
*/