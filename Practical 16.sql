CREATE TABLE BANK_ACCOUNT (
    account_id NUMBER PRIMARY KEY,
    account_name VARCHAR2(50),
    balance NUMBER
);

CREATE OR REPLACE TRIGGER trg_weekday_only
BEFORE INSERT OR UPDATE OR DELETE ON BANK_ACCOUNT
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
BEGIN
    v_day := TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');

    IF v_day IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operation not allowed on weekends!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operation allowed: Today is ' || v_day);
    END IF;
END;
/

INSERT INTO BANK_ACCOUNT VALUES (1, 'Ravi Sharma', 1000);
