
-- GET TOTAL PROFIT FOR FINANCE DEPARTMENT
-------------------------------------------------------------

CREATE OR REPLACE FUNCTION FINANCE_TOTAL_PROFIT
RETURN NUMBER
IS

        
V_TOTAL_PROFIT_FLGIHTS FLYER_FLIGHT.PAYMENT%TYPE;

BEGIN

    SELECT SUM(PAYMENT) INTO V_TOTAL_PROFIT_FLGIHTS FROM
     FLYER_FLIGHT WHERE  UPPER(TYPE_OF_PAYMENT) = 'CACHE';
     
    
RETURN V_TOTAL_PROFIT_FLGIHTS;
END;

--------------------------------------------------------------



-- GET FULL REPORT ON INTERACTION CARE DATA FOR FLYERS
-------------------------------------------------------------

CREATE OR REPLACE PROCEDURE FLYER_INTERACTION_CARE_DATA
IS

CURSOR FLYER_PROBLEMS_DATA IS 
    SELECT FLYER_ID, NAME, CALENDAR_OF_DAY || '/' || CALENDAR_OF_MONTH || '/' ||CALENDAR_OF_YEAR AS FULL_DATE,
    CARE_TYPE, PROBLEM_SERVED
     FROM CARE_INTERACTION C, FLYER_PROBLEMS FB, DATES D
    WHERE FB.CARE_ID = C.CARE_ID AND FB.DATE_ID = D.DATE_ID;
BEGIN
FOR I IN FLYER_PROBLEMS_DATA LOOP
    
    
    DBMS_OUTPUT.PUT_LINE('Date : ' || I.FULL_DATE);
    DBMS_OUTPUT.PUT_LINE('Flyer ID : ' || I.FLYER_ID);
    DBMS_OUTPUT.PUT_LINE('Care Name : ' || I.NAME);
    DBMS_OUTPUT.PUT_LINE('Care Type : ' || I.CARE_TYPE);
    DBMS_OUTPUT.PUT_LINE('Problem Served : ' || I.PROBLEM_SERVED);
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');
END LOOP;
END;



--------------------------------------------------------------


-- GET FULL DATA OF PORMOTION AND THE REPOND STATUS 
-------------------------------------------------------------
SET SERVEROUTPUT ON SIZE = 99999999
CREATE OR REPLACE PROCEDURE GET_PORMOTIONS_FLYERS_DATA
IS
CURSOR FLYER_PORMOTION_DATA IS 
    SELECT FLYER_ID, NAME, EXPLINATION,  
    CALENDAR_OF_DAY || '/' || CALENDAR_OF_MONTH || '/' ||CALENDAR_OF_YEAR AS FULL_DATE, RESPOND_STATUS
    FROM PORMOTION P, FLYER_PORMOTION FB, DATES D
    WHERE P.PORMOTION_ID = FB.PORMOTION_ID
    AND D.DATE_ID = FB.DATE_ID; 
V_RESPOND_TEXT VARCHAR2(5);
BEGIN

    FOR I IN FLYER_PORMOTION_DATA LOOP 
        
        IF I.RESPOND_STATUS = 0 THEN 
            V_RESPOND_TEXT := 'No'; 
        ELSE 
            V_RESPOND_TEXT := 'Yes';
        
        END IF;
        DBMS_OUTPUT.PUT_LINE('Flyer ID : ' || I.FLYER_ID);
        DBMS_OUTPUT.PUT_LINE('Pormotion Name : ' || I.NAME);
        DBMS_OUTPUT.PUT_LINE('Full Date : ' || I.FULL_DATE);
        DBMS_OUTPUT.PUT_LINE('Pormotion Data : ' || I.EXPLINATION);
        DBMS_OUTPUT.PUT_LINE('Resond Status : ' || V_RESPOND_TEXT);
    END LOOP; 
END;


--------------------------------------------------------------------------------------------------------------

-- Get How long Flyers over night stays in flight 
-------------------------------------------------------------------
create or replace procedure  show_night_stay
is 

cursor flyer_f is
select*from flyer_flight;


begin

for f_record in flyer_f loop

dbms_output.put_line('Flyer ID'|| f_record.flyer_id);
dbms_output.put_line('Flight ID'|| f_record.flight_id);
dbms_output.put_line('Night stayed'|| f_record.NIGHTS_STAYED);

end loop;

end;



--------------------------------------------------------------------------------------------------------------


-- GET MOST POPULAR FLIGHTS ACCORDING TO THE NUMBER OF FLYERS IN FLIGHTS 
--------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON SIZE 999999999
CREATE OR REPLACE PROCEDURE GET_MOS_FREQUENT_FLIGHTS
IS

CURSOR FLIGHT_DATA IS 

   SELECT SUBQ.FLIGHT_ID, NUMBER_OF_FLYERS, FLIGHT_NAME, DESTINATION, AIRPORT_NAME, MILES_BETWEEN  
FROM  
 (SELECT FLIGHT_ID, COUNT(*) AS NUMBER_OF_FLYERS
    FROM FLYER_FLIGHT 
    GROUP BY (FLIGHT_ID)
    ORDER BY COUNT(*)) SUBQ , FLIGHT F
    
    WHERE SUBQ.FLIGHT_ID = F.FLIGHT_ID  AND NUMBER_OF_FLYERS =  (SELECT MAX(NUMBER_OF_FLYERS) FROM 
                                                                                                                    (SELECT FLIGHT_ID, COUNT(*) AS NUMBER_OF_FLYERS
                                                                                                                    FROM FLYER_FLIGHT 
                                                                                                                    GROUP BY (FLIGHT_ID))) ;

BEGIN

    FOR I IN FLIGHT_DATA LOOP 
        
        
        DBMS_OUTPUT.PUT_LINE('Flight ID :' || I.FLIGHT_ID);
        DBMS_OUTPUT.PUT_LINE('Flight Name :' || I.FLIGHT_NAME);
        DBMS_OUTPUT.PUT_LINE('Airport Name :' || I.AIRPORT_NAME);
        DBMS_OUTPUT.PUT_LINE('Destination :' || I.DESTINATION);
        DBMS_OUTPUT.PUT_LINE('Miles Between :' || I.MILES_BETWEEN);
    
    END LOOP;

END; 
