SHOW DATABASES;

USE atguigudb;

SHOW TABLES;


SELECT *
FROM employees;

# SELECT email, commission_pct FROM employees WHERE commission_pct IS NULL;
SELECT email, commission_pct FROM employees WHERE commission_pct <=> NULL;
SELECT email, commission_pct FROM employees WHERE ISNULL(commission_pct);
SELECT email, commission_pct FROM employees WHERE commission_pct = NULL;

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

# LIKE
SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';  -- 匹配 last_name 字段形如 '一个字母 + o' 开头的字符串

# ESCAPE
SELECT job_id
FROM jobs
WHERE job_id LIKE 'IT\_%';

SELECT job_id
FROM jobs
WHERE job_id LIKE 'IT@_%' ESCAPE '@';  -- 指定 '$' 为转义字符，'$' 后的 '_' 为普通字符

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >=10000
  AND job_id LIKE '%MAN%';


SELECT *
FROM employees;
SELECT * FROM employees;
SELECT salary FROM employees WHERE salary REGEXP '0{2,3}';