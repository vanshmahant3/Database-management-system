CREATE OR REPLACE PROCEDURE count_emp
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM emp1;

    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || v_count);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/

BEGIN
    count_emp;
END;
/

CREATE OR REPLACE PROCEDURE emp_lookup(p_emp_id NUMBER)
IS
    v_name emp1.emp_name%TYPE;
BEGIN
    SELECT emp_name INTO v_name
    FROM emp1
    WHERE emp_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found');
END;
/

BEGIN
    emp_lookup(104);
END;
/


DECLARE
    marks NUMBER := 35;
    e_fail EXCEPTION;
BEGIN
    IF marks < 40 THEN
        RAISE e_fail;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Pass');

EXCEPTION
    WHEN e_fail THEN
        DBMS_OUTPUT.PUT_LINE('Fail');
END;
/

DECLARE
    marks NUMBER := 95;
    e_fail EXCEPTION;
BEGIN
    IF marks < 40 THEN
        RAISE e_fail;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Pass');

EXCEPTION
    WHEN e_fail THEN
        DBMS_OUTPUT.PUT_LINE('Fail');
END;
/

DECLARE
    a NUMBER := 10;
    b NUMBER := 0;
    c NUMBER;
BEGIN
    c := a / b;

    DBMS_OUTPUT.PUT_LINE('Result: ' || c);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
END;
/

CREATE OR REPLACE PROCEDURE bulk_fetch
IS
    CURSOR emp_cursor IS
        SELECT emp_name, salary FROM emp1;

    v_name emp1.emp_name%TYPE;
    v_salary emp1.salary%TYPE;
    v_count NUMBER := 0;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_name || ' - ' || v_salary);
        v_count := v_count + 1;
    END LOOP;

    CLOSE emp_cursor;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No records found');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    bulk_fetch;
END;
/
