-- information_schema 数据库名（系统库）
-- table_constraints 表名称（专门存储各个表的约束）

USE atguigudb;

SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'employees';

SHOW TABLES;

-- NOT NULL
CREATE TABLE emp
(
    id   INT(10)     NOT NULL,
    NAME VARCHAR(20) NOT NULL,
    sex  CHAR        NULL
);

ALTER TABLE emp
    MODIFY sex VARCHAR(30) NOT NULL;


ALTER TABLE emp
    MODIFY sex VARCHAR(30) NULL;

-- unique
CREATE TABLE user_unique
(
    id       INT NOT NULL,
    NAME     VARCHAR(25),
    PASSWORD VARCHAR(16),
    -- 使用表级约束语法
    CONSTRAINT uk_name_pwd UNIQUE (NAME, PASSWORD)
);

SELECT *
FROM user_unique;

SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'user_unique';

ALTER TABLE user_unique
    ADD UNIQUE (NAME, PASSWORD);

ALTER TABLE user_unique
    ADD CONSTRAINT uk_name_pwd UNIQUE (NAME, PASSWORD);

ALTER TABLE user_unique
    MODIFY NAME char(10) UNIQUE;

-- 索引
SHOW INDEX FROM user_unique;
-- 删除 UNIQUE
ALTER TABLE user_unique
    DROP INDEX uk_name_pwd;

-- primary
DROP TABLE temp_primary;
create table temp_primary
(
    id   INT,
    name VARCHAR(20),
    age  INT,
    CONSTRAINT temp_pri PRIMARY KEY (id, name)
);

DESC temp_primary;

SHOW INDEX FROM temp_primary;

SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'temp_primary';

-- foreign

CREATE TABLE dept_foreign
(
    d_id   INT PRIMARY KEY,
    d_name VARCHAR(50)
);

DROP TABLE IF EXISTS emp_foreign;
CREATE TABLE emp_foreign
(
    e_id    INT PRIMARY KEY,
    e_name  VARCHAR(5),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept_foreign (d_id) ON UPDATE CASCADE ON DELETE RESTRICT
);


SHOW INDEX FROM emp_foreign;

SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'emp_foreign';

ALTER TABLE emp_foreign
    ADD CONSTRAINT emp_foreign_key FOREIGN KEY (dept_id) REFERENCES dept_foreign (d_id);

# delete
-- 1. 查看约束名
SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'emp_foreign';

-- 2. 删除外键约束
ALTER TABLE emp_foreign
    DROP FOREIGN KEY emp_foreign_ibfk_1;

-- 3. 查看索引名
SHOW INDEX FROM emp_foreign;

-- 4. 删除索引
ALTER TABLE emp_foreign
    DROP INDEX dept_id;

-- auto increment
DROP TABLE IF EXISTS emp_increment;
create table emp_increment
(
    e_id   INT PRIMARY KEY,
    e_name VARCHAR(20)
);

ALTER TABLE emp_increment
    MODIFY e_id INT AUTO_INCREMENT;

DESC emp_increment;

ALTER TABLE emp_increment
    MODIFY e_id INT;
-- 去掉 AUTO_INCREMENT 相当于删除


-- check
DROP TABLE IF EXISTS emp_check;
CREATE TABLE emp_check
(
    e_id   INT PRIMARY KEY,
    e_name VARCHAR(5),
    gender CHAR CHECK (gender in ('男', '女'))
);

INSERT INTO emp_check
VALUES (1, 'Mike', '男');

# INSERT INTO emp_check
# VALUES (1, 'Mike', 'M');

-- default
DROP TABLE IF EXISTS emp_default;
CREATE TABLE emp_default
(
    e_id   INT PRIMARY KEY,
    e_name VARCHAR(20) NOT NULL,
    sal    FLOAT                DEFAULT 0.0,
    tel    CHAR(11)    NOT NULL DEFAULT '123'
);

DESC emp_default;

ALTER TABLE emp_default
    MODIFY sal FLOAT DEFAULT 1.0;

ALTER TABLE emp_default
    MODIFY sal FLOAT;