YEAR()
MONTH()
DAY()
WEEK()
WEEKDAY()



-- ============================================================
-- 开窗函数
-- oracle, MySQL(>=8.0)
-- ============================================================
-- 分组排序
row_number() over(partition by order by) as rankid

-- 排序
rank() over(partition by var1 order by var1)
dense_dense() over(partition by var2 order by var2)




-- ============================================================
-- 创建临时表
-- ============================================================
-- SQL Server 临时表
-- ----------------
IF OBJECTID tab IS NOT NOT NULL BEGIN DROP TABLE tab END
-- ...
DROP TABLE tab

-- MySQL
-- ----------------
CREATE TEMPORARY TABLE tab (
	-- ...
);
DROP TABLE tab;

-- Oracle
-- ----------------
WITH temp1 as (
	-- ...
)
,temp2 as (
	-- ...
)


-- ============================================================
-- 多表查询：笛卡尔积
-- ============================================================
select *
from temp1 a, temp2 b
WHERE A.var1 = b.var2



-- ============================================================
-- MySQL 实现row_number() over(partition by var1 order by var2)
-- ============================================================
-- 添加行号字段
SET @row_number = 0;
SELECT 
	(@row_number:=@row_number + 1) AS rankid,
	a.firstName,
	a.lastName
FROM test a
LIMIT 5;

SELECT 
	(@row_number:=@row_number+1) AS rankid,
	a.firstName,
	a.lastName
FROM test (SELECT @row_number:=0) AS t


-- ================================================
-- 实现 row_number() over(partition by var1 order by varr2) 
SELECT 
	@row_number:=CASE WHEN @customer_no = customerNumber THEN @row_number + 1 ELSE 1 END AS num, 
	@customer_no:=customerNumber as customerNumber,
	paymentDate,
	amount
FROM payments, (SELECT @row_number:=0, @customer_no=0) as t
ORDER BY customerNumber