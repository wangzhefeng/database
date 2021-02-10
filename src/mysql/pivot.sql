SELECT 
	A.YEARS,
    SUM(ORDERCOUNT_1) AS 第一季度,
    SUM(ORDERCOUNT_2) AS 第二季度,
    SUM(ORDERCOUNT_3) AS 第三季度,
    SUM(ORDERCOUNT_4) AS 第四季度
FROM (
	SELECT 
		A.YEARS,
		A.SEASON,
		CASE WHEN A.SEASON = '一季度' THEN A.ORDERCOUNT END AS ORDERCOUNT_1,
		CASE WHEN A.SEASON = '二季度' THEN A.ORDERCOUNT END AS ORDERCOUNT_2,
		CASE WHEN A.SEASON = '三季度' THEN A.ORDERCOUNT END AS ORDERCOUNT_3,
		CASE WHEN A.SEASON = '四季度' THEN A.ORDERCOUNT END AS ORDERCOUNT_4
	FROM tinker.year_season_ordercount A
) A
GROUP BY 
	A.YEARS;


SELECT
	A.YEARS,
    SUM(IF(A.SEASON = '一季度', A.ORDERCOUNT, NULL)) AS '第一季度',
    SUM(IF(A.SEASON = '二季度', A.ORDERCOUNT, NULL)) AS '第二季度',
    SUM(IF(A.SEASON = '三季度', A.ORDERCOUNT, NULL)) AS '第三季度',
    SUM(IF(A.SEASON = '四季度', A.ORDERCOUNT, NULL)) AS '第四季度'
FROM tinker.year_season_ordercount A
GROUP BY A.YEARS;