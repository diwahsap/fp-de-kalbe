# Final Project - Data Engineer - Kalbe

[![Blue-Data-Statistics-Facebook-Cover.png](https://i.postimg.cc/MKNdghQN/Blue-Data-Statistics-Facebook-Cover.png)](https://postimg.cc/tYd3xvDN)

Halo, ini adalah repositori untuk Final Project saya di Internship Kalbe Nutritionals. Di Project kali ini, saya hanya menggunakan Shell Script, Cronjob, MySQL Script, dan Python Script. Studi kasusnya bisa dilihat di [sini](https://rakamin-lms.s3.ap-southeast-1.amazonaws.com/files/Challenge_Prerequisite_Hints_KALBE-a8f0a725-4e0a-452d-998d-c4a3589c9dec.pdf).

## Shell Script
Saya akan melakukan pengecakan terhadap direktori yang ada.
```
#!/bin/bash

# Variables
path="/hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="/hdfs/data/data1"

# Check if the directory exists
if [ -d "$path/$name_of_directory" ]; then
    echo "There is $name_of_directory Directory Exists!"

    cp "$source_dir/$filename_excel" "$target_dir" # copy the file to the target directory
    if [ $? -eq 0 ]; then # check if the copy command is successful
        echo "File Moved Successfully" > "$target_dir/log.txt"
    else
        echo "Failed to move the file." > "$log_file"
    fi
else
    echo "$name_of_directory Directory Not Exists!"
    # Create the directory inside the path
    mkdir -p "$path/$name_of_directory"
fi
```

## Python Script
Saya akan melakukan insert data dari Python ke MySQL menggunakan `mysql.connector`.
```
# Melakukan import mysql connector
import mysql.connector

# Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="localhost", user="root", password="dimas123.", database="fp_de_kalbe")

# Membuat object cursor sebagai penannda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukan record ke DB (KARYAWAN)
insert_sql = (
    "INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)"
)
values = ("Dimas", "Wahyu Saputro", 21, "M", 4_000_000)

try:
    # eksekusi SQL Command
    cursor.execute(insert_sql, values)

    # Melakukan perubahan (commit) pada DB
    conn.commit()
except:
    # Roll back apabila ada issue
    conn.rollback()

# Menutup koneksi
conn.close()
```

## SQL Script
Pada `main.sql`, saya akan membuat database, kemudian membuat table. Selanjutnya, saya akan melakukan insert data, dan melakukan beberapa query terhadapnya.
```
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
```

Di kasus selanjutnya, saya membuat script baru,
```
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
```
