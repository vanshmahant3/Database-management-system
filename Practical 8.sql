SET SERVEROUTPUT ON;
DECLARE
    var varchar2(40) := 'I love DBMS';
BEGIN
    dbms_output.put_line(var);
END;
/

CREATE OR REPLACE PROCEDURE add_numbers(a IN NUMBER, b IN NUMBER) AS
    c NUMBER;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum of ' || a || ' and ' || b || ' is = ' || c);
END;
/

BEGIN
    add_numbers(300, 232);
END;
/

DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    c NUMBER;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum of ' || a || ' and ' || b || ' is = ' || c);
END;
/

CREATE TABLE input_values (a NUMBER, b NUMBER);
INSERT INTO input_values VALUES(123, 45);
COMMIT;

DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    SELECT a, b INTO a, b FROM input_values WHERE ROWNUM = 1;
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum of ' || a || ' and ' || b || ' is = ' || c);
END;

DECLARE
    num NUMBER := 92;
BEGIN
    IF MOD(num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Even number');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Odd number');
    END IF;
END;
/

  DECLARE
    num NUMBER := -321;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Positive number');
    ELSIF num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Negative number');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Zero');
    END IF;
END;
/

DECLARE
    marks NUMBER := &marks;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade B');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Grade C');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade F');
    END IF;
END;
/


  DECLARE
    marks NUMBER := 95;
    grade VARCHAR2(10);
BEGIN
    grade := CASE
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 80 THEN 'B'
        WHEN marks >= 70 THEN 'C'
        ELSE 'Fail'
    END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
END;
/
/
