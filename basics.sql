## ⭐️ Open up the sql command line
mysql-ctl cli

# to run (optional);
source query.sql

## ⭐️ Creating Databases and Tables

# (To find out which database is currently selected);
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| menagerie  |
+------------+

# To find out what databases currently exist on the server;
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cat_app            |
| cats               |

+--------------------+

# To create new database;
mysql> CREATE DATABASE <name_of_the_database>;

# To access the database you want to use;
mysql> USE <name_of_the_database>



# Create table with specification of the layout of the table
mysql> CREATE TABLE employees(
        id INT AUTO_INCREMENT NOT NULL, 
        first_name VARCHAR(255) NOT NULL, 
        last_name VARCHAR(255) NOT NULL,
        middle_name VARCHAR(255),
        age INT NOT NULL, 
        current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
        PRIMARY KEY (id)
    );
    
    
    
# To show the list of the table;
mysql> SHOW TABLES;
+---------------------+
| Tables_in_menagerie |
+---------------------+
| event               |
| pet                 |
+---------------------+

#To verify that your table was created the way you expected;
mysql> DESC employees;
+----------------+--------------+------+-----+----------+----------------+
| Field          | Type         | Null | Key | Default  | Extra          |
+----------------+--------------+------+-----+----------+----------------+
| id             | int(11)      | NO   | PRI | NULL     | auto_increment |
| first_name     | varchar(255) | NO   |     | NULL     |                |
| last_name      | varchar(255) | NO   |     | NULL     |                |
| middle_name    | varchar(255) | YES  |     | NULL     |                |
| age            | int(11)      | NO   |     | NULL     |                |
| current_status | varchar(255) | NO   |     | employed |                |
+----------------+--------------+------+-----+----------+----------------+

## ⭐️ Inserting Data
#To create insert a data into the table;
mysql> INSERT INTO employees(first_name, last_name, age) VALUES ('Dora', 'Smith', 58);


## ⭐️ READ (how to retrieve and search data)
mysql> SELECT * FROM cats;
+--------+----------------+------------+------+
| cat_id | name           | breed      | age  |
+--------+----------------+------------+------+
|      1 | Ringo          | Tabby      |    4 |
|      2 | Cindy          | Maine Coon |   10 |

+--------+----------------+------------+------+

# to select single column;
mysql> SELECT name FROM cats;
+----------------+
| name           |
+----------------+
| Ringo          |
| Cindy          |
| Dumbledore     |

| Jackson        |
+----------------+

# to select multiple columns;
mysql> SELECT name, age FROM cats;
+----------------+------+
| name           | age  |
+----------------+------+
| Ringo          |    4 |
| Cindy          |   10 |
| Dumbledore     |   11 |

+----------------+------+

# to select specified data:
mysql> SELECT * FROM cats WHERE age =4;
--------+-------+---------+------+
| cat_id | name  | breed   | age  |
+--------+-------+---------+------+
|      1 | Ringo | Tabby   |    4 |
|      4 | Egg   | Persian |    4 |
+--------+-------+---------+------+


# ⭐️ Aliases: to change the displayed name of the column
mysql> SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
+----------------+-------------+
| cat name       | kitty breed |
+----------------+-------------+
| Ringo          | Tabby       |
| Cindy          | Maine Coon  |
| Dumbledore     | Maine Coon  |


# ⭐️ UPDATE: 
mysql> UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
# mysql> SELECT * FROM cats;
+--------+----------------+------------+------+
| cat_id | name           | breed      | age  |
+--------+----------------+------------+------+
|      1 | Ringo          | Shorthair  |    4 |
|      2 | Cindy          | Maine Coon |   10 |
|      3 | Dumbledore     | Maine Coon |   11 |


# ⭐️ DELETE:
# First of all, select! mysql> SELECT * FROM cats WHERE name='egg';
mysql> DELETE FROM cats WHERE name='egg';


#======#======#======#======#======#======#======#======#======#======#======#======
## ⭐️⭐️ String functions
# ⭐️ Concat 
mysql> SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name'FROM books;
+----------------------+
| full name            |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Neil Gaiman          |
| Jhumpa Lahiri        |
| Dave Eggers          |

# ⭐️ Concat with Separator
mysql> 
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;

+------------------------------------------------------------------------+
| CONCAT_WS(' - ', title, author_fname, author_lname)                    |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
| Interpreter of Maladies - Jhumpa - Lahiri                              |

