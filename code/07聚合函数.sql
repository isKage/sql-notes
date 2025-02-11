SHOW DATABASES;
USE atguigudb;
SHOW TABLES;

SELECT *
FROM employees;

SELECT AVG(e.salary) "avg_salary",
       SUM(e.salary) "sum_salary"
FROM employees e;


SELECT MIN(e.salary) "min_salary",
       MAX(e.salary) "max_salary"
FROM employees e;

SELECT MIN(e.hire_date) "early_salary",
       MAX(e.hire_date) "late_salary"
FROM employees e;

SELECT MIN(e.last_name) "A...",
       MAX(e.last_name) "Z..."
FROM employees e;

SELECT COUNT(*)
FROM employees e
WHERE e.salary >= 5000;

SELECT COUNT(e.commission_pct) "commission_pct not null"
FROM employees e;

SELECT e.department_id, d.department_name, FORMAT(AVG(e.salary), 2) "avg_salary_dept"
FROM employees e
         JOIN departments d
              ON e.department_id = d.department_id
# WHERE e.department_id != 20
GROUP BY e.department_id -- 按照 employees.department_id 分组
ORDER BY avg_salary_dept DESC; -- 按照 avg_salary_dept 列排序

SELECT *
FROM employees;

SELECT e.department_id dept_id, e.job_id, SUM(salary)
FROM employees e
# WHERE e.department_id IS NOT NULL
GROUP BY department_id, job_id; -- 按照 department_id, job_id 分组


SELECT e.department_id        dept_id,
       d.department_name      dept_name,
       e.job_id,
       j.job_title            job_name,
       FORMAT(AVG(salary), 2) avg_salary -- 分组计算平均薪水
FROM employees e
         -- 多表连接，查询 dept_name 和 job_name
         JOIN departments d
         JOIN jobs j
              ON e.department_id = d.department_id AND e.job_id = j.job_id
WHERE d.department_name REGEXP '^S' -- 匹配以 S 开头的字符串
GROUP BY e.department_id, e.job_id -- 按照 e.department_id, e.job_id 分组
ORDER BY avg_salary DESC; -- 根据 avg_salary 降序

SELECT e.department_id      id,
       SUM(e.department_id) sum_id,
       AVG(e.salary)        avg_salary
FROM employees e
WHERE e.department_id < 30
GROUP BY e.department_id
WITH ROLLUP; -- 添加一行数据：再进行一次 SUM(sum_id) AVG(avg_salary) 操作


SELECT department_id, MAX(salary) "max_larger_than_10000"
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

# SELECT department_id, MAX(salary) "max_larger_than_10000"
# FROM employees
# WHERE MAX(salary) > 10000
# GROUP BY department_id;
