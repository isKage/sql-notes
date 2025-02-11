SHOW DATABASES;
USE atguigudb;
SHOW TABLES;

SELECT ABS(-10),            -- 10
       SIGN(-20),           -- -1
       SIGN(30),            -- 1
       PI(),                -- 3.141593
       CEIL(40.2),          -- 41
       CEILING(-40.3),      -- 40
       FLOOR(50.4),         -- 50
       FLOOR(-60.5),        -- -61
       MOD(12, 5),          -- 2
       RAND(),-- 0.5452342969786695
       RAND(10),            -- 0.6570515219653505
       RAND(10),            -- 0.6570515219653505
       ROUND(12.33),        -- 12
       ROUND(12.348, 2),    -- 12.35
       ROUND(12.324, -1),   -- 10
       TRUNCATE(12.66, 1),  -- 12.6
       TRUNCATE(12.66, -1), -- 10
       RADIANS(180),        -- 3.141592653589793
       DEGREES(2 * PI()),   -- 360
       DEGREES(RADIANS(90)); -- 90

SELECT SIN(RADIANS(30)), -- sin(π/6) = 0.5
       DEGREES(ASIN(1)), -- arcsin(90º) = 1
       TAN(RADIANS(45)), -- tan(45º) = tan(π/4) = 1
       DEGREES(ATAN(1)), -- arctan(1) = 45º
       DEGREES(ATAN2(1, 1)); -- arctan(1) = 45º (1, 1) 与 (0, 0) 的连线角度

SELECT POW(2, 5),  -- 2^5 = 32
       POWER(2, 4),-- 2^4 = 16
       EXP(2),     -- e^2 = 7.3891
       LN(10),     -- ln(10) = 2.303
       LOG10(10),  -- log_10(10) = 1
       LOG2(4); -- log_2(2) = 2

SELECT BIN(1),  -- 1
       HEX(15), -- F
       OCT(7),  -- 7
       CONV(1, 10, 2); -- 1

SELECT FIELD('mm', 'hello', 'msm', 'amma'), -- 0 : 因为 mm 没有出现在字符串列表中
       FIND_IN_SET('mm', 'hello,mm,amma'); -- 2 : 出现在第 2 个，从 1 开始计数

SELECT FIND_IN_SET('mm', 'hello,mm,amma'), -- 2 : 出现在第 2 个，从 1 开始计数
       FIND_IN_SET('mm', 'hello, mm, amma'); -- 0 : 因为出现了空格，此时第 2 个是 'mm '


SELECT NULLIF('mysql', 'mysql'), -- 相同返回 NULL
       NULLIF('mysql', 'sql'); -- 不同返回第一个值 mysql

SELECT CURDATE(),        -- 2025-02-10
       CURTIME(),        -- 18:15:16
       NOW(),            -- 2025-02-10 18:15:16
       LOCALTIMESTAMP(), -- 2025-02-10 18:15:16
       UTC_DATE(),       -- 2025-02-10
       UTC_TIME(); -- 10:15:16


SELECT UNIX_TIMESTAMP(now()),                 -- 1739182869 精确到时分秒
       UNIX_TIMESTAMP(CURTIME()),             -- 1739182869 与第一个相同
       UNIX_TIMESTAMP(CURDATE()),             -- 1739116800 日期转时间戳
       UNIX_TIMESTAMP('2011-11-11 11:11:11'), -- 特定日期时间
       FROM_UNIXTIME(1739182869); -- 2025-02-10 18:21:09

SELECT DATE_FORMAT(NOW(), '%Y-%M-%D-%W %H:%i:%s');

SELECT STR_TO_DATE('09/01/2009', '%m/%d/%Y'),
       STR_TO_DATE('20140422154706', '%Y%m%d%H%i%s'),
       STR_TO_DATE('2014-04-22 15:47:06', '%Y-%m-%d %H:%i:%s');


# IF
SELECT IF(TRUE, 'value1', 'value2');

SELECT IFNULL(NULL, 'value2'); -- NULL
SELECT IFNULL('value1', 'value2'); -- 'value1'


SELECT employee_id,
       salary,
       CASE
           WHEN salary >= 15000 THEN 'high'
           WHEN salary >= 10000 THEN 'average'
           WHEN salary >= 8000 THEN 'low'
           ELSE 'too low'
           END "level of salary"
FROM employees;

SELECT *
FROM countries;

SELECT c.country_name,
       c.region_id,
       r.region_name
FROM countries AS c
         LEFT JOIN regions as r
                   ON c.region_id = r.region_id;

SELECT c.country_name,
       c.region_id,
       CASE c.region_id
           WHEN 1 THEN 'Europe'
           WHEN 2 THEN 'Americas'
           WHEN 3 THEN 'Asia'
           WHEN 4 THEN 'Middle East and Africa'
           ELSE 'Not find' END "region name"
FROM countries AS c;

SELECT employee_id,
       12 * salary * (1 + IFNULL(commission_pct, 0)) AS "annual salary"
FROM employees;

SELECT e.last_name,
       e.job_id,
       e.salary,
       j.job_title,
       CASE e.job_id
           WHEN 'IT_PROG' THEN 1.10 * salary
           WHEN 'ST_CLERK' THEN 1.15 * salary
           WHEN 'SA_REP' THEN 1.20 * salary
           ELSE salary
           END "REVISED_SALARY" -- 按照职位调整薪水
FROM employees AS e
         LEFT JOIN jobs AS j
                   ON e.job_id = j.job_id;
-- 补充职位全程，多表连接

# SELECT PASSWORD('mysql'); -- MySQL 8.x 后被移除

SELECT MD5('mysql') AS "md5 key";
SELECT SHA('mysql') AS "sha key";

# SELECT ENCODE('mysql', 'seed') AS "encode";  -- MySQL 8.x 后被移除

SELECT AES_ENCRYPT('mysql', 'seed') AS encrypted_data;
SELECT AES_DECRYPT(AES_ENCRYPT('mysql', 'seed'), 'seed') AS decrypted_data;

SELECT VERSION();
SELECT DATABASE();

SELECT USER(), CURRENT_USER(), SYSTEM_USER(), SESSION_USER();

SELECT CHARSET('ABC'), COLLATION('ABC');

SELECT FORMAT(1.124, 2), FORMAT(10.523, 0), FORMAT(100.123, -2);

SELECT INET_ATON('192.168.1.100') "IP to Num", INET_NTOA(3232235876) "Num to IP";

SELECT BENCHMARK(10000, MD5('mysql')) "Once";
SELECT BENCHMARK(100000, MD5('mysql')) "Many times";

SELECT CHARSET('mysql') "Origin", CHARSET(CONVERT('mysql' USING 'utf8')) "Convert to utf8";