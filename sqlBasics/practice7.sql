

WITH remote_skills AS (
    SELECT 
        skills_job_dim.skill_id
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_postings_fact.job_work_from_home = True --job_postings_fact.job_location = 'Anywhere'
          AND job_postings_fact.job_title_short='Data Analyst'
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(*) AS remote_job_count
FROM remote_skills 
INNER JOIN skills_dim ON remote_skills.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skill_id, skills_dim.skills
ORDER BY remote_job_count DESC
LIMIT 10;

