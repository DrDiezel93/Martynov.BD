USE basehomework_3;

CREATE TABLE SALESPEOPLE
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    snum INT DEFAULT 1000 UNIQUE,
    sname VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL
);

INSERT INTO SALESPEOPLE (snum, sname, city)
VALUES (1001, 'Peel', 'London'), (1002, 'Serres', 'San Jose'), (1004, 'Motika', 'London'), (1007, 'Rifkin', 'Barcelona'), (1003, 'Axelrod', 'New York');

CREATE TABLE CUSTOMERS
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cnum INT DEFAULT 2000 UNIQUE,
    cname VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    rating INT DEFAULT 0,
    snum INT,
    FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum)
);

INSERT INTO CUSTOMERS (cnum, cname, city, rating, snum)
VALUES (2001, 'Hoffman', 'London', 100, 1001), (2002, 'Giovanni', 'Rome', 200, 1003), (2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002), (2006, 'Clemens', 'London', 100, 1001), (2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE ORDERS
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    onum INT DEFAULT 3000 UNIQUE,
    amt DECIMAL(7,2) NOT NULL,
    odate DATE NOT NULL,
    cnum INT,
    FOREIGN KEY (cnum) REFERENCES CUSTOMERS (cnum),
    snum INT,
    FOREIGN KEY (snum) REFERENCES SALESPEOPLE (snum)
);

INSERT INTO ORDERS (onum, amt, odate, cnum, snum)
VALUES (3001, 18.69, 19900310, 2008, 1007), (3003, 767.19, 19900310, 2001, 1001), (3002, 1900.10, 19900310, 2007, 1004),
(3005, 5160.45, 19900310, 2003, 1002), (3006, 1098.16, 19900310, 2008, 1007), (3009, 1713.23, 19900410, 2002, 1003), 
(3007, 75.75, 19900410, 2004, 1002), (3008, 4723.00, 19900510, 2006, 1001), (3010, 1309.95, 19900610, 2004, 1002),
(3011, 9891.88, 19900610, 2006, 1001);

ALTER TABLE SALESPEOPLE
ADD comm VARCHAR(50) NULL;

# Заполнил стобец comm через графический редакторalter

SELECT city, sname, snum, comm FROM salespeople;

SELECT cname AS 'Заказчики', rating FROM customers WHERE city IN ('SanJose');

SELECT onum, amt, odate FROM orders WHERE amt > 1000;

SELECT MIN(amt) FROM orders;

SELECT cname AS 'Заказчики', rating, city FROM customers WHERE NOT city = 'Rome' AND rating > 100;

SELECT * FROM sem_table ORDER BY salary;

SELECT * FROM sem_table ORDER BY salary DESC;

SELECT specialty, SUM(salary) AS 'Общая зарплата' FROM sem_table 
GROUP BY specialty 
HAVING SUM(salary) > 100000;