-- Q2. Write a PL/SQL block that uses a cursor attribute %ISOPEN and
-- %NOTFOUND to raise the basic salary of employees of department
-- number 20 by 5% and also display the appropriate message based
-- on the existence of the record in the EMP table. Whenever any
-- such raise is given to the employees, a record for the same is
-- maintained in the emp_update table.
-- (Perform using both Implicit and Explicit Cursor)

SET SERVEROUTPUT ON;

DECLARE
    V_COUNT NUMBER;
BEGIN
    UPDATE EMP
    SET BASIC_SALARY = BASIC_SALARY * 1.05
    WHERE DEPT_NO = 20;

    V_COUNT := SQL%ROWCOUNT;

    IF V_COUNT > 0 THEN
        INSERT INTO EMP_UPDATE
        SELECT EID, ENAME, DEPT_NO, BASIC_SALARY
        FROM EMP
        WHERE DEPT_NO = 20;

        DBMS_OUTPUT.PUT_LINE('Salary increased by 5%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found in department number 20');
    END IF;

    COMMIT;
END;
/

DECLARE
    CURSOR C_EMP IS
        SELECT EID, ENAME, DEPT_NO, BASIC_SALARY
        FROM EMP
        WHERE DEPT_NO = 20
        FOR UPDATE;

    V_EID EMP.EID%TYPE;
    V_NAME EMP.ENAME%TYPE;
    V_DEPT EMP.DEPT_NO%TYPE;
    V_SALARY EMP.BASIC_SALARY%TYPE;
    V_FOUND BOOLEAN := FALSE;
BEGIN
    OPEN C_EMP;

    IF C_EMP%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open');
    END IF;

    LOOP
        FETCH C_EMP INTO V_EID, V_NAME, V_DEPT, V_SALARY;

        EXIT WHEN C_EMP%NOTFOUND;

        V_FOUND := TRUE;

        V_SALARY := V_SALARY * 1.05;

        UPDATE EMP
        SET BASIC_SALARY = V_SALARY
        WHERE CURRENT OF C_EMP;

        INSERT INTO EMP_UPDATE
        VALUES (V_EID, V_NAME, V_DEPT, V_SALARY);
    END LOOP;

    IF V_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Salary increased by 5%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found in department number 20');
    END IF;

    CLOSE C_EMP;

    COMMIT;
END;
/