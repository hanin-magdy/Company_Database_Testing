 DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

CREATE TABLE employee (
    ssn VARCHAR(10) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    bdate DATE,
    address VARCHAR(100),
    gender CHAR(1),
    salary NUMERIC(10, 2) CHECK (salary >= 1000),
    superssn VARCHAR(10),
    dno INT
);

CREATE TABLE department (
    dno INT PRIMARY KEY,
    dname VARCHAR(50) NOT NULL,
    mgrssn VARCHAR(10),
    mgrstartdate DATE,
    FOREIGN KEY (mgrssn) REFERENCES employee(ssn) ON DELETE SET NULL
);

ALTER TABLE employee
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dno) REFERENCES department(dno) ON DELETE SET NULL,
ADD CONSTRAINT fk_emp_super FOREIGN KEY (superssn) REFERENCES employee(ssn) ON DELETE SET NULL;

CREATE TABLE project (
    pno INT PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    plocation VARCHAR(50),
    dno INT,
    FOREIGN KEY (dno) REFERENCES department(dno) ON DELETE SET NULL
);

CREATE TABLE works_on (
    essn VARCHAR(10),
    pno INT,
    weekly_hours INT,
    PRIMARY KEY (essn, pno),
    FOREIGN KEY (essn) REFERENCES employee(ssn) ON DELETE CASCADE,
    FOREIGN KEY (pno) REFERENCES project(pno) ON DELETE CASCADE
);

CREATE TABLE students (
    ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Salary NUMERIC(10,2),
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Birth_Date DATE
);

INSERT INTO employee VALUES
('102672', 'Ahmed', 'Ali', '1980-01-01', 'Nasr City', 'M', 3000.00, NULL, NULL),
('102674', 'Mona', 'Hassan', '1985-05-12', 'Maadi', 'F', 2500.00, '102672', NULL),
('102661', 'Asmaa', 'Ali', '1965-10-10', 'Nasr City', 'F', 1500.00, NULL, NULL),
('102688', 'Mostafa', 'Mahmoud', '1990-03-15', 'Nasr City', 'M', 2500.00, NULL, NULL),
('102650', 'Mona', 'Elsayed', '1993-09-12', 'Shubra, Cairo', 'F', 1700.00, NULL, NULL),
('102700', 'Youssef', 'Kamel', '1991-12-01', 'Heliopolis', 'M', 2200.00, NULL, NULL),
('102710', 'Sara', 'Mahmoud', '1994-05-30', 'Alexandria', 'F', 1400.00, NULL, NULL),
('102720', 'Tamer', 'Hosny', '1989-07-07', 'Zamalek', 'M', 1950.00, NULL, NULL);

INSERT INTO department VALUES
(10, 'HR', '102672', '2020-01-01'),
(20, 'IT', '102674', '2021-03-15'),
(30, 'Finance', NULL, NULL);

UPDATE employee SET dno = 10 WHERE ssn IN ('102672', '102661', '102688');
UPDATE employee SET dno = 20 WHERE ssn IN ('102674', '102650');
UPDATE employee SET dno = 30 WHERE ssn IN ('102700', '102710', '102720');

INSERT INTO project VALUES
(100, 'Project Alpha', 'Cairo', 10),
(200, 'Project Beta', 'Alex', 10),
(300, 'HR Portal', 'Cairo', 20),
(400, 'Automation Test', 'Giza', 30),
(500, 'Mobile App', 'Kafrelsheikh', 30);

INSERT INTO works_on VALUES
('102672', 100, 20),
('102674', 100, 10),
('102661', 200, 25),
('102650', 200, 35),
('102700', 300, 40),
('102710', 400, 18),
('102720', 400, 22),
('102661', 300, 15);

INSERT INTO students VALUES
(1, 'Hassan', 'Mahmoud', 1200.00, 'Street 10', 'Cairo', 'Egypt', '2001-05-20'),
(2, 'Mariam', 'Samy', 1500.00, 'Street 15', 'Giza', 'Egypt', '2002-08-20'),
(3, 'Aly', 'Reda', 1100.00, 'Nile Street', 'Alex', 'Egypt', '2000-11-12');