/*===========================================*/
/*                表空间                     */
/*===========================================*/
------------- 表空间分类 --------------
/******************
/* 永久表空间
/* 临时表空间
/* UNDO表空间
*******************/
-- 查看用户表空间 
DESC DBA_TABLESPACES;
SELECT TABLESPACE_NAME FROM DBA_TABLESPACES;

DESC USER_TABLESPACES;
SELECT TABLESPACE_NAME FROM USER_TABLESPACES;

DESC DBA_USERS;
DESC USER_USER;
SELECT DEFAULT_TABLESPACE, TEMPORARY_TABLESPACE FROM DBA_USERS WHERE USERNAME = 'SYSTEM';
SELECT DEFAULT_TABLESPACE, TEMPORARY_TABLESPACE FROM DBA_USERS WHERE USERNAME = 'SCOTT';
SELECT DEFAULT_TABLESPACE, TEMPORARY_TBALESPACE FROM USER_USERS WHERE USERNAME = 'SYSTEM';
SELECT DEFAULT_TABLESPACE, TEMPORARY_TBALESPACE FROM USER_USERS WHERE USERNAME = 'SCOTT';

-- 设置用户的默认或临时表空间
ALTER USER username DEFAULT TABLESPACE tablespcae_name;
ALTER USER username TEMPORARY TABLESPACE tablespace_name;
-- 创建表空间
CREATE TABLESPACE tablespace_name DATAFILE 'filename.dbf' SIZE 10M;
CREATE TEMPORARY TABLESPACE tablespcae_name TEMPFILE 'filename.dbf' SIZE 10M;
-- 查看表空间中的数据文件的路径
DESC DBA_DATA_FILES;
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE TABLESPACE_NAME = tablespace_name;
DESC DBA_TEMP_FILES;
SELECT FIEL_NAME FROM DBD_TEMP_FILES WHERE TABLESPACE_NAME = tablespace_name;
/*===========================================*/
/*                数据类型                   */
/*===========================================*/
-- 字符型数据(固定长度)
CHAR(2000)
NCHAR(1000)
-- 字符型数据(可变长度)
VARCHAR2(4000)
NVARCHAR2(2000)

-- 数值型
NUMBER(p, s)
FLOAT(n)

-- 日期型
DATA
TIMESTAMP

-- 其他类型
BLOB
CLOB


/*===========================================*/
/*              查看表结构                   */
/*===========================================*/
DESC USER_INFO;
/*===========================================*/
/*                    增                     */
/*===========================================*/
-- 创建表
CREATE TABLE user_info (
       ID NUMBER(6,0),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       PRIMARY KEY (ID)
);
-- 插入数据
INSERT INTO table_name [(column1, column2, column3)] 
VALUES (value1, value2, value3);
-- 创建表时复制表
CREATE TABLE table_name 
AS 
SELECT * FROM table_name1;
-- 插入数据时复制表
INSERT INTO table_name [(column1, 
                         column2, 
                         column3)] 
SELECT [(column1, 
         column2, 
         column3)]
FROM table_name1;
/*===========================================*/
/*                    删                     */
/*===========================================*/
TRUNCATE TABLE table_name;      -- 清空表中的数据(效率较高)
DELETE FROM table_name;         -- 清空表中的数据
DELETE FROM table_name WHERE;   -- 删除表中的数据(按条件)
DROP TABLE table_name;          -- 删除表
/*===========================================*/
/*                    查                     */
/*===========================================*/
SELECT [DESTINCT] column_name AS COLUMN_NAME_NEW | * | CASE...WHEN... | DECODE()
FROM table_name TABLE_NAMA_NEW
INNER JOIN table_name1 ON condition
LEFT JOIN table_name2 ON condition
RIGHT JOIN table_name3 ON condition 
FULL JOIN table_name4 ON condition
WHERE condition1                      --LIKE "%_"|BETWEEN...AND...|IN|NOT IN| NOT|AND|OR|
GROUP BY column1, column2
HAVING condition2
ORDER BY [DESC] column1, column2;


CASE column_name
  WHEN ''
    THEN
  WHEN ''
    THEN
  ELSE
END;

CASE 
  WHEN expression1
    THEN
  WHEN expression2
    THEN
  ELSE
END;

DECODE(colum_name, value1, '', value2, '', value3, '', ..., default_value);
/*===========================================*/
/*                    改                     */
/*===========================================*/
-- 修改表
-- 增加字段
ALTER TABLE table_name ADD column_name [DEFAULT] data_type;
-- 修改字段
ALTER TABLE table_name MODIFY colum_name [DEFAULT] data_type;
-- 删除字段
ALTER TABLE table_name DROP COLUMN column_name;
-- 重命名字段
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;
-- 修改表名
RENAME table_name TO new_table_name;
-- 修改表中的数据
UPDATE table_name
SET column1 = value1,
    column2 = value2,
    column3 = value3
