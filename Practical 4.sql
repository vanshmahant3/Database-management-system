SELECT first_name FROM emp WHERE first_name LIKE 'A%';

SELECT first_name FROM emp WHERE first_name LIKE '%a%';

SELECT * FROM emp WHERE salary BETWEEN 3800 AND 6000;

SELECT first_name, last_name 
FROM emp 
WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 3;

SELECT * 
FROM department1 
WHERE location IN ('Dallas', 'New York', 'Chicago');

SELECT first_name, last_name, job, salary 
FROM emp 
WHERE job IN ('Clerk', 'Salesman', 'Analyst') 
AND salary > 3000;

SELECT first_name, last_name 
FROM emp 
WHERE job <> 'Manager';

SELECT first_name, last_name, salary 
FROM emp 
WHERE job = 'Clerk' 
AND (salary > (SELECT salary FROM emp WHERE first_name = 'James') 
OR salary > (SELECT salary FROM emp WHERE first_name = 'Scott'));

SELECT emp_no, first_name, last_name 
FROM emp 
WHERE job = 'Clerk' 
AND salary = (SELECT MAX(salary) FROM emp WHERE job = 'Clerk');

SELECT first_name, last_name, deptno, salary 
FROM emp e1 
WHERE salary = (
    SELECT MAX(salary) 
    FROM emp e2 
    WHERE e2.deptno = e1.deptno
);

SELECT first_name, last_name 
FROM emp 
WHERE SUBSTR(first_name, 3, 1) = 'o';

SELECT * 
FROM emp 
WHERE salary BETWEEN 3000 AND 60000;

SELECT first_name, last_name FROM enp WHERE first_name LIKE 'A% AND LENGTH(first_name) >= 3;

SELECT * FROM department1 WHERE location IN ('Dallas', 'NewYork', 'Chicago');

SELECT first_name, last name, job, salary FROM emp WHERE job IN ('Clerk', 'Salesman', 'Analyst') AND salary > 3000;
