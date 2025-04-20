
/*
label new column as follows:
'Anywhere' jobs as Remote
New York NY jobs as Local
otherwise onsight
*/;

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location= 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

FROM    job_postings_fact;

--count jobs that are remote onsite and local
;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location= 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

FROM    job_postings_fact
GROUP BY
    location_category;


--count jobs that are remote onsite and local where job title is data analysis
;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        WHEN job_location= 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

FROM    
    job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY
    location_category;
    
---
;
SELECT
    COUNT(*) AS number_of_jobs,
    CASE
        WHEN salary_year_avg > 100000 THEN 'high end'
        WHEN salary_year_avg > 50000 AND salary_year_avg <= 100000 THEN 'standard'
        ELSE 'lower'
    END AS salary_category
FROM    
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    CASE
        WHEN salary_year_avg > 100000 THEN 'high end'
        WHEN salary_year_avg > 50000 AND salary_year_avg <= 100000 THEN 'standard'
        ELSE 'lower'
    END
ORDER BY
    salary_category;




