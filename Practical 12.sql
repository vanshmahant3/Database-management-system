CREATE OR REPLACE PROCEDURE calculate_grades (
    sub1 IN NUMBER,
    sub2 IN NUMBER,
    sub3 IN NUMBER,
    sub4 IN NUMBER
)
IS
    total_marks NUMBER;
    average_marks NUMBER;
    grade VARCHAR2(2);
BEGIN
    total_marks := sub1 + sub2 + sub3 + sub4;

    average_marks := total_marks / 4;

    IF average_marks > 90 THEN
        grade := 'A+';
    ELSIF average_marks > 80 THEN
        grade := 'A';
    ELSIF average_marks >= 70 THEN
        grade := 'B';
    ELSIF average_marks >= 60 THEN
        grade := 'C';
    ELSE
        grade := 'F';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Total: ' || total_marks);
    DBMS_OUTPUT.PUT_LINE('Average: ' || ROUND(average_marks, 2));
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
END;
/


BEGIN
    calculate_grades(85, 78, 92, 88);
END;
/
