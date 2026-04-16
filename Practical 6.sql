CREATE TABLE Departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50),
    location VARCHAR2(50)
);

CREATE TABLE Employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    dept_id NUMBER,
    salary NUMBER,
    manager_id NUMBER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
    proj_id NUMBER PRIMARY KEY,
    proj_name VARCHAR2(100)
);

CREATE TABLE Assignments (
    emp_id NUMBER,
    proj_id NUMBER,
    hours_worked NUMBER,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

INSERT INTO Departments VALUES (1,'IT','Nagpur');
INSERT INTO Departments VALUES (2,'HR','Mumbai');
INSERT INTO Departments VALUES (3,'Finance','Delhi');
INSERT INTO Departments VALUES (4,'Marketing','Bangalore');
INSERT INTO Departments VALUES (5,'Operations','Pune');

INSERT INTO Employees VALUES (101,'Rohit Sharma',1,120000,NULL);
INSERT INTO Employees VALUES (102,'Priya Mehta',2,90000,101);
INSERT INTO Employees VALUES (103,'Arpita Desai',3,98000,101);
INSERT INTO Employees VALUES (104,'Sanskruti Mishra',4,100000,102);
INSERT INTO Employees VALUES (105,'Arjun Mishra',5,50000,102);
INSERT INTO Employees VALUES (106,'Krishna Sharma',2,200000,101);
INSERT INTO Employees VALUES (108,'Sourabh Jain',3,200000,103);

INSERT INTO Projects VALUES (201,'Website Revamp');
INSERT INTO Projects VALUES (202,'Internal Tool');
INSERT INTO Projects VALUES (203,'Recruitment Portal');
INSERT INTO Projects VALUES (204,'Budget Analysis');
INSERT INTO Projects VALUES (205,'Marketing Campaign');
INSERT INTO Projects VALUES (206,'Process Optimization');

INSERT INTO Assignments VALUES (101,201,10);
INSERT INTO Assignments VALUES (101,202,5);
INSERT INTO Assignments VALUES (102,201,8);
INSERT INTO Assignments VALUES (103,203,12);
INSERT INTO Assignments VALUES (105,204,15);
INSERT INTO Assignments VALUES (106,202,7);

SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employees e
NATURAL JOIN Departments d;

SELECT e.emp_name, p.proj_name
FROM Employees e
LEFT JOIN Assignments a
ON e.emp_id = a.emp_id
LEFT JOIN Projects p
ON a.proj_id = p.proj_id;

SELECT p.proj_name, e.emp_name
FROM Projects p
RIGHT JOIN Assignments a
ON p.proj_id = a.proj_id
RIGHT JOIN Employees e
ON a.emp_id = e.emp_id;

SELECT e.emp_name, p.proj_name
FROM Projects p
RIGHT JOIN Assignments a
ON p.proj_id = a.proj_id
RIGHT JOIN Employees e
ON a.emp_id = e.emp_id;

SELECT e.emp_name, d.dept_name
FROM Employees e
FULL OUTER JOIN Departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.emp_id;

SELECT e.emp_name, p.proj_name
FROM Employees e
CROSS JOIN Projects p;
