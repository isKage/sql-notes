SHOW DATABASES;

USE test;

SHOW TABLES;

-- 1 整数
-- 1.1 M
CREATE TABLE test_int1
(
    x TINYINT,
    y SMALLINT,
    z MEDIUMINT,
    m INT,
    n BIGINT
);
DESC test_int1;

-- 1.2 ZEROFILL
CREATE TABLE test_int2
(
    f1 INT,
    f2 INT(5),
    f3 INT(5) ZEROFILL
);
DESC test_int2;

INSERT INTO test_int2(f1, f2, f3)
VALUES (1, 123, 123);

INSERT INTO test_int2(f1, f2)
VALUES (123456, 123456);

INSERT INTO test_int2(f1, f2, f3)
VALUES (123456, 123456, 123456);

SELECT *
FROM test_int2;

-- 1.3 UNSIGNED
CREATE TABLE test_int3
(
    f1 INT UNSIGNED
);
DESC test_int3;

-- 2 浮点类型
CREATE TABLE test_double1
(
    f1 FLOAT,
    f2 FLOAT(5, 2),
    f3 DOUBLE,
    f4 DOUBLE(5, 2)
);

DESC test_double1;

INSERT INTO test_double1
VALUES (123.456, 123.456, 123.4567, 123.45);

# Out of range value for column 'f2' at row 1
INSERT INTO test_double1
VALUES (123.456, 1234.456, 123.4567, 123.45);

SELECT *
FROM test_double1;

-- 3 定点数
CREATE TABLE test_decimal1
(
    f1 DECIMAL,
    f2 DECIMAL(5, 2)
);

DESC test_decimal1;

INSERT INTO test_decimal1(f1, f2)
VALUES (123.123, 123.456);

SELECT *
FROM test_decimal1;

-- 4 位类型
CREATE TABLE test_bit1
(
    f1 BIT,
    f2 BIT(5),
    f3 BIT(64)
);

DESC test_bit1;

INSERT INTO test_bit1(f1)
VALUES (1);

INSERT INTO test_bit1(f2)
VALUES (23);

SELECT *
FROM test_bit1;

SELECT BIN(f2), HEX(f2), f2 + 0
FROM test_bit1;

-- 5 时间日期
-- 5.1 year
CREATE TABLE test_year
(
    f1 YEAR,
    f2 YEAR(4)
);

DESC test_year;

INSERT INTO test_year
VALUES ('2020', '2021');

INSERT INTO test_year
VALUES ('45', '71');

INSERT INTO test_year
VALUES (0, '0');

SELECT *
FROM test_year;

-- 5.2 date
CREATE TABLE test_date1
(
    f1 DATE
);

INSERT INTO test_date1
VALUES ('2020-10-01'),
       ('20201001'),
       (20201001);

INSERT INTO test_date1
VALUES (CURRENT_DATE()),
       (NOW());

SELECT *
FROM test_date1;

-- 5.3 time
CREATE TABLE test_time1
(
    f1 TIME
);

INSERT INTO test_time1
VALUES ('2 12:30:29'),
       ('12:35:29'),
       ('12:40'),
       ('2 12:40'),
       ('1 05'),
       ('45');

INSERT INTO test_time1
VALUES ('123520'),
       (124011),
       (1210);

INSERT INTO test_time1
VALUES (NOW()),
       (CURRENT_TIME());

SELECT *
FROM test_time1;

-- 5.4 datetime
CREATE TABLE test_datetime1
(
    dt DATETIME
);

INSERT INTO test_datetime1
VALUES ('2024-04-01 06:50:30'),
       ('20240401065030');

INSERT INTO test_datetime1
VALUES (20240402065030);

INSERT INTO test_datetime1
VALUES (CURRENT_TIMESTAMP()),
       (NOW());

-- 5.5 timestamp
CREATE TABLE test_timestamp1
(
    ts TIMESTAMP
);

INSERT INTO test_timestamp1
VALUES ('1970-01-02 03:04:50'),
       ('19700102030405');

INSERT INTO test_timestamp1
VALUES (CURRENT_TIMESTAMP()),
       (NOW());

# Incorrect datetime value
# INSERT INTO test_timestamp1
# VALUES ('2038-01-20 03:14:07');

SELECT *
FROM test_timestamp1;

# SET time_zone = '+9:00';

-- 6 文本字符串类型

-- 6.1 char and varchar
CREATE TABLE test_char1
(
    c1 CHAR,
    c2 CHAR(5)
);

DESC test_char1;

INSERT INTO test_char1
VALUES ('a', 'test');


INSERT INTO test_char1(c2)
VALUES ('a  ');

SELECT CHAR_LENGTH(c2)
FROM test_char1;

-- 6.2 text
CREATE TABLE test_text
(
    tx TEXT
);

INSERT INTO test_text
VALUES ('With space on the right.    ');

SELECT CHAR_LENGTH(tx)
FROM test_text; # 28

SELECT *
FROM test_text;

-- 6.3 enum
CREATE TABLE test_enum
(
    season ENUM ('春', '夏', '秋', '冬', 'unknown')
);

SELECT *
FROM test_enum;

# 按照值插入
INSERT INTO test_enum
VALUES ('春'),
       ('秋');

INSERT INTO test_enum
VALUES ('unknown');

# 允许按照数字索引的方式获取指定位置的枚举值
INSERT INTO test_enum
VALUES ('1'),
       (3);

# 报错：未知数字索引
INSERT INTO test_enum
VALUES ('a');

# 当 ENUM 类型的字段没有声明为 NOT NULL 时，可以插入 NULL
INSERT INTO test_enum
VALUES (NULL);

-- 6.4 set
CREATE TABLE test_set
(
    s SET ('A', 'B', 'C')
);

INSERT INTO test_set (s)
VALUES ('A'),
       ('A,B');


# 插入重复的 SET 类型成员时，自动删除重复的成员
INSERT INTO test_set (s)
VALUES ('A,B,C,A');

-- 报错：插入 SET 成员中不存在的值
INSERT INTO test_set (s)
VALUES ('A, B, C, D');

SELECT *
FROM test_set;

-- 7.1 binary
CREATE TABLE test_binary1
(
    f1 BINARY,
    f2 BINARY(3),
    f3 VARBINARY(10)
);

INSERT INTO test_binary1(f1, f2)
VALUES ('a', 'a');

INSERT INTO test_binary1(f1, f2)
VALUES ('2', '256');

INSERT INTO test_binary1(f2, f3)
VALUES ('8', '中文');

INSERT INTO test_binary1(f2, f3)
VALUES (8, 1024);

SELECT *
FROM test_binary1;

SELECT BIN(f1), BIN(f2), BIN(f3)
FROM test_binary1;

-- 8 JSON
CREATE TABLE test_json
(
    js JSON
);

INSERT INTO test_json (js)
VALUES ('{
  "name": "Mike",
  "age": 21,
  "contact": {
    "tel": "123456789",
    "email": "123@work.com"
  }
}');

SELECT *
FROM test_json;

SELECT js -> '$.name'          AS name,
       js -> '$.age'           AS age,
       js -> '$.contact.tel'
                               AS tel,
       js -> '$.contact.email' AS email
FROM test_json;