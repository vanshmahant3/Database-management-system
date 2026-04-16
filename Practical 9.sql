CREATE TABLE binary_conversions (
    decimal_num NUMBER,
    binary_value VARCHAR2(100)
);

CREATE OR REPLACE FUNCTION decimal_to_binary_steps(n NUMBER)
RETURN VARCHAR2
IS
    num NUMBER := n;
    remainder NUMBER;
    result VARCHAR2(100) := '';
BEGIN
    WHILE num > 0 LOOP
        remainder := MOD(num, 2);
        DBMS_OUTPUT.PUT_LINE('Num: ' || num || ' Remainder: ' || remainder);
        result := remainder || result;
        num := FLOOR(num / 2);
    END LOOP;

    RETURN result;
END;
/

DECLARE
    num NUMBER := 15;
    result VARCHAR2(100);
BEGIN
    result := decimal_to_binary_steps(num);

    INSERT INTO binary_conversions (decimal_num, binary_value)
    VALUES (num, result);

    COMMIT;
END;
/

DECLARE
    num NUMBER;
    result VARCHAR2(100);
BEGIN
    num := &Enter_Number;

    result := decimal_to_binary_steps(num);

    DBMS_OUTPUT.PUT_LINE('Binary: ' || result);
END;
/
