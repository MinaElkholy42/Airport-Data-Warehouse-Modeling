------------------------------------------------------------------
--  CARE INTERACTION DIMENSION TABLE
------------------------------------------------------------------
INSERT INTO CARE_INTERACTION
VALUES (1, 'Medical Interaction');

INSERT INTO CARE_INTERACTION
VALUES (2, 'complaint Interaction');

INSERT INTO CARE_INTERACTION
VALUES (3, 'Food Interaction');

INSERT INTO CARE_INTERACTION
VALUES (4, 'Quality Interaction');

----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
--  CHANNEL DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO CHANNEL
VALUES (1, 'Airport');

INSERT INTO CHANNEL
VALUES (2, 'Bank');

INSERT INTO CHANNEL
VALUES (3, 'Money Transfer Office');

INSERT INTO CHANNEL
VALUES (4, 'Mobile Service Office');

----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- DATES DIMENSION TABLE
------------------------------------------------------------------

DECLARE


BEGIN

    FOR I IN 1..31 LOOP
    
        INSERT INTO DATES  VALUES (I, I, 1, 2022);
        
    END LOOP;

END;

----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- FLIGHT DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO FLIGHT 
VALUES (1,'Shinghay_Trip', 'China', '01:00 AM', '12:00 PM' , 'Cairo Airport', 4273.8017, 200);

INSERT INTO FLIGHT 
VALUES (2,'Mosco_Trip', 'Russia', '03:00 PM', '8:00 PM' , 'Sharm_El_Shikh Airport', 4096.0891, 300);

INSERT INTO FLIGHT 
VALUES (3,'London_Trip', 'England', '02:00 AM', '07:00 PM' , 'Almaza Airport', 2413.4117, 400);

INSERT INTO FLIGHT 
VALUES (4,'Amapa_Trip', 'Brazil', '07:15 PM', '07:15 AM' , 'Cairo Airport', 6220.5625, 1000);


----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- FLYER DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO FLYER
VALUES(1, '29810010103097', 22, 1000, 1000);

INSERT INTO FLYER
VALUES(2, '29810010103091', 54, 600, 400);
 

INSERT INTO FLYER
VALUES(3, '29810010103098', 30, 1000, 400);


INSERT INTO FLYER
VALUES(4, '29810010101098', 40, 100, 50);


----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- PAYMENT_METHOD DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO PAYMENT_METHOD
VALUES (1, 'Fawry');

INSERT INTO PAYMENT_METHOD
VALUES (2, 'Visa');

INSERT INTO PAYMENT_METHOD
VALUES (3, 'Vodafon Cashe');

INSERT INTO PAYMENT_METHOD
VALUES (4, 'Hand to Hand');



----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- PORMOTION DIMENSION TABLE
------------------------------------------------------------------


INSERT INTO PORMOTION
VALUES (1, 'TICKET_DISCOUNT 30', 'Get Discount to 30 Percent on the Price Of The Next Ticket');

INSERT INTO PORMOTION
VALUES (2, 'TICKET_DISCOUNT 50', 'Get Discount to 50 Percent on the Price Of The Next Ticket');

INSERT INTO PORMOTION
VALUES (3, 'BAG_DISCOUNT 10', 'Get Discount to 10 Percent on the Additional Size of Your Bags in the next trip');

INSERT INTO PORMOTION
VALUES (4, 'Food_DISCOUNT 20', 'Get Discount to 20 Percent on the Price Of Food in your next trip');


----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- REWARDS DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO REWARDS
VALUES (1, 600, 'Get Next Ticket From your Region to any Country in Europe for 600 Miles Point');

INSERT INTO REWARDS
VALUES (2, 200, 'Get Free Food in your next trip for 200 Miles Point');

INSERT INTO REWARDS
VALUES (3, 400, 'Get Free 2 Nights in any hotel in your next trip for 400 Miles Point');

INSERT INTO REWARDS
VALUES (4, 150, 'Get Titanum Upgrade for only One Trip for 150 Miles Point');


----------------------------------------------------------------------------------------------------

------------------------------------------------------------------
-- UPGRADES DIMENSION TABLE
------------------------------------------------------------------

INSERT INTO UPGRADES 
VALUES (1, 'Gold', 3000, 1000, 'Get 20 Discount on all Tickets on trips outside your region, 
30 on Tickets on Trips in your Region, 2x miles_points you gain  from trips  
for 1000 EP or 3000 Miles Point');

INSERT INTO UPGRADES 
VALUES (2, 'Platinum', 5000, 2000, 'Get 30 Discount on all Tickets on trips outside your region, 
40 on Tickets on Trips in your Region, 3x miles_points you gain  from trips  
for 2000 EP or 5000 Miles Point');

INSERT INTO UPGRADES 
VALUES (3, 'Aluminum', 7000, 3000, 'Get 40 Discount on all Tickets on trips outside your region, 
50 on Tickets on Trips in your Region, 3.5x miles_points you gain  from trips  
for 3000 EP or 7000 Miles Point');

INSERT INTO UPGRADES 
VALUES (4, 'Titanium', 10000, 6000, 'Get 60 Discount on all Tickets on trips outside your region, 
70 on Tickets on Trips in your Region, 5x miles_points you gain  from trips  
for 6000 EP or 10000 Miles Point');



