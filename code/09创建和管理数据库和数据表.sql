SHOW DATABASES;
SELECT DATABASE();
SHOW TABLES FROM atguigudb;
SHOW CREATE DATABASE mysql;

CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE emp
(
    emp_id   INT,
    emp_name VARCHAR(20), -- 20 为长度
    salary   DOUBLE,
    birthday DATE
);
SHOW TABLES;
DESC emp;

CREATE TABLE dept
(
    dept_id   INT AUTO_INCREMENT, -- 增加约束条件: 自增
    dept_name VARCHAR(14),
    location  VARCHAR(13),
    PRIMARY KEY (dept_id)         -- 表的约束条件: 指定 deptno 为主键
);
DESC dept;

CREATE TABLE emp_high_salary
AS
SELECT e.employee_id, e.last_name, e.department_name, e.salary, e.hire_date
FROM atguigudb.employees e
WHERE e.salary > 13000;

DESC emp_high_salary;

SELECT *
FROM test.emp_high_salary;

SHOW CREATE TABLE emp_high_salary;

SELECT *
FROM emp;

ALTER TABLE emp
    ADD job_id varchar(15)
        AFTER salary;

ALTER TABLE emp_high_salary
    MODIFY salary double(9, 2) DEFAULT 1000
        AFTER last_name;

SELECT *
FROM emp_high_salary;
DESC emp_high_salary;

ALTER TABLE emp_high_salary
    CHANGE department_name dept_name varchar(15);

ALTER TABLE emp
    DROP job_id;
DESC emp;

RENAME TABLE emp
    TO employee_info;

DESC employee_info;

ALTER table employee_info
    RENAME emp;

SHOW TABLES;

# DROP TABLE IF EXISTS emp_high_salary;

SELECT *
FROM emp_high_salary;

-- 开始事务，暂不提交
START TRANSACTION;

-- DELETE 删除
DELETE
FROM emp_high_salary
WHERE employee_id = 100;
SELECT *
FROM emp_high_salary;
-- 查看结果

-- 回滚
ROLLBACK;
SELECT *
FROM emp_high_salary; -- 查看结果