# ⭐️ SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
+--------------------------------+
| SUBSTRING('Hello World', 1, 4) |
+--------------------------------+
| Hell                           |

SELECT SUBSTRING('Hello World', 3, 8);
+-----------------------------+
| SUBSTRING('Hello World', 3) |
+-----------------------------+
| llo World                   |
+-----------------------------+

SELECT SUBSTRING(title, 1, 10) AS 'Short title' FROM books;
+-------------+
| Short title |
+-------------+
| The Namesa  |
| Norse Myth  |
| American G  |
| Interprete  |

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;
+---------------+
| short title   |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |


# ⭐️ REPLACE;
+----------------------------------------+
| REPLACE('Hello World', 'Hell', '%$#@') |
+----------------------------------------+
| %$#@o World                            |
+----------------------------------------+

SELECT 
	SUBSTRING(REPLACE(title, 'e', 3), 1, 10) AS 'weired string'
FROM books;
+---------------+
| weired string |
+---------------+
| Th3 Nam3sa    |
| Nors3 Myth    |
| Am3rican G    |
| Int3rpr3t3    |

# ⭐️ REVERSE;
SELECT REVERSE('Hello World');
+------------------------+
| REVERSE('Hello World') |
+------------------------+
| dlroW olleH            |
+------------------------+

mysql> SELECT REVERSE(author_fname) FROM books;
+-----------------------+
| REVERSE(author_fname) |
+-----------------------+
| apmuhJ                |
| lieN                  |
| lieN                  |

# ⭐️ CHAR_LENGTH;
mysql> SELECT CHAR_LENGTH('Hello World');
+----------------------------+
| CHAR_LENGTH('Hello World') |
+----------------------------+
|                         11 |
+----------------------------+

mysql> SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
+----------------+--------+
| author_lname   | length |
+----------------+--------+
| Lahiri         |      6 |
| Gaiman         |      6 |
| Gaiman         |      6 |

# ⭐️ UPPER and LOWER;
mysql> SELECT UPPER('Hello World');
+----------------------+
| UPPER('Hello World') |
+----------------------+
| HELLO WORLD          |
+----------------------+

mysql> SELECT UPPER(title) FROM books;
+-----------------------------------------------------+
| UPPER(title)                                        |
+-----------------------------------------------------+
| THE NAMESAKE                                        |
| NORSE MYTHOLOGY                                     |
| AMERICAN GODS                                       |
| INTERPRETER OF MALADIES                             |

# ⭐️ Distinct;
# T0 display rows which you selected without duplication.
mysql> SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname, ' ',author_lname) FROM books;
+----------------------------------------+
| CONCAT(author_fname, ' ',author_lname) |
+----------------------------------------+
| Jhumpa Lahiri                          |
| Neil Gaiman                            |
| Dave Eggers                            |
| Michael Chabon                         |
| Patti Smith                            |
| Raymond Carver                         |
| Don DeLillo                            |
| John Steinbeck                         |
| David Foster Wallace                   |
| Dan Harris                             |
| Freida Harris                          |
| George Saunders                        |
+----------------------------------------+

# ⭐️ ORDER BY
mysql> SELECT author_lname FROM books ORDER BY author_lname;
+----------------+
| author_lname   |
+----------------+
| Carver         |
| Carver         |
| Chabon         |
| DeLillo        |
| Eggers         |

mysql> SELECT title FROM books ORDER BY title;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| 10% Happier                                         |
| A Heartbreaking Work of Staggering Genius           |
| A Hologram for the King: A Novel                    |
| American Gods                                       |
| Cannery Row                                         |
| Consider the Lobster                                |
| Coraline                                            |

mysql> SELECT title FROM books ORDER BY title DESC;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| White Noise                                         |
| Where I am Calling From: Selected Stories           |
| What We Talk About When We Talk About Love: Stories |
| The Namesake                                        |

mysql> SELECT author_fname, author_lname FROM booksORDER BY author_lname, author_fname;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |

# ⭐️ LIMIT 
mysql> SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

# ⭐️ LIKE 
mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
| fake_book                                 | Freida       |
+-------------------------------------------+--------------+

mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
+-------------------------------------------+--------------+

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';




# ========

# ⭐️⭐️⭐️⭐️ Aggragate Functionss 
# ⭐️ Count
mysql> SELECT COUNT(*) from books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+

mysql> SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)

# ⭐️ Group By 
mysql> SELECT author_lname, COUNT(*)
    -> FROM books GROUP BY author_lname;
