DROP TABLE TASK3_OT;
CREATE TABLE TASK3_OT(
ORDER_ID TEXT,
ORDER_DATE DATE,
CUSTOMER_ID TEXT,
PRODUCT_ID VARCHAR(50),
CATEGORY VARCHAR(50),
SUB_CATEGORY VARCHAR(50),
PRODUCT_NAME TEXT,
SALES NUMERIC(10,2),
QUANTITY INT,
DISCOUNT NUMERIC(10,2),
PROFIT NUMERIC(10,2)
);

COPY TASK3_OT(ORDER_ID, ORDER_DATE, CUSTOMER_ID, PRODUCT_ID, CATEGORY, SUB_CATEGORY, PRODUCT_NAME, SALES, QUANTITY, DISCOUNT, PROFIT)
FROM 'C:\Maincraft Internship (April 14 to May)\Task 3 Anushka\Cleaned_OT_Task3_Data_Proper_Anushka.csv' 
DELIMITER ',' 
CSV HEADER 
QUOTE '"' 
ESCAPE '"';

SELECT * FROM TASK3_OT;

DROP TABLE TASK3_CT;
CREATE TABLE TASK3_CT(
CUSTOMER_ID TEXT,
CUSTOMER_NAME VARCHAR(100),
COUNTRY VARCHAR(50),
CITY VARCHAR(50),
STATE VARCHAR(50),
POSTAL_CODE INT,
REGION VARCHAR(50)
);

COPY TASK3_CT(CUSTOMER_ID, CUSTOMER_NAME, COUNTRY, CITY, STATE, POSTAL_CODE, REGION)
FROM 'C:\Maincraft Internship (April 14 to May)\Task 3 Anushka\Cleaned_CT_Task3_Data_Proper_Anushka.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"';

SELECT * FROM TASK3_CT;


--MONTHLY PERFORMANCE ANALYSIS
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM task3_ot
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

--GROWTH RATE CALCULATION
WITH monthly_summary AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS month,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM task3_ot
    GROUP BY DATE_TRUNC('month', order_date)
)

SELECT
    month,
    total_sales,
    total_profit,
    total_sales - LAG(total_sales) OVER (ORDER BY month) AS sales_variance,
    ROUND(
        ((total_sales - LAG(total_sales) OVER (ORDER BY month))
        / LAG(total_sales) OVER (ORDER BY month)) * 100,
        2
    ) AS sales_growth_pct
FROM monthly_summary
ORDER BY month;

--USING CASE FROM BUSINESS CLASSIFICATION
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin,
    CASE
        WHEN SUM(profit) > 5000 THEN 'High Profit'
        WHEN SUM(profit) BETWEEN 1000 AND 5000 THEN 'Medium Profit'
        ELSE 'Low Profit'
    END AS performance_status
FROM task3_ot
GROUP BY category
HAVING SUM(sales) > 0
ORDER BY total_profit DESC;

--IDENTIFY UNDERPERFORMING REGIONS
SELECT
    product_name,
    category,
    sales,
    profit
FROM task3_ot
WHERE sales > (
    SELECT AVG(sales)
    FROM task3_ot
)
ORDER BY sales DESC;