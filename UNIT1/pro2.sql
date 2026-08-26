-- Q2. Write a PL/SQL block to calculate the square and cube of a given number.

SET SERVEROUTPUT ON;

DECLARE
    N NUMBER;
    SQUARE NUMBER;
    CUBE NUMBER;
BEGIN
    N := &N;

    SQUARE := N * N;
    CUBE := N * N * N;

    DBMS_OUTPUT.PUT_LINE('Number = ' || N);
    DBMS_OUTPUT.PUT_LINE('Square = ' || SQUARE);
    DBMS_OUTPUT.PUT_LINE('Cube = ' || CUBE);
END;
/