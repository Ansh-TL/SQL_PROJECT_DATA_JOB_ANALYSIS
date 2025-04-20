CREATE TABLE january_jobs AS
SELECT *
FROM 
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) = 1
    AND EXTRACT(YEAR FROM job_posted_date) = 2023;


CREATE TABLE february_jobs AS
SELECT *
FROM 
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_posted_date) = 2023;


CREATE TABLE march_jobs AS
SELECT *
FROM 
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) = 3
    AND EXTRACT(YEAR FROM job_posted_date) = 2023;


SELECT *
FROM february_jobs
