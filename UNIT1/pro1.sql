-- Q1. Write a PL/SQL block to calculate Simple Interest.

SET SERVEROUTPUT ON;

DECLARE
    P NUMBER;
    R NUMBER;
    N NUMBER;
    SI NUMBER;
BEGIN
    P := &P;
    R := &R;
    N := &N;

    SI := (P * R * N) / 100;

    DBMS_OUTPUT.PUT_LINE('Principal Amount = ' || P);
    DBMS_OUTPUT.PUT_LINE('Rate of Interest = ' || R);
    DBMS_OUTPUT.PUT_LINE('Number of Years = ' || N);
    DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || SI);
END;
/