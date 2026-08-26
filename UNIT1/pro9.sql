-- Q9. Write a PL/SQL block to display the EID, Name and Address
-- of all employees from the HR department who are Male.

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

BEGIN
    FOR R IN
    (
        SELECT EID, ENAME, ADDRESS
        FROM EMP
        WHERE DEPT = 'HR'
        AND GENDER = 'Male'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID = ' || R.EID);
        DBMS_OUTPUT.PUT_LINE('Employee Name = ' || R.ENAME);
        DBMS_OUTPUT.PUT_LINE('Address = ' || R.ADDRESS);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
END;
/
