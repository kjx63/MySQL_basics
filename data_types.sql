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
mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2020-05-30 |
+------------+

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 17:58:34  |
+-----------+

 mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2020-05-30 17:58:38 |
+---------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW());

mysql> select * from people;
+-----------+------------+-----------+---------------------+
| name      | birthdate  | birthtime | birthdt             |
+-----------+------------+-----------+---------------------+
| padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry     | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
| Microwave | 2020-05-30 | 18:04:59  | 2020-05-30 18:04:59 | ⭐️⭐️⭐️
+-----------+------------+-----------+---------------------+
3 rows in set (0.00 sec)

# ⭐️⭐️⭐️ Formatting DATES (and times);
- ⭐️ DAY()
mysql> select name, DAY(birthdate) FROM people;
+-----------+----------------+
| name      | DAY(birthdate) |
+-----------+----------------+
| padma     |             11 |
| Larry     |             25 |
| Microwave |             30 |
+-----------+----------------+

- ⭐️ DAYNAME()
mysql> SELECT name, birthdate, DAYNAME(birthdate) FROM people;
+-----------+------------+--------------------+
| name      | birthdate  | DAYNAME(birthdate) |
+-----------+------------+--------------------+
| padma     | 1983-11-11 | Friday             |
| Larry     | 1943-12-25 | Saturday           |
| Microwave | 2020-05-30 | Saturday           |
+-----------+------------+--------------------+

- ⭐️ DAYOFWEEK()
mysql> SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
+-----------+------------+----------------------+
| name      | birthdate  | DAYOFWEEK(birthdate) |
+-----------+------------+----------------------+
| padma     | 1983-11-11 |                    6 |
| Larry     | 1943-12-25 |                    7 |
| Microwave | 2020-05-30 |                    7 |
+-----------+------------+----------------------+

- ⭐️ DAYOFYEAR()
mysql> SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
+-----------+------------+----------------------+
| name      | birthdate  | DAYOFYEAR(birthdate) |
+-----------+------------+----------------------+
| padma     | 1983-11-11 |                  315 |
| Larry     | 1943-12-25 |                  359 |
| Microwave | 2020-05-30 |                  151 |
+-----------+------------+----------------------+

mysql> SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
+-------------------------------------------------------------------------+
| CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) |
+-------------------------------------------------------------------------+
| November 11 1983                                                        |
| December 25 1943                                                        |
| May 30 2020                                                             |
+-------------------------------------------------------------------------+
3 rows in set (0.05 sec)

- ⭐️ DATE_FORMAT
mysql> SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
+----------------------------------+
| DATE_FORMAT(birthdt, '%m/%d/%Y') |
+----------------------------------+
| 11/11/1983                       |
| 12/25/1943                       |
| 05/30/2020                       |
+----------------------------------+

3 rows in set (0.00 sec)
mysql> SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
+-------------------------------------------+
| DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') |
+-------------------------------------------+
| 11/11/1983 at 10:07                       |
| 12/25/1943 at 04:10                       |
| 05/30/2020 at 06:04                       |
+-------------------------------------------+
3 rows in set (0.00 sec)


# ⭐️⭐️⭐️ DATE MATH 
- ⭐️ DATEDIFF
mysql> SELECT DATEDIFF(NOW(), birthdate) FROM people;
+----------------------------+
| DATEDIFF(NOW(), birthdate) |
+----------------------------+
|                      13350 |
|                      27916 |
|                          0 |
+----------------------------+
3 rows in set (0.00 sec)

mysql> SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
+---------------------+-------------------------------------+
| birthdt             | DATE_ADD(birthdt, INTERVAL 1 MONTH) |
+---------------------+-------------------------------------+
| 1983-11-11 10:07:35 | 1983-12-11 10:07:35                 |
| 1943-12-25 04:10:42 | 1944-01-25 04:10:42                 |
| 2020-05-30 18:04:59 | 2020-06-30 18:04:59                 |
+---------------------+-------------------------------------+

mysql> SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
+---------------------+----------------------------+
| birthdt             | birthdt + INTERVAL 1 MONTH |
+---------------------+----------------------------+
| 1983-11-11 10:07:35 | 1983-12-11 10:07:35        |
| 1943-12-25 04:10:42 | 1944-01-25 04:10:42        |
| 2020-05-30 18:04:59 | 2020-06-30 18:04:59        |
+---------------------+----------------------------+
3 rows in set (0.00 sec)

mysql> SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
+---------------------+------------------------------------------------+
| birthdt             | birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR |
+---------------------+------------------------------------------------+
| 1983-11-11 10:07:35 | 1985-02-11 20:07:35                            |
| 1943-12-25 04:10:42 | 1945-03-25 14:10:42                            |
| 2020-05-30 18:04:59 | 2021-08-31 04:04:59                            |
+---------------------+------------------------------------------------+
3 rows in set (0.00 sec)


# ⭐️⭐️⭐️ TIMESTAMPS ⭐️⭐️⭐️
- DATETIME VS TIMESTAMPS
CREATE TABLE comments (
	content VARCHAR(100), 
	created_at TIMESTAMP DEFAULT NOW()
);

mysql> INSERT INTO comments (content) VALUES('lol what a funny article');
mysql> INSERT INTO comments (content) VALUES('I found this offensive');
mysql> INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');

mysql> select * from comments;
+--------------------------+---------------------+
| content                  | created_at          |
+--------------------------+---------------------+
| lol what a funny article | 2020-05-30 18:40:08 |
| I found this offensive   | 2020-05-30 18:40:18 |
| Ifasfsadfsadfsad         | 2020-05-30 18:40:58 |
+--------------------------+---------------------+


# ⭐️⭐️⭐️ TIMESTAMPS ⭐️⭐️⭐️
CREATE TABLE comments3 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO comments3 (content) VALUES('dasdasdasd');
INSERT INTO comments3 (content) VALUES('lololololo');
INSERT INTO comments3 (content) VALUES('I LIKE CATS AND DOGS');

mysql> select * from comments3;
+----------------------+---------------------+
| content              | changed_at          |
+----------------------+---------------------+
| dasdasdasd           | 2020-05-30 18:50:00 |
| lololololo           | 2020-05-30 18:50:00 |
| I LIKE CATS AND DOGS | 2020-05-30 18:50:02 |
+----------------------+---------------------+
3 rows in set (0.00 sec)

UPDATE comments3 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';

mysql> select * from comments3;
+-----------------------+---------------------+
| content               | changed_at          |
+-----------------------+---------------------+
| THIS IS NOT GIBBERISH | 2020-05-30 18:55:44 |
| lololololo            | 2020-05-30 18:50:00 |
| I LIKE CATS AND DOGS  | 2020-05-30 18:50:02 |
+-----------------------+---------------------+
3 rows in set (0.00 sec)

# If you want to select people whose birthdate is between 1980 - 2000;
# 1st approach 
mysql> SELECT name, birthdt from people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
+-------+---------------------+
| name  | birthdt             |
+-------+---------------------+
| padma | 1983-11-11 10:07:35 |
+-------+---------------------+

# ⭐️⭐️ 2nd approach (better approach)
mysql> SELECT name, birthdt from people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);
+-------+---------------------+
| name  | birthdt             |
+-------+---------------------+
| padma | 1983-11-11 10:07:35 |
+-------+---------------------+

