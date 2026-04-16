CREATE TABLE EMPLOYEE (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER,
    min_salary NUMBER,
    max_salary NUMBER
);

CREATE OR REPLACE TRIGGER trg_salary_check
BEFORE INSERT OR UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.salary < :NEW.min_salary 
       OR :NEW.salary > :NEW.max_salary THEN
        RAISE_APPLICATION_ERROR(-20002, 'Salary violates allowed range!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary valid for ' || :NEW.emp_name);
    END IF;
END;
/

INSERT INTO EMPLOYEE VALUES (1, 'Alice Mishra', 5000, 1000, 8000);
INSERT INTO EMPLOYEE VALUES (2, 'Mohit Mehra', 90000, 1000, 8000);
