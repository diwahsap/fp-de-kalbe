-- use databases "KALBE"
USE KALBE;

-- create table order with the name "Order"
-- with columns:
-- order_no, purchase_amount, order_date, customer_id, salesman_id
-- order_no, SMALLINT, NOT NULL, PRIMARY KEY
-- purchase_amount, SMALLINT, NOT NULL
-- order_date, DATE, NOT NULL
-- customer_id, SMALLINT, NOT NULL
-- salesman_id, SMALLINT, NOT NULL
CREATE TABLE customer_orders (
    order_no SMALLINT NOT NULL PRIMARY KEY,
    purchase_amount SMALLINT NOT NULL,
    order_date DATE NOT NULL,
    customer_id SMALLINT NOT NULL,
    salesman_id SMALLINT NOT NULL
);

-- Insert data into table "customer_orders"
-- with values:
-- order_no, purchase_amount, order_date, customer_id, salesman_id
-- 10001,150,2022-10-05,2005,3002
-- 10009,279,2022-09-10,2001,3005
-- 10002,65,2022-10-05,2002,3001
-- 10004,110,2022-08-17,2009,3003
-- 10007,948,2022-09-10,2005,3002
-- 10005,2400,2022-07-27,2007,3001
INSERT INTO 
    customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id)
VALUES 
    (10001, 150, '2022-10-05', 2005, 3002),
    (10009, 279, '2022-09-10', 2001, 3005),
    (10002, 65, '2022-10-05', 2002, 3001),
    (10004, 110, '2022-08-17', 2009, 3003),
    (10007, 948, '2022-09-10', 2005, 3002),
    (10005, 2400, '2022-07-27', 2007, 3001);

-- query to display all customer orders where purchase amount is less than 100
-- or exclude those orders which order date is on or greater than 25 Aug 2022
-- and customer id is above is 2001
SELECT 
    * 
FROM 
    customer_orders
WHERE 
    purchase_amount < 100 OR 
    (order_date < '2022-08-25' AND customer_id > 2001);
