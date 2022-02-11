


 CREATE TABLE Flyer
(
  Flyer_ID NUMBER(10) NOT NULL,
  SSN VARCHAR2(20) NOT NULL,
  Age NUMBER(10) NOT NULL,
  Flyer_Miles_Point NUMBER(20, 4) NOT NULL,
  Flyer_Level_Points  NUMBER(20,4) NOT NULL,
  PRIMARY KEY (Flyer_ID)
);

CREATE TABLE Flight
(
  Flight_ID NUMBER(10) NOT NULL,
  Flight_Name VARCHAR2(50) NOT NULL,
  Destination VARCHAR2(50) NOT NULL,
  Deprature_Time VARCHAR2(50) NOT NULL,
  Arrival_Time VARCHAR2(50) NOT NULL,
  Airport_Name VARCHAR2(50) NOT NULL,
  Miles_Between NUMBER(20,4) NOT NULL,
  Ticket_Price NUMBER(10,4) NOT NULL,
  PRIMARY KEY (Flight_ID)
);

CREATE TABLE Dates
(
  Date_ID NUMBER(10) NOT NULL,
  Calendar_of_Day NUMBER(10) NOT NULL,
  Calendar_of_Month NUMBER(10) NOT NULL,
  Calendar_of_Year NUMBER(10) NOT NULL,
  PRIMARY KEY (Date_ID)
);

CREATE TABLE Pormotion
(
  Pormotion_ID NUMBER(10) NOT NULL,
  Name VARCHAR2(50) NOT NULL,
  Explination VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Pormotion_ID)
);

CREATE TABLE Upgrades
(
  Upgrade_ID NUMBER(10) NOT NULL,
  Kind VARCHAR2(10) NOT NULL,
  Amount_Needed_Points NUMBER(20,4) NOT NULL,
  Amount_Needed_Money NUMBER(20,4) NOT NULL,
  Explination VARCHAR2(250) NOT NULL,
  PRIMARY KEY (Upgrade_ID)
);

CREATE TABLE Flyer_Pormotion
(
  Respond_Status VARCHAR2(10) NOT NULL,
  Flyer_ID NUMBER(10) NOT NULL,
  Pormotion_ID NUMBER(10) NOT NULL,
  Date_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (Flyer_ID) REFERENCES Flyer(Flyer_ID),
  FOREIGN KEY (Pormotion_ID) REFERENCES Pormotion(Pormotion_ID),
  FOREIGN KEY (Date_ID) REFERENCES Dates(Date_ID), 
  PRIMARY KEY (FLYER_ID, PORMOTION_ID, DATE_ID)
);

CREATE TABLE Flyer_Upgrade
(
  Flyer_Level_Point NUMBER(20,4) NOT NULL,
  Flyer_ID NUMBER(10) NOT NULL,
  Upgrade_ID NUMBER(10) NOT NULL,
  Date_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (Flyer_ID) REFERENCES Flyer(Flyer_ID),
  FOREIGN KEY (Upgrade_ID) REFERENCES Upgrades(Upgrade_ID),
  FOREIGN KEY (Date_ID) REFERENCES Dates(Date_ID), 
  PRIMARY KEY (FLYER_ID, UPGRADE_ID, DATE_ID)
);

CREATE TABLE Channel
(
  Channel_ID NUMBER(10) NOT NULL,
  Name VARCHAR2(50) NOT NULL,
  PRIMARY KEY (Channel_ID)
);

CREATE TABLE Care_Interaction
(
  Care_ID NUMBER(10) NOT NULL,
  Name VARCHAR2(50) NOT NULL,
  PRIMARY KEY (Care_ID)
);

CREATE TABLE Flyer_Problems
(
  Care_Type VARCHAR2(50) NOT NULL,
  Problem_Served VARCHAR2(100) NOT NULL,
  Flyer_ID NUMBER(10) NOT NULL,
  Care_ID NUMBER(10) NOT NULL,
  Date_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (Flyer_ID) REFERENCES Flyer(Flyer_ID),
  FOREIGN KEY (Care_ID) REFERENCES Care_Interaction(Care_ID),
  FOREIGN KEY (Date_ID) REFERENCES Dates(Date_ID),
  PRIMARY KEY (FLYER_ID, CARE_ID, DATE_ID)
);

CREATE TABLE Rewards
(
  Reward_ID NUMBER(10) NOT NULL,
  Miles_Points_Cost NUMBER(20,4) NOT NULL,
  Explination VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Reward_ID)
);

CREATE TABLE Payment_Method
(
  Method_ID NUMBER(10) NOT NULL,
  Name VARCHAR2(20) NOT NULL,
  PRIMARY KEY (Method_ID)
);

CREATE TABLE Flyer_Flight
(
  Base_Fair NUMBER(20,4) NOT NULL,
  Nights_Stayed NUMBER(5) NOT NULL,
  Flyer_Miles_Rewarded NUMBER(20,4) NOT NULL,
  FlyerMiles_Rewarded_Explain VARCHAR2(100) NOT NULL,
  Payment NUMBER(20,4) NOT NULL,
  Type_of_Payment VARCHAR2(10) NOT NULL,
  Flyer_ID NUMBER(10) NOT NULL,
  Date_ID NUMBER(10) NOT NULL,
  Flight_ID NUMBER(10) NOT NULL,
  Upgrade_ID NUMBER(10) NOT NULL,
  Channel_ID NUMBER(10) NOT NULL,
  Method_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (Flyer_ID) REFERENCES Flyer(Flyer_ID),
  FOREIGN KEY (Date_ID) REFERENCES Dates(Date_ID),
  FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
  FOREIGN KEY (Upgrade_ID) REFERENCES Upgrades(Upgrade_ID),
  FOREIGN KEY (Channel_ID) REFERENCES Channel(Channel_ID),
  FOREIGN KEY (Method_ID) REFERENCES Payment_Method(Method_ID), 
  PRIMARY KEY (FLYER_ID, DATE_ID, FLIGHT_ID, UPGRADE_ID, CHANNEL_ID, METHOD_ID)
);

CREATE TABLE Flyer_Rewards
(
  Current_Flyer_Miles_Point NUMBER(20, 4) NOT NULL,
  Flyer_ID NUMBER(10) NOT NULL,
  Reward_ID NUMBER(10) NOT NULL,
  Date_ID NUMBER(10) NOT NULL,
  Channel_ID NUMBER(10) NOT NULL,
  Method_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (Flyer_ID) REFERENCES Flyer(Flyer_ID),
  FOREIGN KEY (Reward_ID) REFERENCES Rewards(Reward_ID),
  FOREIGN KEY (Date_ID) REFERENCES Dates(Date_ID),
  FOREIGN KEY (Channel_ID) REFERENCES Channel(Channel_ID),
  FOREIGN KEY (Method_ID) REFERENCES Payment_Method(Method_ID), 
  PRIMARY KEY  (Flyer_ID, Reward_ID, Date_ID, Channel_ID, Method_ID)
);