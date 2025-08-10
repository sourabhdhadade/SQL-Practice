CREATE DATABASE College;
CREATE DATABASE University;
CREATE DATABASE Board;

DROP DATABASE University;
DROP DATABASE Board;

USE College;

CREATE TABLE Students(
     rollNo INT PRIMARY KEY,
     name VARCHAR(50),
     age INT
);

INSERT INTO Students VALUES (56, "Sourabh", 20);
INSERT INTO Students VALUES (55, "Shubham", 19);
INSERT INTO Students VALUES (54, "Shrunal", 21);
INSERT INTO Students VALUES (64, "Vishal", 19);
INSERT INTO Students VALUES (65, "Yash", 20);

SELECT * FROM Students;

CREATE DATABASE IF NOT EXISTS University;
CREATE DATABASE IF NOT EXISTS College;

DROP DATABASE IF EXISTS University;
DROP DATABASE IF EXISTS Board;

SHOW DATABASES;
SHOW TABLES;

DROP TABLE Students;

CREATE TABLE Students(
     age INT PRIMARY KEY,
     name VARCHAR(50)
);

SELECT * FROM Students;

INSERT INTO Students 
(age, name) VALUES 
(20, "Sourabh"),
(23, "Shubham"),
(18, "Vishal");

INSERT INTO Students (age, name) VALUES (50, "Mom");
insert into Students Values (49, "Dad");

CREATE DATABASE temp1;

USE temp1;

CREATE TABLE table1(
     age INT NOT NULL,
     id INT UNIQUE,
     primary key (age, id)
);

INSERT INTO table1 
(age, id) VALUES 
(20, 54),
(20, 50),
(23, 51);

SELECT * FROM table1;

CREATE TABLE table2(
     salary INT DEFAULT 50000,
     id INT UNIQUE
);

INSERT INTO table2 
(id) VALUES 
(54),
(55),
(56);

SELECT * FROM table2;

CREATE TABLE table3(
     age INT NOT NULL,
     constraint age1 CHECK (age >= 18)
);

INSERT INTO table3 (age) VALUES (113), (115), (18);

USE college;

DROP TABLE students;

CREATE TABLE dept(
     id INT PRIMARY KEY,
     sub_name VARCHAR(50)
);

INSERT INTO dept
(id, sub_name) VALUES
(11, "Science"),
(12, "Maths"),
(13, "English");


CREATE TABLE teacher(
     id INT PRIMARY KEY,
     teacher_name VARCHAR(50),
     sub_id INT,
     FOREIGN KEY (sub_id) REFERENCES dept(id)
     ON UPDATE CASCADE
     ON DELETE CASCADE
);


INSERT INTO teacher
(id, teacher_name, sub_id) VALUES
(1, "Sour", 22),
(2, "Sofia", 13),
(3, "Kath", 22);

SELECT * FROM teacher;

SELECT * FROM dept;

UPDATE dept
SET id = 22
WHERE id = 11;

ALTER TABLE dept   
ADD age INT NOT NULL DEFAULT 20;

ALTER TABLE dept   
DROP age;

ALTER TABLE department   
RENAME dept;

ALTER TABLE dept   
CHANGE sub_name subject_name VARCHAR(50);

ALTER TABLE dept   
ADD age INT NOT NULL DEFAULT 20;

TRUNCATE TABLE teacher;

DROP TABLE teacher;

ALTER TABLE teacher
CHANGE teacher_name tea_name VARCHAR(50);

ALTER TABLE dept
DROP age;

DELETE FROM dept
WHERE id = 12;


USE college;

DROP TABLE dept;

DROP TABLE teacher;

CREATE TABLE dept(
     id INT PRIMARY KEY,
     sub_name VARCHAR(50)
);

INSERT INTO dept
(id, sub_name) VALUES
(11, "Science"),
(12, "Maths"),
(13, "English");

ALTER TABLE dept
MODIFY id INT ;

CREATE TABLE teacher(
	 sub_id INT,
     teacher_name VARCHAR(50)
);


INSERT INTO teacher
(sub_id, teacher_name) VALUES
(11, "Sour"),
(12, "Sofia"),
(11, "Kath");
 
INSERT INTO teacher
(sub_id, teacher_name) VALUES
(13, "Sour13"),
(14, "Sofia14"),
(15, "Kath15");

SELECT * FROM dept;

SELECT * FROM teacher;

SELECT id FROM dept
UNION
SELECT sub_id FROM teacher;

SELECT * FROM dept AS d
LEFT JOIN teacher AS t
ON d.id = t.sub_id
UNION
SELECT * FROM dept AS d
RIGHT JOIN teacher AS t
ON d.id = t.sub_id;

SELECT * FROM dept AS d
RIGHT JOIN teacher AS t
ON d.id = t.sub_id
WHERE d.id IS NULL;

SELECT * FROM dept AS d
LEFT JOIN teacher AS t
ON d.id = t.sub_id
WHERE t.sub_id IS NULL
UNION
SELECT * FROM dept AS d
RIGHT JOIN teacher AS t
ON d.id = t.sub_id
WHERE d.id IS NULL;

CREATE TABLE table1(
     id INT UNIQUE,
     name VARCHAR(50),
     manager_id INT NOT NULL
);

INSERT INTO table1 
(id, name, manager_id) VALUES 
(21, "A", 43),
(20, "B", 53),
(23, "C", 53),
(43, "D", 21),
(53, "E", 21),
(34, "F", 34);

SET SQL_SAFE_UPDATES = 0;

UPDATE table1
SET manager_id = 34 
WHERE manager_id = 21;

UPDATE table1
SET manager_id = 43 
WHERE manager_id = 34;

SELECT * FROM table1;



SELECT t2.name, t1.name as manager_name
FROM table1 as t1
JOIN table1 as t2
ON t1.id = t2.manager_id;
