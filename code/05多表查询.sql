SHOW DATABASES;
USE atguigudb;
SHOW TABLES;


SELECT last_name, department_name
FROM employees,
     departments;

SELECT COUNT(last_name)
FROM employees; -- 107 rows
SELECT COUNT(department_name)
FROM departments; -- 27 rows
SELECT 107 * 27; -- 2889

SELECT last_name, department_name
FROM employees
         CROSS JOIN departments;

SELECT last_name, department_name
FROM employees
         INNER JOIN departments;

SELECT last_name, department_name
FROM employees
         JOIN departments;

# WHERE 加入条件
SELECT employees.last_name, departments.department_name, employees.department_id
FROM employees,
     departments
WHERE employees.department_id = departments.department_id;

DESC employees;
DESC departments;

# 等值连接
SELECT employees.last_name, jobs.job_title, employees.job_id
FROM employees,
     jobs
WHERE employees.job_id = jobs.job_id;

# AND 连接
SELECT employees.last_name, departments.department_name, employees.department_id
FROM employees,
     departments
WHERE employees.department_id = departments.department_id
  AND departments.department_name = 'Shipping';


SELECT e.last_name, d.department_name, e.department_id
FROM employees AS e,
     departments AS d
WHERE e.department_id = d.department_id;

-- last_name,department_name, city
SELECT e.last_name, d.department_name, lc.city
FROM employees AS e,
     departments as d,
     locations as lc
WHERE e.department_id = d.department_id
  AND d.location_id = lc.location_id

-- 非等值连接
SELECT e.last_name, e.salary, j.grade_level AS GRADE
FROM employees AS e,
     job_grades AS j
WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal -- 按工资分档
ORDER BY salary DESC; -- 按照工资排序

SELECT CONCAT(worker.last_name, ' works for '
           , manager.last_name) AS relationship -- 连接为长字符串
FROM employees AS worker,
     employees AS manager
WHERE worker.manager_id = manager.employee_id;

SELECT d.department_name, e.last_name
FROM employees AS e,
     departments AS d
WHERE e.department_id = d.department_id
  AND d.department_name = 'Contracting';


-- 查询出 last_name 为 'Chen' 的员工的 manager 的信息
SELECT CONCAT(worker.last_name, ' works for '
           , manager.last_name) AS relationship -- 连接为长字符串
FROM employees AS worker,
     employees AS manager
WHERE worker.manager_id = manager.employee_id
  AND worker.last_name = 'Chen';


SELECT e.employee_id,
       e.last_name,
       e.department_id,
       d.department_id,
       d.location_id
FROM employees e
         JOIN departments d
              ON (e.department_id = d.department_id);


# 标准 内连接
-- last_name, department_name, city
SELECT e.last_name, d.department_name, lc.city
FROM employees e
         JOIN departments d
              ON e.department_id = d.department_id
         JOIN locations lc
              ON d.location_id = lc.location_id
WHERE e.last_name = 'Chen';


SELECT e.last_name, e.department_id, d.department_name
FROM employees e
         LEFT OUTER JOIN departments d
                         ON e.department_id = d.department_id;

SELECT d.department_name, e.last_name, e.department_id
FROM employees e
         RIGHT OUTER JOIN departments d
                          ON e.department_id = d.department_id;

# UNION
-- 法一：使用 WHERE
SELECT last_name, email, department_id
FROM employees
WHERE email LIKE '%a%'
   OR department_id > 90;

-- 法二：使用 UNION
SELECT last_name, email, department_id
FROM employees
WHERE email LIKE '%a%'
UNION
SELECT last_name, email, department_id
FROM employees
WHERE department_id > 90;


# Venn
SELECT d.department_name, d.department_id, e.department_id
FROM departments d
         LEFT JOIN employees e
                   ON d.department_id = e.department_id
WHERE e.department_id IS NULL

# 并集
SELECT employee_id, last_name, department_name
FROM employees e
         LEFT JOIN departments d
                   ON e.department_id = d.department_id
WHERE d.department_id IS NULL
UNION ALL
SELECT employee_id, last_name, department_name
FROM employees e
         RIGHT JOIN departments d
                    ON e.department_id = d.department_id;

SELECT employee_id, last_name, department_name
FROM employees e
         LEFT JOIN departments d
                   ON e.department_id = d.department_id
UNION
SELECT employee_id, last_name, department_name
FROM employees e
         RIGHT JOIN departments d
                    ON e.department_id = d.department_id;


# 对称差
SELECT employee_id, last_name, department_name
FROM employees e
         LEFT JOIN departments d
                   ON e.department_id = d.department_id
WHERE d.department_id IS NULL
UNION ALL
SELECT employee_id, last_name, department_name
FROM employees e
         RIGHT JOIN departments d
                    ON e.department_id = d.department_id
WHERE e.department_id IS NULL;


# SQL99
SELECT employee_id, last_name, department_name
FROM employees e
         NATURAL JOIN departments d;

SELECT employee_id, last_name, department_name
FROM employees e
         JOIN departments d
              ON e.department_id = d.department_id
                  AND e.manager_id = d.manager_id;


SELECT employee_id, last_name, department_name
FROM employees e
         JOIN departments d
              USING (department_id);


SELECT employee_id, last_name, department_name
FROM employees e,
     departments d
WHERE e.department_id = d.department_id;