WHERE condition;
/*===========================================*/
/*                   约束                    */
/*===========================================*/
/* 约束规则：
/* 1.定义规则
/* 2.确保数据的完整性
*/
-- 查看数据字典
DESC USER_CONSTRAINTS;
SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'USERINFO';
-- 修改主键名称 
ALTER TABLE table_name RENAME CONSTRAINT constraint_name TO new_contraint_name;
----------------- 非空约束-----------------------------------------------------------
-- 创建表时增加非空约束
CREATE TABLE user_info (
       ID NUMBER(6,0),
       USERNAME VARCHAR2(20) NOT NULL,
       USERWD VARCHAR(20) NOT NULL,
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       PRIMARY KEY(ID)
);
-- 修改表时增加非空约束
ALTER TABLE table_name MODIFY colum_name [DEFAULT] data_type NOT NULL;
ALTER TABLE table_name MODIFY colum_name [DEFAULT] data_type NULL;
------------------- 主键约束 ----------------------------------
-- 创建表时增加主键约束
CREATE TABLE user_info (
       ID NUMBER(6,0) PRIMARY KEY,
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
);
CREATE TABLE user_info (
       ID NUMBER(6,0),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       CONSTRAINT pk_id_username PRIMARY KEY(ID,USERNAME)
);
-- 修改表时增加主键约束
ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY(column1, column2,...);
-- 删除主键约束
SELECT CONSTRAINT_NAME, STATUS FROM USER_CONTRAINTS WHERE TABLE_NAME = table_name;

ALTER TABLE table_name DISABLE CONSTRAINT constraint_name;
ALTER TABLE table_name ENABLE CONSTRAINT constraint_name;
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
ALTER TABLE table_name DROP PRIMARY KEY primary_key_name;

--------------------------------- 外键约束-------------------------------------------
-- 创建表时增加外键约束
CREATE TABLE follow_table (
       ID NUMBER(6,0) REFERENCES primary_table(column1),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
);

-- 主表
CREATE TABLE primary_table (
       ID_PRIMARY NUMBER(6, 0),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR2(20),
       CONSTRAINT pk_id_primary PRIMARY KEY(ID_PRIMARY)
);
-- 从表
CREATE TABLE follow_table (
       ID_FOLLOW NUMBER(6,0) PRIMARY KEY,
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       CONSTRAINT fk_id FOREIGN KEY(ID_FOLLOW) REFERENCES primary_table(ID_PRIMARY) [ON DELETE CASCADE]
);
-- 修改表时增加外键约束
ALTER TABLE table_name 
ADD CONSTRAINT fk_id 
FOREIGN KEY(ID_FOLLOW) 
REFERENCES primary_table(ID_PRIMARY) [ON DELETE CASCADE];
-- 删除外键约束
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS FROM USER_CONTRAINTS WHERE TABLE_NAME = table_name;

ALTER TABLE table_name DISABLE CONSTRAINT constraint_name;
ALTER TABLE table_name ENABLE CONSTRAINT constraint_name;
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
--------------------------------- 唯一约束------------------------------------------------------
-- 创建表时增加唯一约束
CREATE TABLE user_info (
       ID NUMBER(6,0) PRIMARY KEY,
       USERNAME VARCHAR2(20) UNIQUE,
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       PRIMARY KEY (ID)
);
CREATE TABLE user_info (
       ID NUMBER(6,0),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       CONSTRAINT un_id_name UNIQUE(ID),
       CONSTRAINT un_username_name UNIQUE(USERNAME)
);
-- 修改表时增加唯一约束
ALTER TABLE table_name 
ADD CONSTRAINT un_name
UNIQUE(column_name); 

-- 删除唯一约束
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS FROM USER_CONTRAINTS WHERE TABLE_NAME = table_name;

