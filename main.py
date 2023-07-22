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