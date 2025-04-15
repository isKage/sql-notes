SHOW DATABASES;
USE atguigudb;
SHOW TABLES;

-- 1 视图概述
-- 1.1 数据库对象
-- 1.2 视图
-- 2 创建视图
CREATE VIEW emp_dept_id80
AS
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

SELECT *
FROM emp_dept_id80;

CREATE VIEW emp_year_salary (emp_name, year_salary)
AS
SELECT last_name, salary * 12 * (1 + IFNULL(commission_pct, 0))
FROM employees;

SELECT *
FROM emp_year_salary;

CREATE VIEW emp_dept_name
AS
SELECT e.employee_id emp_id, e.last_name emp_name, d.department_name dept_name
FROM employees e,
     departments d
WHERE e.department_id = d.department_id;

SELECT *
FROM emp_dept_name;


CREATE VIEW dept_sal (dept_name, min_sal, max_sal, avg_sal)
AS
SELECT d.department_name, MIN(e.salary), MAX(e.salary), AVG(e.salary)
FROM employees e,
     departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name;

SELECT *
FROM dept_sal;

CREATE VIEW employee_department_name
AS
SELECT CONCAT(e.last_name, '(', d.department_name, ')') AS emp_dept
FROM employees e
         JOIN departments d
WHERE e.department_id = d.department_id;


SELECT *
FROM employee_department_name;

CREATE VIEW emp_dept_year_salary
AS
SELECT edn.emp_name, edn.dept_name, eys.year_salary
FROM emp_dept_name AS edn
         INNER JOIN emp_year_salary AS eys
                    ON edn.emp_name = eys.emp_name;

SELECT *
FROM emp_dept_year_salary;

-- 3 查看视图
SHOW TABLES;

DESC emp_dept_year_salary;
DESCRIBE emp_dept_year_salary;


SHOW TABLE STATUS LIKE "emp_dept_year_salary";

SHOW CREATE VIEW emp_dept_year_salary;

-- 4 更新视图的数据
CREATE TABLE view_test
(
    name VARCHAR(10),
    age  INT,
    tel  VARCHAR(20)
);

SELECT *
FROM view_test;

DROP VIEW IF EXISTS view_changed;

CREATE VIEW view_changed
AS
SELECT *
FROM view_test
WHERE age < 30;

SELECT *
FROM view_changed;

UPDATE view_changed
SET tel = '0000000'
WHERE name = 'Sarah';

INSERT view_changed
VALUES ('TEST', 0, '???');

DELETE
FROM view_changed
WHERE name = 'TEST';

CREATE OR REPLACE VIEW view_changed
AS
SELECT *
FROM view_test
WHERE age > 30;

SELECT *
FROM view_changed;

ALTER VIEW view_changed
    AS
        SELECT *
        FROM view_test
        WHERE age > 30;

-- 5 修改删除视图
DROP VIEW IF EXISTS view_changed;