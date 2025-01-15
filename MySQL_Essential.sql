-- MySQL Essential
-- https://github.com/abidmunirmalik/mysql-dba-course/tree/main

Limits & Restrictions
https://downloads.mysql.com/docs/mysql-reslimits-excerpt-8.0-en.pdf
https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/limits.html
    MySQL has no limit on the number of databases, tables 
    MySQL has hard limit of 4096 columns per table, Storage engines may impose additional restrictions
    maximum row size limit of 65,535 bytes 
    table size for MySQL databases is usually determined by operating system constraints on file sizes
    maximum number of tables in a view is 61.
    maximum length for each type of identifier(Table, column, view, index) is 64 kracters expcet alias 256 and compund label 16
    number of columns in an index depends on the storage engine and the maximum index key length for the database. InnoDB is 16 columns.

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
