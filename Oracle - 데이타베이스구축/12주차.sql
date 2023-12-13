   SET serveroutput ON;
   
   DECLARE
         v_lname  VARCHAR(25);
    BEGIN
        SELECT  last_name  INTO v_lname
        FROM employees
        WHERE employee_id = 101;
        DBMS_OUTPUT.PUT_LINE('Employee last name is ' || v_lname);
     EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRORS');
    END;

  -- VARRAY type

  DECLARE
     TYPE Foursome IS VARRAY(4) OF VARCHAR2(15);  -- VARRAY type
     -- varray variable initialized with constructor:
     team Foursome := Foursome('John', 'Mary', 'Alberto', 'Juanita');
  BEGIN 
     DBMS_OUTPUT.PUT_LINE('---'); 
     FOR i IN team.FIRST .. team.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(i || '.' || team(i));
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('---'); 
   END;
   

 -- nested table type
 
DECLARE
     TYPE Roster IS TABLE OF VARCHAR2(15);  -- nested table type
     -- nested table variable initialized with constructor:
     names Roster := Roster('D Caruso', 'J Hamil', 'D Piro', 'R Singh');
BEGIN 
     DBMS_OUTPUT.PUT_LINE('---');
     FOR i IN names.FIRST .. names.LAST LOOP  -- For first to last element
         DBMS_OUTPUT.PUT_LINE(names(i));
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('---');
END;

-- Associative array type

  DECLARE
     TYPE population IS TABLE OF NUMBER  -- Associative array type
     INDEX BY VARCHAR2(64);            --  indexed by string
     city_population  population;        -- Associative array variable
  BEGIN 
     city_population('Smallville')  := 2000;      -- Add elements (key-value pairs)
     city_population('Midland')     := 750000;  
     city_population('Megalopolis') := 1000000;
     DBMS_Output.PUT_LINE(city_population('Smallville'));
     DBMS_Output.PUT_LINE(city_population('Midland'));
  END;
  
  -- 레코드
  
  DECLARE
  TYPE DeptRecType IS RECORD (
    dept_id    NUMBER(4) NOT NULL := 10,
    dept_name  VARCHAR2(30) NOT NULL := 'Administration',
    mgr_id     NUMBER(6) := 200,
    loc_id     NUMBER(4)
  );
  dept_rec DeptRecType;
  
  BEGIN
  DBMS_OUTPUT.PUT_LINE('dept_rec:');
  DBMS_OUTPUT.PUT_LINE('---------');
  DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
  DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
  DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
  DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
END;


-- 중첩레코드

DECLARE
   TYPE name_rec IS RECORD (
    first  employees.first_name%TYPE,
    last   employees.last_name%TYPE
   );
   TYPE contact IS RECORD (
    name  name_rec,                    -- nested record
    phone employees.phone_number%TYPE
  );
  friend contact;
  
  BEGIN
  friend.name.first := 'John';
  friend.name.last := 'Smith';
  friend.phone := '1-650-555-1234';

   DBMS_OUTPUT.PUT_LINE (   friend.name.first  || ', ' || 
       friend.name.last   || ', ' ||    friend.phone  );
END;





-- 조건문

DECLARE
    sales  NUMBER := 10100;
    quota  NUMBER := 10500;
    bonus  NUMBER := 0;

BEGIN
     IF sales > (quota + 200) THEN
        bonus := (sales - quota)/4;
    ELSE
        IF sales > quota THEN
            bonus := 50;
        ELSE
           bonus := 0;
         END IF;
      END IF;
    DBMS_OUTPUT.PUT_LINE('bonus = ' || bonus);
END;


DECLARE
    grade  CHAR(1);
    
BEGIN
    grade := 'B';
    
    CASE  grade
        WHEN  'A'   THEN  DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN  'B'   THEN  DBMS_OUTPUT.PUT_LINE('Very Good');
        WHEN  'C'   THEN  DBMS_OUTPUT.PUT_LINE('Good');
        WHEN  'D'   THEN  DBMS_OUTPUT.PUT_LINE('Fair');
        WHEN  'F'   THEN  DBMS_OUTPUT.PUT_LINE('Poor');

        ELSE  DBMS_OUTPUT.PUT_LINE('No such grade');
    
    END CASE;
END;


-- 반복문

DECLARE
   x  NUMBER := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || TO_CHAR(x));
    x := x + 1;
    IF x > 3 THEN  
       EXIT;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(' After loop:  x = ' || TO_CHAR(x));
END;





BEGIN
  DBMS_OUTPUT.PUT_LINE ('lower_bound < upper_bound');
  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
 
   DBMS_OUTPUT.PUT_LINE ('lower_bound = upper_bound');
   FOR i IN 2..2 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
   END LOOP;
  
   DBMS_OUTPUT.PUT_LINE ('lower_bound > upper_bound');
    FOR i IN 3..1 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
   END LOOP;
END;


DECLARE
  done  BOOLEAN := FALSE;
BEGIN
  WHILE done LOOP
    DBMS_OUTPUT.PUT_LINE ('This line does not print.');
    done := TRUE;  -- This assignment is not made.
  END LOOP;
  WHILE NOT done LOOP
    DBMS_OUTPUT.PUT_LINE ('Hello, world!');
    done := TRUE;
  END LOOP;
END; 



  
  
