SELECT *
FROM( --subqurey starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=1
          AND EXTRACT(YEAR FROM job_posted_date)=2023
    ) AS january_jobs;


--CTEs
;

WITH january_jobs AS( --cte start
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=1
          AND EXTRACT(YEAR FROM job_posted_date)=2023
) -- cte end

SELECT *
FROM january_jobs;





---
;


SELECT company_name AS companyName,
       company_id
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
)

ORDER BY
    company_id;


