Relationship
- One to One
    - not that common 
    - Customers (user, password and email) and Customer detailed tables()
- One to Many ⭐️
    - Books - Reviews
    - Customers & Orders
        - A customer can order products as manay as he wants 
		- But each order is associated only with that 1 customer
- Many to Many 
    - Books - Authors

One to Many ⭐️ (Lesson 197)

# Line 15 to 44 = setup
mysql> use customers_orders;
mysql> CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

mysql> CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT, ⭐️⭐️⭐️
	FOREIGN KEY(customer_id) REFERENCES customers(id)⭐️⭐️⭐️
);

mysql> INSERT INTO customers (first_name, last_name, email)
    -> VALUES ('Boy', 'George', 'george@gmail.com'),
    ->        ('George', 'Michael', 'gm@gmail.com'),
    ->        ('David', 'Bowie', 'david@gmail.com'),
    ->        ('Blue', 'Steele', 'blue@gmail.com'),
    ->        ('Bette', 'Davis', 'bette@aol.com');
	
mysql> INSERT INTO orders (order_date, amount, customer_id)
    -> VALUES ('2016/02/10', 99.99, 1),
    ->        ('2017/11/11', 35.50, 1),
    ->        ('2014/12/12', 800.67, 2),
    ->        ('2015/01/03', 12.50, 2),
    ->        ('1999/04/11', 450.25, 5);
	
mysql> select * from customers ;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

mysql> select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+

Now the customer_id is associated with the "id" of the customers, so you cannot do something like this.
mysql> INSERT INTO orders(order_date, amount, customer_id) 
	 -> VALUES ('2016/02/10', 33.67, 98),
⭐️⭐️⭐️
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`customers_orders`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFEREN
CES `customers` (`id`))


====================================================
⭐️ Cross JOIN
# This is useless!! But let me show you anyway
mysql> SELECT * FROM customers, orders;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

⭐️ INNER JOIN
# If you want to see the customers who placed orders.

# 1st approach (IMPLICIT INNER JOIN)
# - Select all records from cutomers and orders where the joint condition is met.
mysql> SELECT first_name, last_name, order_date, amount FROM customers, orders
    -> WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

# 2nd approach (EXPLICIT INNER JOIN) ⭐️⭐️⭐️
- Join two tables under the certain conditions (ON...)
mysql> SELECT first_name, last_name, order_date, amount FROM customers
    -> Join orders
    -> ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

mysql> SELECT
    ->     first_name,
    ->     last_name,
    ->     SUM(amount) AS total_spent
    -> FROM customers
    -> JOIN orders
    ->     ON customers.id = orders.customer_id
    -> GROUP BY orders.customer_id
    -> ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
+------------+-----------+-------------+

⭐️ LEFT JOIN
# SELECT everything from A, along with any matching records in B

# First, this is the INNER JOIN
mysql> SELECT * FROM customers INNER JOIN orders ON customers.id = orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

# ⭐️⭐️⭐️⭐️ THIS IS THE LEFT JOIN
mysql> SELECT * FROM customers
    -> LEFT JOIN orders
    ->     ON customers.id = orders.customer_id;
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+------+------------+--------+-------------+

mysql> SELECT
    ->     first_name,
    ->     last_name,
    ->     IFNULL(SUM(amount), 0) AS total_spent ⭐️
    -> FROM customers
    -> LEFT JOIN orders
    ->     ON customers.id = orders.customer_id
    -> GROUP BY customers.id
    -> ORDER BY total_spent;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| Blue       | Steele    |        0.00 |
| David      | Bowie     |        0.00 |
| Boy        | George    |      135.49 |
| Bette      | Davis     |      450.25 |
| George     | Michael   |      813.17 |
+------------+-----------+-------------+

⭐️ RIGHT JOIN
# SELECT everything from B, along with any matching records in A

mysql> SELECT * FROM customers
    -> RIGHT JOIN orders
    ->     ON customers.id = orders.customer_id;
+------+------------+-----------+------------------+----+------------+--------+-------------+
| id   | first_name | last_name | email            | id | order_date | amount | customer_id |
+------+------------+-----------+------------------+----+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+------+------------+-----------+------------------+----+------------+--------+-------------+




