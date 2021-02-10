-- ==================================================
-- 创建索引
-- ==================================================
USE classicmodels;

EXPLAIN SELECT 
	a.employeeNumber,
    a.lastName,
    a.firstName
FROM employees as a
WHERE a.jobTitle = "Sales Rep";

CREATE INDEX jobTitle ON employees (jobTitle);

EXPLAIN SELECT 
	a.employeeNumber,
    a.lastName,
    a.firstName
FROM employees as a
WHERE a.jobTitle = "Sales Rep";

SHOW INDEXES FROM employees;


-- ==================================================
-- 删除索引
-- ==================================================
CREATE TEMPORARY TABLE leads (
	lead_id INT auto_increment,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX name(first_name, last_name),
    UNIQUE email(email),
    PRIMARY KEY(lead_id)
);

-- 删除索引
DROP INDEX name ON leads;

DROP INDEX email ON leads
ALGORITHM = COPY
LOCK DEFAULT;

-- 删除主键
DROP INDEX `PRIMARY` ON leads;

SHOW INDEXES FROM leads;