ALTER TABLE table_name DISABLE CONSTRAINT constraint_name;
ALTER TABLE table_name ENABLE CONSTRAINT constraint_name;
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
--------------------------------- 检查约束-------------------------------------------------------
-- 创建表时增加检查约束
CREATE TABLE user_info (
       ID NUMBER(6,0) PRIMARY KEY,
       USERNAME VARCHAR2(20) CHECK(expressions),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       PRIMARY KEY (ID)
);
CREATE TABLE user_info (
       ID NUMBER(6,0),
       USERNAME VARCHAR2(20),
       USERWD VARCHAR(20),
       EMAIL VARCHAR2(30),
       REGDATE DATE DEFAULT SYSDATE,
       CONSTRAINT ck_id_name CHECK(expressions),
       CONSTRAINT ck_username_name CHECK(expression)
);
-- 修改表时增加检查约束
ALTER TABLE table_name 
ADD CONSTRAINT un_name
CHECK(expression);

-- 删除检查约束
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS FROM USER_CONTRAINTS WHERE TABLE_NAME = table_name;

ALTER TABLE table_name DISABLE CONSTRAINT constraint_name;
ALTER TABLE table_name ENABLE CONSTRAINT constraint_name;
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

/*******************************************/
/*              条件判断语句
/*******************************************/

/******** IF **********/
-- 处理NULL值的函数
IS NULL
IS NOT NULL
NVL()
NVL2()
COALESCE()

-- 1. IF...
IF condition THEN 
  statement_1;
END IF;
-- 2.IF...ELSE
IF condition THEN 
  statement_1;
ELSE 
  statement_2;
END IF;
-- 3.IF...ELSIF...ELSE
IF condition1 THEN 
  statement_1;
ELSIF condition2 THEN 
  statement_2;
ELSIF condition3 THEN 
  statement_3;
ELSE 
  statement_4;
END IF;
-- 4.嵌套IF
IF condition1 THEN 
  IF condition2 THEN 
    statement_1;
  ELSE 
    IF condition3 THEN 
      statement_2;
    ELSIF condition4 THEN 
      statement_3; 
    ELSE 
      statement_4;
    END IF;
  END IF;
END IF;

/******* CASE *********/

-- 1.
CASE expression
WHEN result1 THEN
  statement_1;
WHEN result2 THEN
  statement_2;
WHEN result3 THEN
  statement3;
END CASE;

-- 2.
CASE
WHEN condition1 THEN
  statement_1;
WHEN condition2 THEN
  statement_2;
WHEN condition3 THEN
  statement_3;
END CASE;
  

-- ===================================================================================
-- 数据类型 
-- ===================================================================================
char
varchar2
number
integer
binary_float
binary_double
float
long

to_char()
to_number()
floor()

-- ===================================================================================
-- NULL函数
-- ===================================================================================
nvl()     -- PL/SQL
isnull()  -- TL/SQL
-- nvl() nvl2() 处理算术表达式运算中栏位空值问题
    -- 如果查询的栏位参与+ - / *算术运算,只要参与运算的栏位有一个为空值,则会导致整个运算结果为空值
    -- nvl(expr1,expr2)
      -- 如果expr1不为空,则返回expr1,否则返回expr2；expr1与expr2可以是任意数据类型,
      --但是expr1与expr2需是相同的数据类型
    -- nvl2(expr1,expr2,expr3)
      -- 如果expr1不为空,则返回expr2,否则返回expr3；expr1可以是任意数据类型,
      --但是expr2与expr3需是相同的数据类型



-- ===================================================================================
-- 字符串函数
-- ===================================================================================
trim()
substr()
regexp_substr()
translate()
trunc()

-- ===================================================================================
-- 查询语句
-- ===================================================================================
-- example 1
to_char(listagg(trim(field_name), ";") within group (order by field_name)) as field_name


-- example 2
SELECT 
  to_char((to_date('2019-0315', 'YYYYMMDD') + LEVEL - 1), 'YYYYMMDD') as date_num
FROM 
  DUAL
CONNECT BY LEVEL <= FLOOR(TO_DATE('20190315', 'YYYYMMDD') + 1);



-- ===================================================================================
-- 临时表
-- ===================================================================================
with 
temp1 as (),
temp2 as (),
temp3 as (),
...

-- ===================================================================================
--                                时间处理函数
-- ===================================================================================
-- 时间截取函数 EXTRACT()
-- extract()函数从oracle 9i中引入,用于从一个date或者interval类型中截取到特定的部分   
-- 只可以从一个date类型中截取 year,month,day(date日期的格式为yyyy-mm-dd);   
-- 只可以从一个 timestamp with time zone 的数据类型中截取TIMEZONE_HOUR和TIMEZONE_MINUTE; 
  -- EXTRACT(YEAR FROM date'')
  -- EXTRACT(MONTH FROM date'')
  -- EXTRACT(DAY FROM date'')
  -- EXTRACT(HOUR FROM date'')
  -- EXTRACT(MINUTE FROM date'')
  -- EXTRACT(SECOND FROM date'')
  -- EXTRACT(TIMEZONE_HOUR FROM )
  -- EXTRACT(TIMEZONE_MINUTE FROM )
  -- EXTRACT(TIMEZONE_REGION FROM )
  -- EXTRACT(TIMEZONE_ABBR FROM )
 
