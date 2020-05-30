⭐️⭐️⭐️ VARCHAR vs CHAR;
CHAR is faster for fixed length text
- state Abbreviations: CA, NY
- YES/NO Flags: Y/N
- SEX: M/F

Otherwise use VARCHAR

mysql> create table dogs (name char(5), breed varchar(10) );
Query OK, 0 rows affected (0.30 sec)

mysql> insert into dogs(name, breed) values ('bob', 'beagle');
Query OK, 1 row affected (0.02 sec)

mysql> insert into dogs(name, breed) values ('robby', 'corgi');
Query OK, 1 row affected (0.07 sec)

mysql> insert into dogs(name, breed) values ('Princess Jane', 'Retriever');
Query OK, 1 row affected, 1 warning (0.03 sec)

mysql> select * from dogs;
+-------+-----------+
| name  | breed     |
+-------+-----------+
| bob   | beagle    |
| robby | corgi     |
| Princ | Retriever |
+-------+-----------+
3 rows in set (0.00 sec)

# //////////////
⭐️⭐️⭐️ INT;
- works any Number 

# //////////////
⭐️⭐️⭐️ DECIMAL;
- includes decimal points 
- a fixed-point type and calculations are exact.
- DECIMAL(5,2) 
  - 5: total number of digits 
  - 2: Digits after decimal 
- maximum number of DECIMAL(5,2) = 999.99
# --- 
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES(7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
mysql> select * from items
    -> ;
+--------+
| price  |
+--------+
|   7.00 |
| 999.99 |
|  34.88 |
| 299.00 |
|   2.00 |
+--------+

# //////////////
⭐️⭐️⭐️ FLOAT and DOUBLE;
- difference: how they are stored 
- a floating-point type and calculations are approximate.
# ---
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877.45);
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877665544.45);
mysql> SELECT * FROM thingies;
+------------+
| price      |
+------------+
|      88.45 |
|    8877.45 |
| 8877670000 | <- accurate only for the first 7 digits!!
+------------+
3 rows in set (0.00 sec)

# //////////////
⭐️⭐️⭐️ DATE 
- Values with a Date but no Time
- 'YYYY-MM-DD' Format
⭐️⭐️⭐️ TIME 
- Values with a Time but no Date
- 'HH:MM:SS' Format
⭐️⭐️⭐️ DATETIME 
- Values with a Date AND Time
- 'YYYY-MM-DD' Format

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

mysql> select * from people;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| padma | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
+-------+------------+-----------+---------------------+

⭐️⭐️⭐️ CURDATE(), CURTIME(), NOW() 

 
