-- Databricks notebook source
SELECT *
FROM datefunctions.datesexercize.orders;

------QUESTION 1

SELECT order_id,customer_id ,order_date,
       DAYNAME (`order_date`) AS day_name
       FROM datefunctions.datesexercize.orders;


----QUESTION 2

SELECT *
FROM datefunctions.datesexercize.customer_signups;



SELECT customer_id,customer_name,signup_date,
MONTHNAME(`signup_date`) AS signup_month_name
FROM datefunctions.datesexercize.customer_signups;


----QUESTION 3


SELECT sale_id,product_name,sale_date,
MONTH(`sale_date`) AS sale_month
FROM datefunctions.datesexercize.sales;


---QUESTION 4 

SELECT transaction_id,customer_id,transaction_date,
YEAR (`transaction_date`)AS transaction_year
FROM datefunctions.datesexercize.transactions;


---QUESTION 5 

SELECT delivery_id,customer_id,delivery_date,
DAY(`delivery_date`)AS day_of_month
FROM datefunctions.datesexercize.deliveries;


---QUESTION 6

SELECT employee_id, employee_name, department,
       CURRENT_DATE() AS today_date
FROM datefunctions.datesexercize.employees;


---QUESTION 7

SELECT order_id, customer_id, order_date_text,
       TO_DATE(order_date_text) AS order_date
FROM datefunctions.datesexercize.online_orders;

---QUESTION 8

SELECT payment_id,
       customer_id,
       payment_date,
       DATE_FORMAT(payment_date, 'yyyy-MM-dd') AS formatted_payment_date
FROM datefunctions.datesexercize.payment_dates;



----QUESTION 9

SELECT *
FROM datefunctions.datesexercize.customer_purchases;


SELECT customer_id,customer_name,last_purchase_date,
    DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase
FROM datefunctions.datesexercize.customer_purchases;


----QUESTION 10

SELECT *
FROM datefunctions.datesexercize.shipping_orders;


SELECT order_id,customer_id,order_date,
DATEADD(`order_date`,7)AS expected_delivey_date
FROM datefunctions.datesexercize.shipping_orders;


---QUESTION 11 

SELECT*
FROM datefunctions.datesexercize.bookings;


SELECT booking_id,customer_id,booking_date,
YEAR(`booking_date`)AS booking_year,
MONTH(`booking_date`)AS booking_month,
DAY(`booking_date`)AS booking_day
FROM datefunctions.datesexercize.bookings;

---QUESTION 12

SELECT*
FROM datefunctions.datesexercize.yearly_orders;



SELECT order_id,customer_id,order_date,amount,
YEAR (`order_date`)AS order_year
FROM datefunctions.datesexercize.yearly_orders
WHERE YEAR(`order_date`) = 2026;

--QUESTION 13

SELECT*
FROM datefunctions.datesexercize.monthly_orders;


SELECT order_id,customer_id,order_date,amount,
MONTH (`order_date`)AS order_month
FROM datefunctions.datesexercize.monthly_orders
WHERE MONTH(`order_date`) = 3;

---QUESTION 14

SELECT*
FROM datefunctions.datesexercize.subscriptions_1;


SELECT subscription_id,customer_id,start_date,
LAST_DAY(`start_date`)AS month_end_date
FROM datefunctions.datesexercize.subscriptions_1;


----QUESTION 15

SELECT*
FROM datefunctions.datesexercize.campaign_sends;


SELECT send_id,customer_id,send_date,
DATE_TRUNC('MONTH',send_date)AS month_start_date
FROM datefunctions.datesexercize.campaign_sends;

-----QUESTION 16

SELECT*
FROM datefunctions.datesexercize.invoice_dates;


SELECT invoice_id,customer_id,invoice_date,
TO_CHAR(invoice_date,'MMMM, yyyy')AS invoice_month_year
FROM datefunctions.datesexercize.invoice_dates;

-----QUESTIN 17 
---CHATGPT assisted with this Syntax as it was giving me lots of errors

SELECT
    customer_id,
    customer_name,
    date_of_birth,
    FLOOR(DATEDIFF(CURRENT_DATE(), date_of_birth) / 365.25) AS customer_age
FROM datefunctions.datesexercize.customer_birthdays;


--------QUESTION 18

SELECT*
FROM datefunctions.datesexercize.weekend_orders;



SELECT order_id,customer_id,order_date,
DAYNAME(order_date) AS day_name,
CASE
WHEN DAYNAME(order_date) IN ('Saturday', 'Sunday') THEN 'Weekend'
ELSE 'Weekday'
END AS day_type
FROM datefunctions.datesexercize.weekend_orders;


----QUESTION 19

SELECT*
FROM datefunctions.datesexercize.quarterly_transactions;


SELECT transaction_id,customer_id,transaction_date,amount,
QUARTER(transaction_date) AS transaction_quarter
FROM datefunctions.datesexercize.quarterly_transactions;


---QUESTION 20

SELECT*
FROM datefunctions.datesexercize.recent_orders;


SELECT order_id,customer_id,order_date,amount,
DATEDIFF(CURRENT_DATE(), order_date) AS days_since_order
FROM datefunctions.datesexercize.recent_orders
WHERE DATEDIFF(CURRENT_DATE(), order_date) > 30;


----BONUS QUESTION 
----QUESTION 21

SELECT*
FROM datefunctions.datesexercize.customer_recency;


SELECT customer_id,customer_name,last_purchase_date,
DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase,
CASE
WHEN DATEDIFF(CURRENT_DATE(), last_purchase_date) <= 30 THEN 'Active Customer'
WHEN DATEDIFF(CURRENT_DATE(), last_purchase_date) BETWEEN 31 AND 90 THEN 'At Risk Customer'
ELSE 'Inactive Customer'
END AS customer_status
FROM datefunctions.datesexercize.customer_recency;