-- example 1
select extract(year from date'2011-05-17') year from dual;   
select extract(month from date'2011-05-17') month from dual;   
select extract(day from date'2011-05-17') day from dual;   
-- example 2
select extract(year from systimestamp) year,  
       extract(month from systimestamp) month,  
       extract(day from systimestamp) day,
       extract(hour from systimestamp) hour,  
       extract(minute from systimestamp) minute,  
       extract(second from systimestamp) second,  
       extract(timezone_hour from systimestamp) th,   
       extract(timezone_minute from systimestamp) tm,   
       extract(timezone_region from systimestamp) tr,   
       extract(timezone_abbr from systimestamp) ta,   
from dual;

-- 获取两个日期之间的具体时间间隔,extract函数是最好的选择
-- example
select extract(day from dt2-dt1) day,
     extract(hour from dt2-dt1) hour,
       extract(minute from dt2-dt1) minute,  
      ,extract(second from dt2-dt1) second  
from (select to_timestamp('2011-02-04 15:07:00','yyyy-mm-dd hh24:mi:ss') dt1,   
             to_timestamp('2011-05-17 19:08:46','yyyy-mm-dd hh24:mi:ss') dt2   
      from dual);

-- 时间转换函数 TO_DATE()
  -- TO_DATE(date, 'format')


-- 字符串转换函数 TO_CHAR()
  -- TO_CHAR(string)


-- 排序函数 RNAK(), DENSE_RNAK()
  -- RANK() OVER(PARTITION BY field1 ORDER BY field2 ASC|DESC)
  -- DENSE_RANK() OVER(PARTITION BY field1 ORDER BY fiels2 ASC|DESC)


-- 截取函数 TRUNC()函数
/**************日期********************/
SELECT TRUNC(SYSDATE, 'mm') FROM DUAL;    -- 返回当月第一天  2017-07-01
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; 
SELECT TRUNC(SYSDATE, 'yy') FROM DUAL;    -- 返回当年第一天 2017-01-01
SELECT TRUNC(SYSDATE, 'yyyy') FROM DUAL;  
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL;
SELECT TRUNC(SYSDATE) FROM DUAL;          -- 今天的日期      2017-07-09
SELECT TRUNC(SYSDATE, 'dd') FROM DUAL;    -- 当前年月日
SELECT TRUNC(SYSDATE, 'd') FROM DUAL;     -- 当前星期的第一天(星期天) 2017-07-09
SELECT TRUNC(SYSDATE, 'hh"24"') FROM DUAL;    -- 返回本小时的开始时间 2017-7-9 16:00:00
SELECT TRUNC(SYSDATE, 'mi') FROM DUAL;    -- 返回本分钟的开始时间 2017-7-9 16:19:00


/***************数字*******************
/*
TRUNC(number,num_digits)
  -- Number: 需要截尾取整的数字
  -- Num_digits: 用于指定取整精度的数字, Num_digits 的默认值为 0。
TRUNC()函数截取时不进行四舍五入
*/
SELECT TRUNC(123.458) FROM DUAL;          --123
SELECT TRUNC(123.458, 0) FROM DUAL;       --123
SELECT TRUNC(123.458, 1) FROM DUAL;       --123.4
SELECT TRUNC(123.458, -1) FROM DUAL;      --120
SELECT TRUNC(123.458, -4) FROM DUAL;      --0
SELECT TRUNC(123.458, 4) FROM DUAL;       --123.458
SELECT TRUNC(123) FROM DUAL;              --123
SELECT TRUNC(123, 1) FROM DUAL;           --123
SELECT TRUNC(123, -1) FROM DUAL;          --120

-- 时间
SELECT sysdate FROM dual;

-- 日期和字符串转换
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as nowTime from dual; -- 日期转换为字符串
select to_char(sysdate, 'yyyy') as nowYear from dual;
select to_char(sysdate, 'mm') as nowMonth from dual;
select to_char(sysdate, 'dd') as nowDay from dual;
select to_char(sysdate, 'hh24') as nowHour from dual;
select to_char(sysdate, 'mi') as nowMinute from dual;
select to_char(sysdate, 'ss') as nowSecond from dual;

select to_date('2019-03-20 17:52:54', 'yyyy-mm-dd hh24:mi:ss') from dual;
