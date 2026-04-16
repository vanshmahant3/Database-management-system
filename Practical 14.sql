SET SERVEROUTPUT ON;

DECLARE
  num1 NUMBER := 10;
  num2 NUMBER := 0;
  result NUMBER;
BEGIN
  result := num1 / num2;
  DBMS_OUTPUT.PUT_LINE('Result: ' || result);
EXCEPTION
  WHEN ZERO_DIVIDE THEN
     DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed');
END;
/

DECLARE
   invalid_age EXCEPTION;
   age NUMBER := 16;
BEGIN
   IF age < 18 THEN
       RAISE invalid_age;
   END IF;
   DBMS_OUTPUT.PUT_LINE('Eligible to vote');
EXCEPTION
   WHEN invalid_age THEN
       DBMS_OUTPUT.PUT_LINE('Error: Age must be 18 or above');
END;
/

CREATE TABLE emp (
   emp_id NUMBER PRIMARY KEY,
   emp_name VARCHAR2(50),
   salary NUMBER,
   dept_id NUMBER
);

INSERT INTO emp VALUES (101, 'Rahul', 50000, 10);
INSERT INTO emp VALUES (102, 'Priya', 60000, 20);
INSERT INTO emp VALUES (103, 'Amit', 55000, 10);
INSERT INTO emp VALUES (104, 'Neha', 70000, 30);

COMMIT;

DECLARE
   low_salary EXCEPTION;
   v_salary emp.salary%TYPE;
BEGIN
   SELECT salary INTO v_salary
   FROM emp
   WHERE emp_id = 101;

   IF v_salary < 30000 THEN
       RAISE low_salary;
   END IF;

   DBMS_OUTPUT.PUT_LINE('Salary is valid');
EXCEPTION
   WHEN low_salary THEN
       DBMS_OUTPUT.PUT_LINE('Error: Salary below minimum limit');
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/

DECLARE
   v_salary NUMBER := 20000;
BEGIN
   IF v_salary < 30000 THEN
       RAISE_APPLICATION_ERROR(-20001, 'Salary too low');
   END IF;
END;
/

CREATE OR REPLACE PROCEDURE get_emp_details(p_emp_id NUMBER)
IS
   v_name   emp.emp_name%TYPE;
   v_salary emp.salary%TYPE;
BEGIN
   SELECT emp_name, salary
   INTO v_name, v_salary
   FROM emp
   WHERE emp_id = p_emp_id;

   DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
   DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Error: Employee not found');
   WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE('Error: Duplicate employee IDs found');
   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
/

BEGIN
   get_emp_details(101);
   get_emp_details(999);
END;
/

CREATE OR REPLACE PROCEDURE update_salary(
   p_emp_id NUMBER,
   p_increment NUMBER
)
IS
   v_salary emp.salary%TYPE;
BEGIN
   SELECT salary INTO v_salary
   FROM emp
   WHERE emp_id = p_emp_id;

   IF p_increment < 0 THEN
       RAISE_APPLICATION_ERROR(-20002, 'Increment cannot be negative');
   END IF;

   UPDATE emp
   SET salary = salary + p_increment
   WHERE emp_id = p_emp_id;

   DBMS_OUTPUT.PUT_LINE('Salary updated successfully');
EXCEPTION
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Employee not found');
   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
