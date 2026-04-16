CREATE TABLE EMP (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

CREATE TABLE AUDIT_EMP (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER,
    operation VARCHAR2(10),
    action_date DATE
);
CREATE OR REPLACE TRIGGER trg_audit_emp
AFTER INSERT OR UPDATE OR DELETE ON EMP
FOR EACH ROW
DECLARE
    v_operation VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operation := 'INSERT';
        INSERT INTO AUDIT_EMP
        VALUES (:NEW.emp_id, :NEW.emp_name, :NEW.salary, v_operation, SYSDATE);

    ELSIF UPDATING THEN
        v_operation := 'UPDATE';
        INSERT INTO AUDIT_EMP
        VALUES (:NEW.emp_id, :NEW.emp_name, :NEW.salary, v_operation, SYSDATE);

    ELSIF DELETING THEN
        v_operation := 'DELETE';
        INSERT INTO AUDIT_EMP
        VALUES (:OLD.emp_id, :OLD.emp_name, :OLD.salary, v_operation, SYSDATE);
    END IF;
END;
/
INSERT INTO EMP VALUES (1, 'Ravi', 3000);

UPDATE EMP
SET salary = 3500
WHERE emp_id = 1;

DELETE FROM EMP
WHERE emp_id = 1;

SELECT * from EMP;
