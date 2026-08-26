-- Q4. Write a PL/SQL block to convert a given measurement
-- from feet to inches and meters.

SET SERVEROUTPUT ON;

DECLARE
    FEET NUMBER;
    INCHES NUMBER;
    METERS NUMBER;
BEGIN
    FEET := &FEET;

    INCHES := FEET * 12;
    METERS := FEET * 0.3048;

    DBMS_OUTPUT.PUT_LINE('Measurement in Feet = ' || FEET);
    DBMS_OUTPUT.PUT_LINE('Measurement in Inches = ' || INCHES);
    DBMS_OUTPUT.PUT_LINE('Measurement in Meters = ' || METERS);
END;
/