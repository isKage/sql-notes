## SELECT语句

本文笔记根据[【b站 尚硅谷-宋红康 MySQL 课程】]( https://www.bilibili.com/video/BV1iq4y1u7vj/?share_source=copy_web&vd_source=67ce2d561f3b6dc9d7cff375959101a2)整理

## 1 SQL 语言

### 1.1 书写规则

- 一行或多行
- 以 `;` 分隔
- 字符串型 和 日期时间类型 的数据使用 `''` 表示
- 列的别名使用 `""` 表示
- 建议关键字、函数名大写

### 1.2 注释

单行注释

```sql
# 注释文字 (MySQL特有)
-- 注释文字
```

多行注释

```sql
/* 注释文字 */
```

### 1.3 数据导入 (运行`.sql`文件)

登陆 `MySQL` 后，输入指令

```sql
mysql> source xx.sql  -- 输入路径
```

在学习语句前，先下载 [mydb.sql 文件](https://cloud-iskage.oss-cn-shanghai.aliyuncs.com/docs/mydb.sql) ，之后使用数据导入的方式，运行 `mydb.sql` 创建数据库 `atguigudb` 以便后续操作。

```sql
mysql> source ./xxx/mydb.sql  -- mac 电脑
mysql> source C:\Users\Username\xxx\mydb.sql  -- windows 电脑
```

> 该文件来自 [【b站 尚硅谷-宋红康 MySQL 课程】]( https://www.bilibili.com/video/BV1iq4y1u7vj/?share_source=copy_web&vd_source=67ce2d561f3b6dc9d7cff375959101a2)



## 2 基本 SELECT 语句

> 首先先进入刚刚创建的数据库 `atguigudb` 

```sql
mysql> USE atguigudb;
```

### 2.1 SELECT ... FROM ...

```sql
SELECT 选择哪些列
FROM 从哪个表中选择
```

- 选择所有列

```sql
SELECT *
FROM employees;
```

- 选择表中特定的列

```sql
SELECT employee_id, last_name, salary
FROM employees;
```

### 2.2 列的别名

可以在列名后紧跟别名，也可以使用关键字 `AS`

```sql
SELECT
    employee_id emp_id,
    last_name AS lname,
    department_id "dept_id"
FROM employees;
```

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738834180268.png)

也可以对整列进行计算

```sql
SELECT
    employee_id emp_id,
    salary * 12 "annual salary"  -- 对 salary 整列计算
FROM employees;
```

### 2.3 去除重复行

默认情况不会去除重复行

在 `SELECT` 语句中增加关键字 `DISTINCT` 即可返回去除重复行后的结果

```sql
SELECT DISTINCT department_id
FROM employees;
-- 12 rows
```

> 注：若 `DISTINCT` 后存在多个字段，只要两行之间有某个字段不同，则不认为重复

```sql
SELECT DISTINCT department_id, salary
FROM employees;
-- 74 rows
```

例如：对 `department_id, salary` 去重，虽然部门只有 `12` 个，但因为 `salary` 仍有一些不同，故认为并不重复。

### 2.4 空值 `null` 参与计算

遇到 `null` 值，运算的结果都为 `null`

```sql
SELECT employee_id, salary "月工资", salary * (1 + commission_pct) * 12 "年工资", commission_pct
FROM employees;
```

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738834695370.png)

### 2.5 着重号 ` `` ` 解决关键字冲突

如果不得不使用关键字命名，则可以使用 ` `` ` 

```sql
SELECT *
FROM order;
-- 报错
```

```sql
SELECT *
FROM `order`;
-- 正确
```

### 2.6 增加常值列

增加一列命名为 `temp_const` （字符串用 `''`）用数字 `123` 填充

```sql
SELECT 123 AS 'temp_const', employee_id, last_name, salary
FROM employees;
```

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738835171143.png)



## 3 查询表结构

使用 `DESCRIBE` 或 `DESC` 命令，查询表结构

```sql
DESCRIBE employees;
DESC employees;
```

```sql
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| employee_id    | int         | NO   | PRI | 0       |       |
| first_name     | varchar(20) | YES  |     | NULL    |       |
| last_name      | varchar(25) | NO   |     | NULL    |       |
| email          | varchar(25) | NO   | UNI | NULL    |       |
| phone_number   | varchar(20) | YES  |     | NULL    |       |
| hire_date      | date        | NO   |     | NULL    |       |
| job_id         | varchar(10) | NO   | MUL | NULL    |       |
| salary         | double(8,2) | YES  |     | NULL    |       |
| commission_pct | double(2,2) | YES  |     | NULL    |       |
| manager_id     | int         | YES  | MUL | NULL    |       |
| department_id  | int         | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
11 rows in set (0.00 sec)
```



## 4 `WHERE` 过滤条件

```sql
SELECT 列名1, 列名2, 列名3
FROM 表名
WHERE 过滤条件
```

例如：

```sql
SELECT *
FROM employees
where last_name = 'King' and first_name = 'Steven'; -- 过滤条件
```

```sql
SELECT *
FROM employees
WHERE department_id = 90; -- 过滤条件
```