SELECT 
    first_name, 
    IFNULL(title, 'Missing'),
    IFNULL(grade, 0)
FROM students
LEFT JOIN papers 
    ON students.id = papers.student_id;


=================
Practice 
# SET UP 
# SCHEMA
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);

# -- The Starter Data
INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


mysql> select * from students;
+----+------------+
| id | first_name |
+----+------------+
|  1 | Caleb      |
|  2 | Samantha   |
|  3 | Raj        |
|  4 | Carlos     |
|  5 | Lisa       |
+----+------------+

mysql> SELECT *
    -> FROM papers;
+---------------------------------------+-------+------------+
| title                                 | grade | student_id |
+---------------------------------------+-------+------------+
| My First Book Report                  |    60 |          1 |
| My Second Book Report                 |    75 |          1 |
| Russian Lit Through The Ages          |    94 |          2 |
| De Montaigne and The Art of The Essay |    98 |          2 |
| Borges and Magical Realism            |    89 |          4 |
+---------------------------------------+-------+------------+


# Q1
SELECT 
    first_name, 
    title,
    grade 
FROM students 
INNER JOIN papers 
    ON students.id = papers.student_id;
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  |    60 |
| Caleb      | My Second Book Report                 |    75 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Carlos     | Borges and Magical Realism            |    89 |
+------------+---------------------------------------+-------+

# Q2 
SELECT 
    first_name, 
    title,
    grade 
FROM students 
LEFT JOIN papers 
    ON students.id = papers.student_id;
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  |    60 |
| Caleb      | My Second Book Report                 |    75 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Raj        | NULL                                  |  NULL |
| Carlos     | Borges and Magical Realism            |    89 |
| Lisa       | NULL                                  |  NULL |
+------------+---------------------------------------+-------+


# Q3
SELECT 
    first_name, 
    IFNULL(title, 'MISSING'),
    IFNULL(grade, 0)
FROM students 
LEFT JOIN papers 
    ON students.id = papers.student_id;
+------------+---------------------------------------+------------------+
| first_name | IFNULL(title, 'MISSING')              | IFNULL(grade, 0) |
+------------+---------------------------------------+------------------+
| Caleb      | My First Book Report                  |               60 |
| Caleb      | My Second Book Report                 |               75 |
| Samantha   | Russian Lit Through The Ages          |               94 |
| Samantha   | De Montaigne and The Art of The Essay |               98 |
| Raj        | MISSING                               |                0 |
| Carlos     | Borges and Magical Realism            |               89 |
| Lisa       | MISSING                               |                0 |
+------------+---------------------------------------+------------------+

# Q4
SELECT 
    first_name, 
    IFNULL(AVG(grade), 0) AS average
FROM students 
LEFT JOIN papers 
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY  average DESC;
+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   | 96.0000 |
| Carlos     | 89.0000 |
| Caleb      | 67.5000 |
| Raj        |  0.0000 |
| Lisa       |  0.0000 |
+------------+---------+
5 rows in set (0.00 sec)


# Q5
SELECT 
    first_name, 
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN AVG(grade) IS NULL THEN 'FAILING'
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students 
LEFT JOIN papers 
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY  average DESC;
+------------+---------+----------------+
| first_name | average | passing_status |
+------------+---------+----------------+
| Samantha   | 96.0000 | PASSING        |
| Carlos     | 89.0000 | PASSING        |
| Caleb      | 67.5000 | FAILING        |
| Raj        |  0.0000 | FAILING        |
| Lisa       |  0.0000 | FAILING        |
+------------+---------+----------------+

# ============================================================
⭐️ Many TO Many 
# ============================================================

# Let's set up the Schema and insert data
CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(100), 
    last_name VARCHAR(100)
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(100), 
    released_year YEAR(4), 
    genre VARCHAR(100)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');


SELECT * FROM series;
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
|  1 | Archer                |          2009 | Animation |
|  2 | Arrested Development  |          2003 | Comedy    |
|  3 | Bob's Burgers'        |          2011 | Animation |
|  4 | Bojack Horseman       |          2014 | Animation |
|  5 | Breaking Bad          |          2008 | Drama     |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
|  7 | Fargo                 |          2014 | Drama     |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
|  9 | General Hospital      |          1963 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
| 12 | Pushing Daisies       |          2007 | Comedy    |
| 13 | Seinfeld              |          1989 | Comedy    |
| 14 | Stranger Things       |          2016 | Drama     |
+----+-----------------------+---------------+-----------+

