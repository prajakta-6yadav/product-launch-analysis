-- Database

CREATE DATABASE product_launch_db;
USE product_launch_db;

-- Table

CREATE TABLE campaign_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campaign_date DATE,
    region VARCHAR(30),
    sales INT,
    spend DECIMAL(10,2),
    impressions INT
);

-- Insert  REAL WORLD DAILY DATA (8 Weeks, Multiple Entries)

INSERT INTO campaign_data (campaign_date, region, sales, spend, impressions)
VALUES

-- WEEK 1 (Jan 1–5) multiple entries
('2025-01-01','North',40,1800,4000),
('2025-01-02','North',35,1500,3500),
('2025-01-03','South',30,1400,4200),
('2025-01-03','South',25,1100,3800),
('2025-01-04','West',50,2200,5000),
('2025-01-05','West',45,2000,4800),
('2025-01-05','East',20,NULL,3000),

-- WEEK 2
('2025-01-08','North',45,2000,4200),
('2025-01-09','North',40,1800,3900),
('2025-01-09','South',35,1500,4100),
('2025-01-10','South',30,1400,3800),
('2025-01-11','West',55,2300,5200),
('2025-01-12','East',28,1300,3400),

-- WEEK 3
('2025-01-15','North',50,2200,4500),
('2025-01-16','South',38,1600,4200),
('2025-01-17','South',32,1400,3900),
('2025-01-18','West',60,2500,5600),
('2025-01-19','East',30,1350,3600),

-- WEEK 4
('2025-01-22','North',55,2400,4700),
('2025-01-23','North',50,2200,4500),
('2025-01-23','South',40,1700,4300),
('2025-01-24','West',65,2700,5900),
('2025-01-26','East',35,1500,3800),

-- WEEK 5
('2025-01-29','North',60,2600,5000),
('2025-01-30','South',45,1800,4400),
('2025-01-31','West',70,3000,6200),
('2025-02-02','East',38,1600,4000),

-- WEEK 6
('2025-02-05','North',65,2800,5200),
('2025-02-06','South',48,1900,4600),
('2025-02-07','West',75,3200,6500),
('2025-02-09','East',40,1700,4200),

-- WEEK 7
('2025-02-12','North',70,3000,5500),
('2025-02-13','South',50,2000,4800),
('2025-02-14','West',80,3400,6800),
('2025-02-16','East',42,1800,4400),

-- WEEK 8
('2025-02-19','North',75,3200,5800),
('2025-02-20','South',55,2100,5000),
('2025-02-21','West',85,3600,7100),
('2025-02-23','East',45,1900,4600);

-- Count weeks directly

SELECT COUNT(DISTINCT YEARWEEK(campaign_date,1)) AS total_weeks
FROM campaign_data;

-- check weeks
SELECT DISTINCT YEARWEEK(campaign_date,1) AS week_number
FROM campaign_data
ORDER BY week_number;

-- check null and zero value in Spend
SELECT *
FROM campaign_data
WHERE spend IS NULL OR spend = 0;

-- Replace NULL / Zero spend with average spend

UPDATE campaign_data cd
JOIN (
    SELECT ROUND(AVG(spend),2) AS avg_spend
    FROM campaign_data
    WHERE spend IS NOT NULL AND spend > 0
) AS avg_table
SET cd.spend = avg_table.avg_spend
WHERE cd.spend IS NULL OR cd.spend = 0;

-- Verify null and Zero values

SELECT *
FROM campaign_data
WHERE spend IS NULL OR spend = 0;

-- This query aggregates daily campaign data into weekly regional performance.

SELECT 
    YEARWEEK(campaign_date,1) AS week_number,
    region,
    SUM(sales) AS total_sales,
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions
FROM campaign_data
GROUP BY week_number, region
ORDER BY week_number, region;
