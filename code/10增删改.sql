SHOW DATABASES;

USE test;
SHOW TABLES;

SELECT *
FROM dept;

INSERT INTO dept
VALUES (1, 'IT', 'Shanghai');

INSERT INTO dept
VALUES (2, NULL, NULL);

INSERT INTO dept(dept_name, location)
VALUES ('MKT', 'Beijing');

INSERT INTO dept
VALUES (4, 'SALE', 'Guangzhou'),
       (5, 'FINA', 'Shanghai'),
       (6, 'MANA', 'Beijing');


INSERT INTO dept(dept_id, dept_name)
VALUES (7, 'IT'),
       (8, 'ACCT'),
       (9, 'LAW');

INSERT INTO dept
    (dept_name, location)
SELECT dept_name,
       location
FROM dept
WHERE dept_id = 4;

SELECT *
FROM dept;

SET AUTOCOMMIT = FALSE;

UPDATE dept
SET dept_name = 'IT'
WHERE dept_id = 3;

ROLLBACK;

SELECT *
FROM dept;

SET AUTOCOMMIT = FALSE;

UPDATE dept
SET dept_id = 100
WHERE dept_id = 3;

ROLLBACK;

DELETE
FROM dept
WHERE dept_id = 10;

SELECT *
FROM dept;

DROP TABLE IF EXISTS calculate;
CREATE TABLE calculate
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    a  INT,
    b  INT,
    c  INT GENERATED ALWAYS AS (a + b) VIRTUAL
);

SHOW TABLES;

DESC calculate;

INSERT INTO calculate
    (a, b)
VALUES (1, 2),
       (100, 200),
       (120, 310);

SELECT *
FROM calculate;

/* Error
UPDATE calculate
SET c = -100
WHERE id = 3;
 */

UPDATE calculate
SET a = a + 100
WHERE id = 1;