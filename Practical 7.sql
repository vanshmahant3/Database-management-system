CREATE TABLE Dept1 (
    dept_id NUMBER(5) PRIMARY KEY,
    dept_name VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE Student1 (
    prn NUMBER(15) PRIMARY KEY,
    name VARCHAR2(50) UNIQUE,
    mobile NUMBER(15),
    d_o_b DATE NOT NULL
);

CREATE TABLE Course (
    course_id NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50) NOT NULL,
    credits NUMBER(1) CHECK (credits BETWEEN 1 AND 5),
    dept_id NUMBER(5),
    start_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (dept_id) REFERENCES Dept1(dept_id)
);

INSERT INTO Dept1 VALUES (1, 'Computer');
INSERT INTO Dept1 VALUES (2, 'IT');

INSERT INTO Student1 VALUES (101, 'Ananya', 9876543210, TO_DATE('01-01-2005','DD-MM-YYYY'));
INSERT INTO Student1 VALUES (102, 'Priya', 9123456780, TO_DATE('15-03-2004','DD-MM-YYYY'));

INSERT INTO Course (course_id, course_name, credits, dept_id)
VALUES (101, 'DBMS', 4, 1);

INSERT INTO Course (course_id, course_name, credits, dept_id)
VALUES (102, 'Operating Systems', 3, 1);
