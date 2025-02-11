# MySQL 安装

MySQL 是数据库管理系统 DSMS 之一，本文介绍如何 **下载、安装、配置、登陆、使用** MySQL

## 1 下载

1. 前往官网：https://www.mysql.com
2. 点击 - [Downloads](https://www.mysql.com/downloads/)

点击 - [MySQL Community (GPL) Downloads](https://dev.mysql.com/downloads/)

社区版免费，且功能近似，适合学习使用。

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738735763767.png)

3. 点击 - [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738735912017.png)

4. 选择版本

推荐使用 `8.0.x` 版本，相比旧版本 `5.0.x` 更为完善。点击 - [Go to Download Page](https://dev.mysql.com/downloads/windows/installer/8.0.html)

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738736158523.png)

选择 `.msi` 的安装程序。选择图中的程序下载，配有图形化安装流程，支持离线安装。

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/QQ_1738736235034.png)

> 注：下载需要注册 ORACLE 甲骨文公司账户



## 2 安装

1. 找到文件 `mysql-installer-community-8.0.41.0.msi` ，双击进入安装。
2. 在 [Choosing a Setup Type] - 窗口中选择 自定义安装 [Custom]

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/6fb510a37d115e06be126a4e7bde91eb.png)

3. 在 [Select Products] 窗口中，选择产品。从左边选择想要安装的产品，而后显示在右边。

> 注：如想自定义安装路径，见后。

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/0dddb331420bff1755778e44b880e51b_720.png)

自定义安装路径，则需要选择产品，点击 [Advanced Options]

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/ba921bd680af66e88223a0b7e3720285_720.png)

4. 在 [Installation] 窗口，点击 [Execute] 开始安装

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/f32f54e134c74322b24711806c2996ce_720.png)

安装完成点击 [Next]

5. 在 [Product Configuration] 窗口，开始配置，点击 [Next]

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/29078465616e9aff29a15b4119d4f07a_720.png)

保持默认即可，点击 [Next]

[Config Type] 为主机类型，[Port: 3306] 为端口号

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/9bcda347f6bbca58df8843f38c178a78_720.png)

6. 在 [Authentication Method] 窗口，可以设置授权方式。默认，直接点击 [Next]

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/f1754354d7e0302717a9c1fc4c528c02_720.png)

7. 在 [Accounts and Roles] 界面设置管理员密码。用于登陆 MySQL 服务

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/dfb3117e767af332e6b2822ff27a0654_720.png)

8. 在 [Windows Service] 界面设置 [服务] ，保持默认即可。

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/d3129dd2ba331425f9e7892a0b81b087_720.png)

9. 在 [Server File Permissions] 中授权，保持默认即可

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/33bcd45652a5178ddd35788211bbfc93_720.png)

10. 在 [Apply Configuration] 点击 [Execute] 执行之前的配置

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/79ce3831a4322e41691869175c54a604_720.png)

点击 [Finish] 完成配置

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/e7357753070eaa02ec50024aa28556a2_720.png)

11. 完成安装

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/40579a68dcdadf9f09e6c3c517e83525_720.png)

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/494e644125931e21cf86124bb5e9d67c.png)

## 3 环境变量

没有配置 MySQL 到环境变量中，终端无法运行 MySQL 命令。

1. 右键 [此电脑] ，选择 [属性] 
2. 打开 [系统] 窗口，点击 [高级系统设置] 

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/4ba1d54ca6830505fae9a8bc721ad076_720.png)

3. 打开 [系统属性] ，选择 [高级] 选项，点击 [环境变量] 
4. 在 [环境变量] 窗口，选择 [path] 
5. 点击 [编辑] ，在 [编辑环境变量] 窗口中，将 MySQL 的 bin 目录添加进去，使用分号 `;` 划分

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/3648923a3ca1b07903f3e18b967dd1f9.png)

输入 MySQL 的 bin 目录 (根据自己的目录输入)，如果没有更改默认下载路径，则一般为

```text
C:\Program Files\MySQL\MySQL Server 8.0\bin
```

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/e1c8475465d768bc72da4b2b085ae4a1.png)

6. 点击 [确认] ，回到终端尝试使用 MySQL 指令

检查是否成功，输入

```sql
> mysql -V
```

返回版本信息则代表成功

```sql
C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe  Ver 8.0.41 for Win64 on x86_64 (MySQL Community Server - GPL)
```



## 4 查看服务

需要启动服务，才能登陆 MySQL 并连接数据库。在之前配置时，已经默认服务启动。

可以检查一下：右键 [此电脑] 点击 [管理] ，双击 [服务和应用程序] ，双击 [服务] ，找到 MySQL 的服务 （默认情况下为 `MySQL80`）

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/c94326af2e1953a05b2a0a087f366e8c_720.png)

也可以使用终端实现。右键 [终端]/[命令行工具] 使用 **以管理员身份运行** ，而后使用如下命令

```sql
# 启动服务 MySQL80 为 MySQL 的服务名
> net start MySQL80

# 停止服务 MySQL80 为 MySQL 的服务名
> net stop MySQL80
```

![](https://blog-iskage.oss-cn-hangzhou.aliyuncs.com/images/4639db1363ba088fad5f91904369a021_720.png)

## 5 登陆 MySQL

打开 [终端] 输入

```sql
mysql -h 主机名 -P 端口名 -u 用户名 -p密码
```

一般而言 主机名为 `localhost` ，端口名为 `3306` ，用户名为 `root` ，密码和 `-p` 之间不能有空格。

推荐使用

```sql
mysql -u root -p
```

进行登陆，之后输入密码即可登陆。

```sql
> mysql -u root -p
Enter password: *******
```

登陆成功后为

```sql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```



## 6 简单尝试

1. 查看已有数据库:

```sql
show databases;
```

```sql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
```

2. 创建数据库:

```sql
create database 数据库名 DEFAULT CHARSET utf8 COLLATE utf8_general_ci;  
```

或者

```sql
create database 数据库名
```

3. 删除数据库:

```sql
drop database 数据库名;
```

4. 进入数据库:

```sql
use 数据库名;
```

5. 查看数据库下所有数据表:

```sql
show tables;
```

```sql
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| tb1            |
+----------------+
```

6. 创建表:

```sql
create table 表名(
  列名 类型,
  列名 类型,
  列名 类型
) default charset=utf8;
```

- e.g.

```sql
create table tb1(
    id int,
    name varchar(16),
    age int
) default charset=utf8;
```

- 不能为空/允许为空

```sql
create table tb1(
    id int,
    name varchar(16) not null, -- 不能为空
    age int null        			 -- 可以为空
) default charset=utf8;
```

- 默认值

```sql
create table tb1(
    id int,
    name varchar(16) not null,
    age int default 3       			 -- 设置默认为3
) default charset=utf8;
```

- 主键

```sql
create table tb1(
    id int primary key,       -- 不能为空，不能重复
    name varchar(16),
    age int
) default charset=utf8;
```

- 一般设置，主键+自增 `标准`

```sql
create table tb1(
    id int auto_increment primary key,
    name varchar(16),
    age int
) default charset=utf8;
```

7. 删除表

```sql
drop table 表名;
```

8. 展示表信息

```sql
desc 表名;
```

```sql
mysql> desc tb1;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(16) | YES  |     | NULL    |                |
| age   | int         | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)
```

