SELECT * FROM reviewers;
+----+------------+-----------+
| id | first_name | last_name |
+----+------------+-----------+
|  1 | Thomas     | Stoneman  |
|  2 | Wyatt      | Skaggs    |
|  3 | Kimbra     | Masters   |
|  4 | Domingo    | Cortes    |
|  5 | Colt       | Steele    |
|  6 | Pinkie     | Petit     |
|  7 | Marlon     | Crafford  |
+----+------------+-----------+

# ⭐️⭐️⭐️
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    rating DECIMAL(2, 1), 
    series_id INT, 
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);


mysql> select * from reviews;
+----+--------+-----------+-------------+
| id | rating | series_id | reviewer_id |
+----+--------+-----------+-------------+
|  1 |    8.0 |         1 |           1 |
|  2 |    7.5 |         1 |           2 |
|  3 |    8.5 |         1 |           3 |
|  4 |    7.7 |         1 |           4 |
|  5 |    8.9 |         1 |           5 |
|  6 |    8.1 |         2 |           1 |
|  7 |    6.0 |         2 |           4 |
|  8 |    8.0 |         2 |           3 |
|  9 |    8.4 |         2 |           6 |
| 10 |    9.9 |         2 |           5 |
| 11 |    7.0 |         3 |           1 |
| 12 |    7.5 |         3 |           6 |
| 13 |    8.0 |         3 |           4 |
| 14 |    7.1 |         3 |           3 |
| 15 |    8.0 |         3 |           5 |



# ============================================================
#❓❓❓❓ Challenge starts here !!!❓❓❓
# ============================================================
# Challenge 1 
SELECT 
    title, 
    rating
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id;
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob's Burgers        |    7.0 |
| Bob's Burgers        |    7.5 |
| Bob's Burgers        |    8.0 |
| Bob's Burgers        |    7.1 |
| Bob's Burgers'       |    8.0 |
+----------------------+--------+

# Challenge 2
SELECT 
    title, 
    AVG(rating) AS avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id;
ORDER BY avg_rating;

+----------------------+------------+
| title                | avg_rating |
+----------------------+------------+
| Archer               |    8.12000 |
| Arrested Development |    8.08000 |
| Bob's Burgers'       |    7.52000 |
| Bojack Horseman      |    7.94000 |
| Breaking Bad         |    9.36000 |
| Curb Your Enthusiasm |    8.12000 |
| Fargo                |    9.40000 |
| Freaks and Geeks     |    8.60000 |
| General Hospital     |    5.38000 |
| Halt and Catch Fire  |    9.90000 |
| Seinfeld             |    7.60000 |
| Stranger Things      |    8.76667 |
+----------------------+------------+


# Challenge 3
SELECT
    first_name,
    last_name,
    rating
FROM reviewers
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id;
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |

# Challenge 4

SELECT 
    title AS unreviewed_series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;

+-----------------------+
| unreviewed_series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+

# Challenge 5

SELECT 
    genre, 
    round(AVG(rating),2) AS avg_rating
FROM series
INNER JOIN reviews 
    ON series.id = reviews.series_id
GROUP BY genre;

+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Comedy    |       8.16 |
| Drama     |       8.04 |
+-----------+------------+

# Challenge 6
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(AVG(rating), 0) AS AVG,
    IF (COUNT(rating) >=1, 'ACTIVE', 'INACTIVE') AS STATUS,
    # CASE 
    #     WHEN AVG(rating) > 0 THEN 'ACTIVE'
    #     ELSE 'INACTVTIVE'
    # END AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

+------------+-----------+-------+-----+-----+---------+------------+
| first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS     |
+------------+-----------+-------+-----+-----+---------+------------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE     |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE     |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE     |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE     |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE     |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE     |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTVTIVE |
+------------+-----------+-------+-----+-----+---------+------------+

# Challenge ７
SELECT
    title,
    rating,
    CONCAT( first_name, ' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id
INNER JOIN series 
    ON series.id = reviews.series_id
ORDER BY title;







