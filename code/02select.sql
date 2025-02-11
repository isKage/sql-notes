# 01 基本的SELECT语句

# 1. SQL的分类
/*
DDL:数据定义语言。CREATE \ ALTER \ DROP \ RENAME \ TRUNCATE

DML:数据操作语言。INSERT \ DELETE \ UPDATE \ SELECT （重中之重）

DCL:数据控制语言。COMMIT \ ROLLBACK \ SAVEPOINT \ GRANT \ REVOKE

*/

/*
2.1 SQL的规则 ----必须要遵守
- SQL 可以写在一行或者多行。为了提高可读性，各子句分行写，必要时使用缩进
- 每条命令以 ; 或 \g 或 \G 结束
- 关键字不能被缩写也不能分行
- 关于标点符号
  - 必须保证所有的()、单引号、双引号是成对结束的
  - 必须使用英文状态下的半角输入方式
  - 字符串型和日期时间类型的数据可以使用单引号（' '）表示
  - 列的别名，尽量使用双引号（" "），而且不建议省略as

2.2 SQL的规范  ----建议遵守
- MySQL 在 Windows 环境下是大小写不敏感的
- MySQL 在 Linux 环境下是大小写敏感的
  - 数据库名、表名、表的别名、变量名是严格区分大小写的
  - 关键字、函数名、列名(或字段名)、列的别名(字段的别名) 是忽略大小写的。
- 推荐采用统一的书写规范：
  - 数据库名、表名、表别名、字段名、字段别名等都小写
  - SQL 关键字、函数名、绑定变量等都大写

3. MySQL的三种注释的方式
 */

# use dbtest1;

# select * from employees;

# insert into employees values (1002, 'Jerry');

# show databases;

select 1, 1 + 1;

select 1, 1 + 2
from dual; # dual 伪表

/*
4. 导入现有的数据表、表的数据。
方式1：source 文件的全路径名
举例：source ./atguigudb.sql;


方式2：基于具体的图形化界面的工具可以导入数据
*/

USE atguigudb;

SELECT *
from employees;

SELECT employee_id, last_name, salary
from employees;

select
    employee_id emp_id,
    last_name as lname,
    department_id "dept_id",
    salary * 12 "annual salary"
from employees;

select department_id
from employees;

SELECT DISTINCT department_id
FROM employees;

# distinct 对后面所有字段去重
select distinct department_id, salary
from employees;

# 空值参与运算 -> result = null
SELECT employee_id, salary "月工资", salary * (1 + commission_pct) * 12 "年工资", commission_pct
FROM employees;

# 着重号 `
SELECT *
FROM `order`;

# 查询常数 字符串用单引号 ''

select 123 AS 'temp_const', employee_id, last_name, salary
from employees;


DESCRIBE employees;
DESC employees;


# 过滤数据
select *
from employees
# 过滤条件
where department_id = 90;

select *
from employees
where last_name = 'King';

select *
from employees
where last_name = 'King' and first_name = 'Steven';
