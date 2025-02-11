SHOW DATABASES;
USE atguigudb;
SHOW TABLES;

SELECT *
FROM employees;

SELECT first_name, email, hire_date
FROM employees
ORDER BY hire_date;  # 按照 hire_date 排序输出，默认升序 ASC

SELECT first_name, email, hire_date
FROM employees
ORDER BY hire_date ASC;  # 按照 hire_date 升序输出

SELECT first_name, email, hire_date
FROM employees
ORDER BY hire_date DESC;  # 按照 hire_date 降序输出

SELECT first_name, salary * 12 AS "annual salary"
FROM employees
ORDER BY "annual salary" DESC;

SELECT last_name, department_id, hire_date
FROM employees
ORDER BY department_id DESC, hire_date ASC;

SELECT *
FROM employees
LIMIT 5;  -- [0-5]


SELECT *
FROM employees
LIMIT 0, 5;  -- [0-5]

SELECT *
FROM employees
LIMIT 5 OFFSET 0;  -- [0-5]

SELECT *
FROM employees
LIMIT 10, 10;  -- [10, 11, 12, 13, 14] 从 0 计数: 从第 10 行到第 14 行

