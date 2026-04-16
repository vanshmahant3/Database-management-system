CREATE OR REPLACE PROCEDURE adjust_airfare (
    p_route IN NUMBER
)
IS
    v_distance AIRLINE_ROUTES.distance%TYPE;
    v_new_fare AIRLINE_ROUTES.fare%TYPE;
BEGIN
    -- Fetch distance
    SELECT distance
    INTO v_distance
    FROM AIRLINE_ROUTES
    WHERE route_id = p_route;

    -- Apply conditions
    IF v_distance < 500 THEN
        v_new_fare := 190.98;

        UPDATE AIRLINE_ROUTES
        SET fare = v_new_fare
        WHERE route_id = p_route;

        DBMS_OUTPUT.PUT_LINE('Fare updated to ' || v_new_fare);

    ELSIF v_distance BETWEEN 501 AND 1000 THEN
        v_new_fare := 876;

        UPDATE AIRLINE_ROUTES
        SET fare = v_new_fare
        WHERE route_id = p_route;

        DBMS_OUTPUT.PUT_LINE('Fare updated to ' || v_new_fare);

    ELSE
        DBMS_OUTPUT.PUT_LINE('Distance greater than 1000, fare not updated');
    END IF;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Route ID not found');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
