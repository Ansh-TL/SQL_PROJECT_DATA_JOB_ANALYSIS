-- SELECT '2023-02-19'::DATE,
--     '123'::INTEGER,
--     'true'::BOOLEAN,
--     '3.14'::REAL;

--
SELECT 
    job_title_short AS title ,
    job_location AS location,
    job_posted_date AS date  
FROM 
    job_postings_fact
LIMIT 10

--Remove time stamp
SELECT 
    job_title_short AS title ,
    job_location AS location,
    job_posted_date::DATE AS date   --remove time stamp
FROM 
    job_postings_fact
    LIMIT 10

-- ADD TIME ZONE as there were no time zone present we assumed it to be UST and added ust to it and then converted UST to indian time using 'Asia/Kolkata' u can change it to many time zone such as 'EST' etc
SELECT 
    job_title_short AS title ,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'Asia/Kolkata' AS date_time  
FROM 
    job_postings_fact
LIMIT 10

-- extract things out of a date
SELECT 
    job_title_short AS title ,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'Asia/Kolkata' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_month   
FROM 
    job_postings_fact
LIMIT 10

--
SELECT 
    COUNT(job_id) AS Job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY
    month
ORDER BY
    Job_posted_count DESC

---

SELECT 
    ROUND(AVG(salary_year_avg)) AS AVG_YEARLY_SALARY,
    ROUND(AVG(Salary_hour_avg)) AS AVG_Hourly_salary,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date)>5  --where cant use use alias of aggregating function befor group byas the actual column is created after group by 
GROUP BY
   month

-- using HAVING
SELECT 
     ROUND(AVG(salary_year_avg)) AS AVG_YEARLY_SALARY,
    ROUND(AVG(Salary_hour_avg)) AS AVG_Hourly_salary,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
GROUP BY
    month
HAVING
    EXTRACT(MONTH FROM job_posted_date) > 5;

q2

--

SELECT 
    company_dim.name AS CompanyName,
    EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) AS Quarter,
    EXTRACT(YEAR FROM job_postings_fact.job_posted_date) AS Year,
    job_postings_fact.job_health_insurance 
FROM
    job_postings_fact
LEFT JOIN
    company_dim
ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    EXTRACT(YEAR FROM job_postings_fact.job_posted_date) = 2023
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2
    AND job_postings_fact.job_health_insurance = true;  