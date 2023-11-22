SET SERVEROUTPUT ON
DECLARE
salary HR.EMPLOYEES.salary%TYPE := 0;
manager_id HR.EMPLOYEES.manager_id%TYPE;
last_name HR.EMPLOYEES.last_name%TYPE;
starting_empno HR.EMPLOYEES.employee_id%TYPE := 7499;
BEGIN
SELECT MANAGER_ID INTO manager_id FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = starting_empno;
WHILE salary <= 2500 
LOOP
SELECT salary, manager_id, last_name INTO salary, manager_id, last_name FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = MANAGER_ID;
END LOOP; END;

