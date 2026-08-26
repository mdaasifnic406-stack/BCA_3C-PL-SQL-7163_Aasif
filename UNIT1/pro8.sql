-- Q8. Write a PL/SQL block to calculate the Gross Salary
-- of an employee using the EMP table.

SET SERVEROUTPUT ON;

-- Create EMP table

CREATE TABLE EMP
(
    EID NUMBER PRIMARY KEY,
    ENAME VARCHAR2(50),
    GENDER VARCHAR2(10),
    DEPT VARCHAR2(30),
    BASIC_SALARY NUMBER
);

-- Insert sample records

INSERT INTO EMP VALUES (101, 'Aasif', 'Male', 'IT', 30000);
INSERT INTO EMP VALUES (102, 'Rahul', 'Male', 'HR', 25000);
INSERT INTO EMP VALUES (103, 'Priya', 'Female', 'HR', 28000);
INSERT INTO EMP VALUES (104, 'Amit', 'Male', 'Finance', 35000);

COMMIT;

-- PL/SQL Program

DECLARE
    V_EID EMP.EID%TYPE;
    V_ENAME EMP.ENAME%TYPE;
    V_BASIC EMP.BASIC_SALARY%TYPE;
    V_HRA NUMBER;
    V_DA NUMBER;
    V_GROSS NUMBER;
BEGIN
    V_EID := &EID;

    SELECT EID, ENAME, BASIC_SALARY
    INTO V_EID, V_ENAME, V_BASIC
    FROM EMP
    WHERE EID = V_EID;

    V_HRA := V_BASIC * 0.20;
    V_DA := V_BASIC * 0.10;
    V_GROSS := V_BASIC + V_HRA + V_DA;

    DBMS_OUTPUT.PUT_LINE('Employee ID = ' || V_EID);
    DBMS_OUTPUT.PUT_LINE('Employee Name = ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || V_BASIC);
    DBMS_OUTPUT.PUT_LINE('HRA = ' || V_HRA);
    DBMS_OUTPUT.PUT_LINE('DA = ' || V_DA);
    DBMS_OUTPUT.PUT_LINE('Gross Salary = ' || V_GROSS);
END;
/