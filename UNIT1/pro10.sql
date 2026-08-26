-- Q10. Write a PL/SQL block to delete an employee record
-- from the EMP table using EID.

SET SERVEROUTPUT ON;

CREATE TABLE EMP
(
    EID NUMBER PRIMARY KEY,
    ENAME VARCHAR2(50),
    GENDER VARCHAR2(10),
    DEPT VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);

INSERT INTO EMP VALUES (101, 'Aasif', 'Male', 'IT', 'Rajkot');
INSERT INTO EMP VALUES (102, 'Rahul', 'Male', 'HR', 'Ahmedabad');
INSERT INTO EMP VALUES (103, 'Priya', 'Female', 'HR', 'Surat');
INSERT INTO EMP VALUES (104, 'Amit', 'Male', 'HR', 'Rajkot');

COMMIT;

DECLARE
    V_EID NUMBER;
BEGIN
    V_EID := &EID;

    DELETE FROM EMP
    WHERE EID = V_EID;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee record not found.');
    END IF;

    COMMIT;
END;
/
