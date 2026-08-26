-- Q3. Write a PL/SQL block to accept Product Name, Quantity and Price
-- and calculate the Discount Amount and Final Amount.

SET SERVEROUTPUT ON;

DECLARE
    PRODUCT_NAME VARCHAR2(50);
    QUANTITY NUMBER;
    PRICE NUMBER;
    TOTAL_AMOUNT NUMBER;
    DISCOUNT NUMBER;
    FINAL_AMOUNT NUMBER;
BEGIN
    PRODUCT_NAME := '&PRODUCT_NAME';
    QUANTITY := &QUANTITY;
    PRICE := &PRICE;

    TOTAL_AMOUNT := QUANTITY * PRICE;

    IF TOTAL_AMOUNT >= 5000 THEN
        DISCOUNT := TOTAL_AMOUNT * 0.20;
    ELSIF TOTAL_AMOUNT >= 3000 THEN
        DISCOUNT := TOTAL_AMOUNT * 0.10;
    ELSE
        DISCOUNT := 0;
    END IF;

    FINAL_AMOUNT := TOTAL_AMOUNT - DISCOUNT;

    DBMS_OUTPUT.PUT_LINE('Product Name = ' || PRODUCT_NAME);
    DBMS_OUTPUT.PUT_LINE('Quantity = ' || QUANTITY);
    DBMS_OUTPUT.PUT_LINE('Price = ' || PRICE);
    DBMS_OUTPUT.PUT_LINE('Total Amount = ' || TOTAL_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('Discount = ' || DISCOUNT);
    DBMS_OUTPUT.PUT_LINE('Final Amount = ' || FINAL_AMOUNT);
END;
/