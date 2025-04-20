SELECT *
FROM january_jobs

SELECT *
FROM february_jobs

SELECT *
FROM march_jobs;

--UNION
;

SELECT 
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    january_jobs
UNION -- combines rows of both the table together (both table must have same no. of coulmn must have same column name and datatype)
SELECT
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    february_jobs
UNION 
SELECT
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    march_jobs;


--UNION ALL combine even duplicates

SELECT 
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    january_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    february_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location,
    job_posted_date
FROM
    march_jobs;