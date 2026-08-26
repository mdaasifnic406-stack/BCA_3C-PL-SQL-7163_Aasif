-- Q5. Write a PL/SQL block to convert temperature
-- from Celsius to Fahrenheit.

SET SERVEROUTPUT ON;

DECLARE
    CELSIUS NUMBER;
    FAHRENHEIT NUMBER;
BEGIN
    CELSIUS := &CELSIUS;

    FAHRENHEIT := (CELSIUS * 9 / 5) + 32;

    DBMS_OUTPUT.PUT_LINE('Temperature in Celsius = ' || CELSIUS);
    DBMS_OUTPUT.PUT_LINE('Temperature in Fahrenheit = ' || FAHRENHEIT);
END;
/