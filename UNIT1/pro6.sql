-- Q6. Write a PL/SQL block to generate numbers using
-- LOOP, FOR LOOP and WHILE LOOP.

SET SERVEROUTPUT ON;

DECLARE
    I NUMBER;
BEGIN

    DBMS_OUTPUT.PUT_LINE('Using LOOP:');

    I := 1;

    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I + 1;

        EXIT WHEN I > 10;
    END LOOP;


    DBMS_OUTPUT.PUT_LINE('Using FOR LOOP:');

    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;


    DBMS_OUTPUT.PUT_LINE('Using WHILE LOOP:');

    I := 1;

    WHILE I <= 10
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I + 1;
    END LOOP;

END;
/