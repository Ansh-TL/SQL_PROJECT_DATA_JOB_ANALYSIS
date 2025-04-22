/* data set is from 2023
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely OR India
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.company_name,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
WHERE
    job_title_short='Data Analyst' AND
    (job_location = 'Anywhere' OR job_location='India' ) AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
     