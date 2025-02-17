SHOW DATABASES;
USE atguigudb;
SHOW TABLES;

-- 1. 之前所学：自连接
SELECT e2.last_name, e2.salary
FROM employees e1,
     employees e2
WHERE e1.last_name = 'Abel'
  AND e1.salary < e2.salary;

-- 2. 子查询
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');

-- 多条件
SELECT last_name, salary, job_id
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 103)
  AND salary < (SELECT salary
                FROM employees
                WHERE employee_id = 100);

SELECT last_name, salary
FROM employees
WHERE salary = (SELECT MIN(salary)
                FROM employees);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE manager_id IN
      (SELECT manager_id
       FROM employees
       WHERE employee_id IN (174, 141))
  AND department_id IN
      (SELECT department_id
       FROM employees
       WHERE employee_id IN (174, 141))
  AND employee_id NOT IN (174, 141);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE (manager_id, department_id) IN
      (SELECT manager_id, department_id
       FROM employees
       WHERE employee_id IN (141, 174))
  AND employee_id NOT IN (141, 174);

SELECT manager_id, department_id
FROM employees
WHERE employee_id IN (141, 174);

SELECT department_id, MIN(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING MIN(salary) >
       (SELECT MIN(salary)
        FROM employees
        WHERE department_id = 50);

SELECT employee_id,
       last_name,
       CASE department_id
           WHEN
               (SELECT department_id
                FROM departments
                WHERE location_id = 1800)
               THEN 'Canada'
           ELSE 'USA' END location
FROM employees;

SELECT last_name, salary
FROM employees
WHERE salary >
      (SELECT salary
       FROM employees
       WHERE last_name = 'Nobody');

SELECT e.last_name, e.salary, e.job_id
FROM employees e
WHERE salary < ANY
      (SELECT e.salary
       FROM employees e
       WHERE e.job_id = 'IT_PROG')
  AND e.job_id != 'IT_PROG'
ORDER BY e.salary DESC;

-- condition
SELECT e.salary
FROM employees e
WHERE e.job_id = 'IT_PROG';

SELECT e.last_name, e.salary, e.job_id
FROM employees e
WHERE salary < ALL
      (SELECT e.salary
       FROM employees e
       WHERE e.job_id = 'IT_PROG')
  AND e.job_id != 'IT_PROG'
ORDER BY e.salary DESC;

SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MIN(avg_sal)
                      FROM (SELECT AVG(salary) avg_sal
                            FROM employees
                            GROUP BY department_id) dept_avg_sal);

SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL (SELECT AVG(salary) avg_sal
                           FROM employees
                           GROUP BY department_id);

SELECT last_name, salary, e1.department_id
FROM employees e1,
     (SELECT department_id, AVG(salary) dept_avg_sal
      FROM employees
      GROUP BY department_id) e2
WHERE e1.department_id = e2.department_id
  AND e1.salary > e2.dept_avg_sal
ORDER BY salary DESC;

SELECT e.last_name, e.salary, e.department_id
FROM employees e
WHERE salary >
      (SELECT AVG(salary)
       FROM employees
       WHERE department_id = e.department_id)
ORDER BY salary DESC;

SELECT employee_id, salary
FROM employees e
ORDER BY (SELECT d.department_name
          FROM departments d
          WHERE e.department_id = d.department_id);

SELECT employee_id, last_name
FROM employees e1
WHERE EXISTS (SELECT *
              FROM employees e2
              WHERE e2.manager_id =
                    e1.employee_id);

SELECT DISTINCT e1.employee_id, e1.last_name
FROM employees e1
         JOIN employees e2
WHERE e1.employee_id = e2.manager_id;

SELECT employee_id, last_name
FROM employees
WHERE employee_id IN
      (SELECT DISTINCT manager_id
       FROM employees);

-- add new column
ALTER TABLE employees
    ADD(department_name VARCHAR(50));

DESC employees;

SELECT *
FROM employees;

UPDATE employees e
SET department_name =
        (SELECT department_name
         FROM departments d
         WHERE e.department_id = d.department_id);

SELECT *
FROM employees;


