-- create database with "KALBE" as the name
CREATE DATABASE KALBE;

-- use database "KALBE"
USE KALBE;

-- create table with the name "Inventory"
-- with columns: 
-- item_code, SMALLINT, NOT NULL, PRIMARY KEY
-- item_name, varchar(50), NOT NULL
-- item_price, int, NOT NULL
-- item_total, int, NOT NULL
CREATE TABLE Inventory (
    item_code SMALLINT NOT NULL PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    item_price INT NOT NULL,
    item_total INT NOT NULL
);

-- Insert data into table "Inventory"
-- with values:
-- item_code, item_name, item_price, item_total
-- 2341,Promag Tablet,3000,100
-- 2342,Hydro Coco 250ML,7000,20
-- 2343,Nutrive Benecol 100ML,20000,30
-- 2344,Blackmores Vit C 500Mg,95000,45
-- 2345,Entrasol Gold 370G,90000,120
INSERT INTO Inventory (item_code, item_name, item_price, item_total)
VALUES (2341, 'Promag Tablet', 3000, 100),
       (2342, 'Hydro Coco 250ML', 7000, 20),
       (2343, 'Nutrive Benecol 100ML', 20000, 30),
       (2344, 'Blackmores Vit C 500Mg', 95000, 45),
       (2345, 'Entrasol Gold 370G', 90000, 120);

-- show item_name that has the highest number in item_total
SELECT item_name FROM Inventory
WHERE item_total = (SELECT MAX(item_total) FROM Inventory);

-- update the item_price of the output of question bullet before to 100000
UPDATE Inventory
SET item_price = 99999
WHERE item_total = (SELECT MAX(item_total) FROM Inventory);

-- what will happen if we insert another item_name with item_code of 2343 
-- into the table
-- it will throw an error because the item_code is a primary key

-- delete the item_name that has the lowest number in item_total
DELETE FROM Inventory
WHERE item_total = (SELECT MIN(item_total) FROM Inventory);
