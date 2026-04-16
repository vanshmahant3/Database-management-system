CREATE OR REPLACE TRIGGER trg_before_insert_emp
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting employee: ' || :NEW.Name);
END;
/

  
CREATE OR REPLACE TRIGGER trg_before_insert_dept
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Department: ' || :NEW.Dept);
END;
/

  
CREATE OR REPLACE TRIGGER trg_after_update_balance
AFTER UPDATE ON Account
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Old: ' || :OLD.Balance || ' New: ' || :NEW.Balance);
END;
/

  
CREATE OR REPLACE TRIGGER trg_block_delete
BEFORE DELETE ON Account
FOR EACH ROW
BEGIN
    IF :OLD.Balance > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete account with balance');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_prevent_customer_delete
BEFORE DELETE ON Customer
FOR EACH ROW
DECLARE
    acc_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO acc_count
    FROM Account
    WHERE CustomerID = :OLD.CustomerID;

    IF acc_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Customer has accounts. Cannot delete.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_customer_update
AFTER UPDATE ON Customer
BEGIN
    DBMS_OUTPUT.PUT_LINE('Customer table updated successfully.');
END;
/
-- Usage: UPDATE Customer SET Name = 'Rahul' WHERE CustomerID = 1;
