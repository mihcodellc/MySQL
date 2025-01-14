-- MySQL Essential
-- https://github.com/abidmunirmalik/mysql-dba-course/tree/main

-- Long Running Queries with PROCESSLIST

SELECT 
    id AS pid,
    user AS usename,
    TIME_TO_SEC(TIMEDIFF(NOW(), start_time)) AS duration, -- Duration in seconds
    info AS query
FROM 
    INFORMATION_SCHEMA.PROCESSLIST
WHERE 
    info IS NOT NULL
    AND TIME_TO_SEC(TIMEDIFF(NOW(), start_time)) > 30 -- Queries running longer than 30 seconds
    AND user NOT IN ('claimresearch', 'enterprisedb')
ORDER BY 
    TIME_TO_SEC(TIMEDIFF(NOW(), start_time)) DESC;