+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Carver         |        2 |
| Chabon         |        1 |
| DeLillo        |        1 |
| Eggers         |        3 |
| Foster Wallace |        2 |
| Gaiman         |        3 |
| Harris         |        2 |
| Lahiri         |        2 |
| Saunders       |        1 |
| Smith          |        1 |
| Steinbeck      |        1 |
+----------------+----------+
11 rows in set (0.00 sec)

mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        1 |
| Freida       | Harris         |        1 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+
12 rows in set (0.00 sec)

mysql> SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          1945 |        1 |
|          1981 |        1 |
|          1985 |        1 |
|          1989 |        1 |
|          1996 |        1 |
|          2000 |        1 |
|          2001 |        3 |
|          2003 |        2 |
|          2004 |        1 |
|          2005 |        1 |
|          2010 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2014 |        1 |
|          2016 |        1 |
|          2017 |        1 |
+---------------+----------+

mysql> SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;
+----------------------------+
| year                       |
+----------------------------+
| In 1945 1 book(s) released |
| In 1981 1 book(s) released |
| In 1985 1 book(s) released |
| In 1989 1 book(s) released |
| In 1996 1 book(s) released |
| In 2000 1 book(s) released |
| In 2001 3 book(s) released |
| In 2003 2 book(s) released |
| In 2004 1 book(s) released |
| In 2005 1 book(s) released |
| In 2010 1 book(s) released |
| In 2012 1 book(s) released |
| In 2013 1 book(s) released |
| In 2014 1 book(s) released |
| In 2016 1 book(s) released |
| In 2017 1 book(s) released |
+----------------------------+
16 rows in set (0.00 sec)


# ⭐️ MIN and MAX Basics
mysql> SELECT MIN(released_year)
    -> FROM books;
+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT Max(pages), title FROM books;
+------------+--------------+
| Max(pages) | title        |
+------------+--------------+
|        634 | The Namesake |
+------------+--------------+
1 row in set (0.00 sec)
# This is the problem!!!ALTER

mysql> SELECT title, pages FROM books  WHERE pages = (SELECT Max(pages) FROM books);
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.00 sec)

# ⭐️ SUM
mysql> select sum(pages) from books;
+------------+
| sum(pages) |
+------------+
|       6623 |
+------------+

mysql> select author_fname, author_lname, sum(released_year) from books group by author_fname, author_lname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | sum(released_year) |
+--------------+----------------+--------------------+
| Dan          | Harris         |               2014 |
| Dave         | Eggers         |               6026 |
| David        | Foster Wallace |               4009 |
| Don          | DeLillo        |               1985 |
| Freida       | Harris         |               2001 |
| George       | Saunders       |               2017 |
| Jhumpa       | Lahiri         |               3999 |
| John         | Steinbeck      |               1945 |
| Michael      | Chabon         |               2000 |
| Neil         | Gaiman         |               6020 |
| Patti        | Smith          |               2010 |
| Raymond      | Carver         |               3970 |
+--------------+----------------+--------------------+

# ⭐️ Average function
mysql> SELECT AVG(pages) FROM books;
+------------+
| AVG(pages) |
+------------+
|   348.5789 |

mysql> select released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
+---------------+---------------------+
| released_year | AVG(stock_quantity) |
+---------------+---------------------+
|          1945 |             95.0000 |
|          1981 |             23.0000 |
|          1985 |             49.0000 |
|          1989 |             12.0000 |
|          1996 |             97.0000 |
|          2000 |             68.0000 |
|          2001 |            134.3333 |
|          2003 |             66.0000 |
|          2004 |            172.0000 |
|          2005 |             92.0000 |
|          2010 |             55.0000 |
|          2012 |            154.0000 |
|          2013 |             26.0000 |
|          2014 |             29.0000 |
|          2016 |             43.0000 |
|          2017 |           1000.0000 |
+---------------+---------------------+

mysql> select author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | AVG(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |   351.0000 |
| Michael      | Chabon         |   634.0000 |
| Don          | DeLillo        |   320.0000 |
| Dave         | Eggers         |   431.0000 |
| David        | Foster Wallace |   336.0000 |
| Neil         | Gaiman         |   325.6667 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| Jhumpa       | Lahiri         |   244.5000 |
| George       | Saunders       |   367.0000 |
| Patti        | Smith          |   304.0000 |
| John         | Steinbeck      |   181.0000 |
+--------------+----------------+------------+