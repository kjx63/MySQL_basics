# ⭐️ Not Equal
 mysql> SELECT title FROM books WHERE released_year = 2017;
+----------------------+
| title                |
+----------------------+
| Lincoln In The Bardo |
+----------------------+


mysql> SELECT title FROM books WHERE released_year != 2017;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| A Hologram for the King: A Novel                    |
-----

mysql> SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
+-------------+--------------+
| title       | author_lname |
+-------------+--------------+
| 10% Happier | Harris       |
| fake_book   | Harris       |
+-------------+--------------+

mysql> SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Norse Mythology                                     | Gaiman         |
| American Gods                                       | Gaiman         |

# ⭐️ NOT LIKE

mysql> SELECT title FROM books WHERE title LIKE 'W%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories'           |
| White Noise                                         |
+-----------------------------------------------------+

# SELECT BOOKS WITH TITLES THAT DON'T START WITH "W";
mysql> SELECT title FROM books WHERE title NOT LIKE 'W%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| Norse Mythology                           |
| American Gods                             |
| Interpreter of Maladies                   |
| A Hologram for the King: A Novel          |
| The Circle                                |


# ⭐️ Greater Than
mysql> SELECT title, released_year FROM books WHERE released_year > 2000;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| Norse Mythology                           |          2016 |
| American Gods                             |          2001 |
| A Hologram for the King: A Novel          |          2012 |
| The Circle                                |          2013 |
| Just Kids                                 |          2010 |
| A Heartbreaking Work of Staggering Genius |          2001 |

mysql> SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Oblivion: Stories                         |          2004 |

mysql> SELECT title, stock_quantity from books where stock_quantity >= 100 ORDER BY stock_quantity DESC;
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| Lincoln In The Bardo                      |           1000 |
| fake_book                                 |            287 |
| Oblivion: Stories                         |            172 |
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |

mysql> SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
+-------------------------------------------+--------------+
| title                                     | author_lname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Eggers       |
| The Circle                                | Eggers       |
| A Heartbreaking Work of Staggering Genius | Eggers       |
+-------------------------------------------+--------------+

mysql> SELECT title, author_lname FROM books WHERE author_lname = 'eGGers'; // ⭐️ CASE does not matter!!!
+-------------------------------------------+--------------+
| title                                     | author_lname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Eggers       |
| The Circle                                | Eggers       |
| A Heartbreaking Work of Staggering Genius | Eggers       |
+-------------------------------------------+--------------+

# ⭐️ Less Than
mysql> SELECT title, released_year FROM books WHERE released_year <= 2000 ORDER BY released_year;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where I'm Calling From: Selected Stories'           |          1989 |
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
+-----------------------------------------------------+---------------+

# ⭐️ AND (do not use && any more)
mysql> SELECT  title, author_lname, released_year FROM books WHERE author_lname='Eggers' AND released_year > 2010;
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
| The Circle                       | Eggers       |          2013 |
+----------------------------------+--------------+---------------+

mysql> SELECT  title, author_lname, released_year FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
+----------------------------------+--------------+---------------+

# ⭐️ OR (do not use || any more)
mysql> SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010;
+-------------------------------------------+--------------+---------------+
| title                                     | author_lname | released_year |
+-------------------------------------------+--------------+---------------+
| Norse Mythology                           | Gaiman       |          2016 |
| A Hologram for the King: A Novel          | Eggers       |          2012 |
| The Circle                                | Eggers       |          2013 |
| A Heartbreaking Work of Staggering Genius | Eggers       |          2001 |
| 10% Happier                               | Harris       |          2014 |
| Lincoln In The Bardo                      | Saunders     |          2017 |
+-------------------------------------------+--------------+---------------+

# ⭐️ BETWEEN (You can use BETWEEN or greater than (less than) operators)
- BETWEEN X AND Y
mysql> select title, released_year from books WHERE released_year >= 2004 AND released_year <= 2015;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+

mysql> select title, released_year from books WHERE released_year BETWEEN 2004 AND 2015 ORDER BY released_year;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| Just Kids                        |          2010 |
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+

- NOT BETWEEN X AND Y
mysql> select title, released_year from books WHERE released_year NOT BETWEEN 2000 AND 2015 ORDER BY released_year;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where I'm Calling From: Selected Stories'           |          1989 |
| Interpreter of Maladies                             |          1996 |
| Norse Mythology                                     |          2016 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+

mysql> select * from people;
+-----------+------------+-----------+---------------------+
| name      | birthdate  | birthtime | birthdt             |
+-----------+------------+-----------+---------------------+
| padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry     | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
| Microwave | 2020-05-30 | 18:04:59  | 2020-05-30 18:04:59 |
+-----------+------------+-----------+---------------------+

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


# ⭐️ IN 
# ⭐️ NOT IN 
mysql> SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| White Noise          |          1985 |
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+

mysql> SELECT title, released_year FROM books WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| The Circle                                          |          2013 |

# This is not something I should show you here ... but ... this is the another way of selecting odd number
mysql> SELECT title, released_year FROM books
    -> WHERE released_year >= 2000 AND
    -> released_year % 2 != 0;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| American Gods                             |          2001 |
| The Circle                                |          2013 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+

# ⭐️ CASE STATEMENTS 
mysql> SELECT title, released_year,
    ->        CASE
    ->          WHEN released_year >= 2000 THEN 'Modern Lit'
    ->          ELSE '20th Century Lit'
    ->        END AS GENRE
    -> FROM books;
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | GENRE            |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | Modern Lit       |
| Norse Mythology                                     |          2016 | Modern Lit       |
| American Gods                                       |          2001 | Modern Lit       |
| Interpreter of Maladies                             |          1996 | 20th Century Lit |
| A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
| The Circle                                          |          2013 | Modern Lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
| Just Kids                                           |          2010 | Modern Lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
| Coraline                                            |          2003 | Modern Lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
| Where I'm Calling From: Selected Stories'           |          1989 | 20th Century Lit |
| White Noise                                         |          1985 | 20th Century Lit |
| Cannery Row                                         |          1945 | 20th Century Lit |
| Oblivion: Stories                                   |          2004 | Modern Lit       |
| Consider the Lobster                                |          2005 | Modern Lit       |
| 10% Happier                                         |          2014 | Modern Lit       |
| fake_book                                           |          2001 | Modern Lit       |
| Lincoln In The Bardo                                |          2017 | Modern Lit       |
+-----------------------------------------------------+---------------+------------------+

mysql> SELECT title, stock_quantity,
    ->     CASE
    ->         WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    ->         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    ->         ELSE '***'
    ->     END AS STOCK
    -> FROM books;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | **    |
| A Hologram for the King: A Novel                    |            154 | ***   |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I'm Calling From: Selected Stories'           |             12 | *     |
| White Noise                                         |             49 | *     |
| Cannery Row                                         |             95 | **    |
| Oblivion: Stories                                   |            172 | ***   |
| Consider the Lobster                                |             92 | **    |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ***   |
| Lincoln In The Bardo                                |           1000 | ***   |
+-----------------------------------------------------+----------------+-------+

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 