IF OBJECT_ID('dbo.RENTAL', 'U') IS NOT NULL
	DROP TABLE dbo.RENTAL

IF OBJECT_ID('dbo.Branch_office','U') IS NOT NULL
	DROP TABLE dbo.Branch_office
	
IF OBJECT_ID('dbo.Cars','U') IS NOT NULL
	DROP TABLE dbo.Cars
	
IF OBJECT_ID('dbo.Price_list','U') IS NOT NULL
	DROP TABLE dbo.Price_list
	
IF OBJECT_ID('dbo.Clients','U') IS NOT NULL
	DROP TABLE dbo.Clients
	
CREATE TABLE dbo.Branch_office(
	ID INT CONSTRAINT PK_BO PRIMARY KEY,
	CITY VARCHAR(20), 
	ADRESS VARCHAR(20))

CREATE TABLE dbo.Cars (
	CAR_NUMBER VARCHAR(20) CONSTRAINT PK_CARNUM PRIMARY KEY,
	MODEL VARCHAR(20),
	CAR_BRAND VARCHAR(20),
	CAR_TYPE VARCHAR(20) CHECK (CAR_TYPE LIKE '[A-Z]%'), 
	YEARBOOK INT, 
	GEARBOX VARCHAR(20) CHECK (GEARBOX LIKE '[A-Z]%'))
	
CREATE TABLE dbo.Price_list(
	ID_PRICE INT CONSTRAINT PK_PRIC PRIMARY KEY,
	MODEL VARCHAR(20),
	PER_DAY MONEY,
	PER_HOUR MONEY,
	RECOGNIZANCE MONEY)
	
CREATE TABLE dbo.Clients(
	PERSONAL_ID VARCHAR(11) CONSTRAINT PK_PERID PRIMARY KEY CHECK (PERSONAL_ID LIKE '[0-9][0-9][0-9][0-9][0-9][0

-9][0-9][0-9][0-9][0-9][0-9]'),
	NAME VARCHAR(20) CHECK (NAME LIKE '[A-Z]%'),
	SURNAME VARCHAR(20) CHECK (SURNAME LIKE '[A-Z]%'),
	PHONE VARCHAR(9) CHECK (PHONE LIKE '[0-9]%'))

	
CREATE TABLE dbo.RENTAL(
	ID_RENTAL INT IDENTITY (1,1) CONSTRAINT PK_RENTAL PRIMARY KEY,
		ID_BRANCH INT CONSTRAINT FK_ID_BRAN REFERENCES dbo.Branch_office(ID),
		ID_FROM_PRICE INT CONSTRAINT FK_iD_PR REFERENCES dbo.Price_list(ID_PRICE),
		CAR_ID VARCHAR(20) CONSTRAINT FK_ID_CA REFERENCES dbo.Cars(CAR_NUMBER),
		RENTAL_DAYS INT,
		RENTAL_HOURS TIME(0),
		TIME_REFUND TIME(0), 
		DATE_RENTAL DATE,
		FAILURES VARCHAR(3) CHECK (FAILURES in ('yes', 'no')),
		CHILD_SEAT VARCHAR(3) CHECK (CHILD_SEAT in ('yes', 'no')),
		CLIENT_AGE INT CHECK (CLIENT_AGE LIKE '[0-9]%'),
		PERSONAL_ID VARCHAR(11) CONSTRAINT FK_PES_KLI REFERENCES dbo.Clients(PERSONAL_ID))
		

INSERT INTO dbo.Branch_office VALUES (10,'GORZOW WLKP.','Malownicza 17');
INSERT INTO dbo.Branch_office VALUES (20,'SZCZECIN','Kwiatowa 5');
INSERT INTO dbo.Branch_office VALUES (30,'WROCLAW','Bydgoska 33');
INSERT INTO dbo.Branch_office VALUES (40,'POZNAN','Marcinkowskiego 14');
INSERT INTO dbo.Branch_office VALUES (50,'GDANSK','Portowa 11');
INSERT INTO dbo.Branch_office VALUES (60,'BYDGOSZCZ','Sportowa 1');
INSERT INTO dbo.Branch_office VALUES (70,'LODZ','Agrestowa 3');
INSERT INTO dbo.Branch_office VALUES (80,'OPOLE','Latawcowa 9');
INSERT INTO dbo.Branch_office VALUES (90,'KATOWICE','Bankowa 44');
INSERT INTO dbo.Branch_office VALUES (100,'KRAKOW','Kolarska 7');
INSERT INTO dbo.Branch_office VALUES (110,'RZESZOW','Rejenta 22');
INSERT INTO dbo.Branch_office VALUES (120,'KIELCE','Bukowa 2');
INSERT INTO dbo.Branch_office VALUES (130,'LUBLIN','Topolowa 54');
INSERT INTO dbo.Branch_office VALUES (140,'WARSZAWA','Wiejska 9');
INSERT INTO dbo.Branch_office VALUES (150,'BIALYSTOK','Chopina 87');
INSERT INTO dbo.Branch_office VALUES (160,'OLSZTYN','Turystyczna 10');


INSERT INTO dbo.Cars VALUES ('XBENMU','Mulsanne', 'Bentley','luxury',1991,'automat');
INSERT INTO dbo.Cars VALUES ('XBENCONGT','Continental GT', 'Bentley','sport',2008,'automat');
INSERT INTO dbo.Cars VALUES ('XBENCONR','Continental R', 'Bentley','luxury',1999,'automat');
INSERT INTO dbo.Cars VALUES ('XBENAZ','Azure', 'Bentley','luxury',2001,'automat');
INSERT INTO dbo.Cars VALUES ('XBMWGC','Gran Coupe', 'BMW','sport',2014,'manual');
INSERT INTO dbo.Cars VALUES ('XBMWTF11','Touring F11', 'BMW','family',2010,'manual');
INSERT INTO dbo.Cars VALUES ('XBMWGT','Gran Turismo', 'BMW','sport',2013,'manual');
INSERT INTO dbo.Cars VALUES ('XBMW5','X5', 'BMW','family',2011,'automat');
INSERT INTO dbo.Cars VALUES ('XBMW3','X3', 'BMW','family',2007,'automat');
INSERT INTO dbo.Cars VALUES ('XTOYAU','Auris', 'Toyota','family',2012,'manual');
INSERT INTO dbo.Cars VALUES ('XTOYAV','Avensis', 'Toyota','family',2008,'manual');
INSERT INTO dbo.Cars VALUES ('XTOYAY','Aygo', 'Toyota','family',2006,'manual');
INSERT INTO dbo.Cars VALUES ('XTOYLC','Land Cruiser', 'Toyota','family',2009,'automat');
INSERT INTO dbo.Cars VALUES ('XFORFO','Focus', 'Ford', 'family',2009,'manual');
INSERT INTO dbo.Cars VALUES ('XFORFI','Fiesta', 'Ford','family',2008,'manual');
INSERT INTO dbo.Cars VALUES ('XFORMO','Mondeo', 'Ford','sport',2014,'manual');
INSERT INTO dbo.Cars VALUES ('XFORMU','Mustang', 'Ford','sport',2015,'manual');


INSERT INTO dbo.Price_list VALUES (1,'Mulsanne',200.00,70.00,2000.00);
INSERT INTO dbo.Price_list VALUES (2,'Continental GT', 300.00,90.00,2200.00);
INSERT INTO dbo.Price_list VALUES (3,'Continental R', 340.00,105.00,2500.00);
INSERT INTO dbo.Price_list VALUES (4,'Azure', 275.00,87.00,2100.00);
INSERT INTO dbo.Price_list VALUES (5,'Gran Coupe',220.00,70.00,1400.00);
INSERT INTO dbo.Price_list VALUES (6,'Touring F11',110.00,50.00,1000.00);
INSERT INTO dbo.Price_list VALUES (7,'Gran Turismo',180.00,55.00,1200.00);
INSERT INTO dbo.Price_list VALUES (8,'X5', 140.00,50.00,1100.00);
INSERT INTO dbo.Price_list VALUES (9,'X3', 130.00,47.00,1100.00);
INSERT INTO dbo.Price_list VALUES (10,'Auris', 190.00,70.00,600.00);
INSERT INTO dbo.Price_list VALUES (11,'Avensis', 80.00,30.00,400.00);
INSERT INTO dbo.Price_list VALUES (12,'Aygo', 90.00,35.00,370.00);
INSERT INTO dbo.Price_list VALUES (13,'Land Cruiser', 110.00,50.00,430.00);
INSERT INTO dbo.Price_list VALUES (14,'Focus', 94.00, 49.00,300.00);
INSERT INTO dbo.Price_list VALUES (15,'Fiesta',100.00,40.00,300.00);
INSERT INTO dbo.Price_list VALUES (16,'Mondeo', 160.00,49.00,450.00);
INSERT INTO dbo.Price_list VALUES (17,'Mustang', 200.00,80.00,1700.00);


INSERT INTO dbo.Clients VALUES('92020101444','Maciej','Wolski','633533433');
INSERT INTO dbo.Clients VALUES('56101254761','Ela','Magazynek','567567567');
INSERT INTO dbo.Clients VALUES('50122411111','Edmund','Mech','818818818');
INSERT INTO dbo.Clients VALUES('85051101224','Adam','Adamiak','774773772');
INSERT INTO dbo.Clients VALUES('82070711223','Ewa','Adamiak','543543543');
INSERT INTO dbo.Clients VALUES('64020155555','Wojtek','Wezyr','522522522');
INSERT INTO dbo.Clients VALUES('78090999449','Pawel','Kabaczek','511511511');
INSERT INTO dbo.Clients VALUES('77102121246','Kazimierz','Marchewka','500500500');
INSERT INTO dbo.Clients VALUES('92111112345','Jan','Jablko','501501501');
INSERT INTO dbo.Clients VALUES('77010121447','Jadwiga','Gruszka','502502502');
INSERT INTO dbo.Clients VALUES('62033008849','Antek','Banan','503503503');
INSERT INTO dbo.Clients VALUES('88052123545','Jozef','Ogorek','504504504');
INSERT INTO dbo.Clients VALUES('76080944555','Dominika','Ziemniak','505505505');
INSERT INTO dbo.Clients VALUES('75042291248','Kasia','Kartofelek','506506506');
INSERT INTO dbo.Clients VALUES('76202020143','Agnieszka','Szynka','507507507');
INSERT INTO dbo.Clients VALUES('76030202244','Agata','Kurczak','508508508');
INSERT INTO dbo.Clients VALUES('74030701781','Tomek','Bobik','509509509');
INSERT INTO dbo.Clients VALUES('70020222444','Maciej','Adamiak ','510510510');
INSERT INTO dbo.Clients VALUES('69070707447','Andrzej','Mandarynka','511511511');
INSERT INTO dbo.Clients VALUES('48121101664','Mieczyslaw','Kalafior','512512512');
INSERT INTO dbo.Clients VALUES('92020100000','Marek','Paszport','513513513');
INSERT INTO dbo.Clients VALUES('54080801884','Kamila','Karczek','514514514');
INSERT INTO dbo.Clients VALUES('53090906641','Dagmara','Adamiak ','515515515');
INSERT INTO dbo.Clients VALUES('50121107987','Przemek','Poziomka','516516516');
INSERT INTO dbo.Clients VALUES('90112155904','Dawid','Adamek','517517517');
INSERT INTO dbo.Clients VALUES('89020433333','Patrycja','Wezyr','518518518');
INSERT INTO dbo.Clients VALUES('56040103332','Monika','Mala','519519519');
INSERT INTO dbo.Clients VALUES('80201014443','Ada','Duza','520520520');
INSERT INTO dbo.Clients VALUES('78050505450','Wojtek','Szafka','521521521');
INSERT INTO dbo.Clients VALUES('72030317447','Karol','Wezyr','522522522');
INSERT INTO dbo.Clients VALUES('52070666646','Zenon','Kamyk','523523523');
INSERT INTO dbo.Clients VALUES('74040511223','Grazyna','Azuryt','524524524');
INSERT INTO dbo.Clients VALUES('55060633433','Halina','Fluoryt','525525525');
INSERT INTO dbo.Clients VALUES('66060312332','Adam','Antracyt','526526526');
INSERT INTO dbo.Clients VALUES('92121212121','Janina','Malachit','527527527');
INSERT INTO dbo.Clients VALUES('71081514134','Waldemar','Kwarc','528528528');
INSERT INTO dbo.Clients VALUES('70050322339','Arnold','Talk','529529529');
INSERT INTO dbo.Clients VALUES('75101442117','Bartosz','Gips','530530530');
INSERT INTO dbo.Clients VALUES('66112905549','Piotr','Kalcyt','531531531');
INSERT INTO dbo.Clients VALUES('47081513774','Magda','Apatyt','532532532');


INSERT INTO dbo.RENTAL VALUES(10,6, 'XBMWTF11', NULL, '8:00:00','12:00:00', '20151114','yes', 'yes', 23, '92020101444');
INSERT INTO dbo.RENTAL VALUES(160,4, 'XBENAZ', 2, NULL,NULL, '20150909','no', 'no', 59, '56101254761');
INSERT INTO dbo.RENTAL VALUES(60,11, 'XTOYAV',10, NULL,NULL, '20150703','no', 'no', 65, '50122411111');
INSERT INTO dbo.RENTAL VALUES(150,16, 'XFORMO',8, NULL, NULL, '20151127','no', 'no', 30, '85051101224');
INSERT INTO dbo.RENTAL VALUES(20,6, 'XBMWTF11', NULL, '14:00:00','20:00:00', '20151121','no', 'no', 33, '82070711223');
INSERT INTO dbo.RENTAL VALUES(50,12, 'XTOYAY',14,NULL,NULL, '20151010','no', 'no', 51, '64020155555');
INSERT INTO dbo.RENTAL VALUES(140,11, 'XTOYAV', 9, NULL,NULL, '20151124','yes','no', 37, '78090999449');
INSERT INTO dbo.RENTAL VALUES(40,3, 'XBENCONR', 27, NULL,NULL, '20151125','no', 'no', 38, '77102121246');
INSERT INTO dbo.RENTAL VALUES(30,15, 'XFORFI',NULL, '7:00:00','18:00:00', '20151113','no', 'no', 23, '92111112345');
INSERT INTO dbo.RENTAL VALUES(10,6, 'XBMWTF11',15, NULL,NULL, '20151201','yes', 'yes', 38, '77010121447');
INSERT INTO dbo.RENTAL VALUES(130,7, 'XBMWGT',1,NULL,NULL, '20151201','no', 'no', 53, '62033008849');
INSERT INTO dbo.RENTAL VALUES(20,13,  'XTOYLC',NULL, '15:00:00','16:00:00', '20151116','no', 'yes', 27, '88052123545');
INSERT INTO dbo.RENTAL VALUES(30,13, 'XTOYLC',35, NULL,NULL, '20151122','yes', 'yes', 39, '76080944555');
INSERT INTO dbo.RENTAL VALUES(40,9, 'XBMW3',5, NULL,NULL, '20151206','no', 'yes', 40, '75042291248');
INSERT INTO dbo.RENTAL VALUES(20,7, 'XBMWGT',7, NULL,NULL, '20151101','no', 'no', 39, '76202020143');
INSERT INTO dbo.RENTAL VALUES(120,2, 'XBENCONGT', 2,NULL,NULL, '20151129','no', 'no', 39, '76030202244');
INSERT INTO dbo.RENTAL VALUES(10,5, 'XBMWGC',7, NULL,NULL, '20151003','no', 'no', 41, '74030701781');
INSERT INTO dbo.RENTAL VALUES(50,12, 'XTOYAY',NULL, '17:00:00','23:00:00', '20151122','no', 'no', 45, '70020222444');
INSERT INTO dbo.RENTAL VALUES(70,17, 'XFORMU',NULL, '17:00:00','19:00:00', '20151119','no', 'no', 46, '69070707447');
INSERT INTO dbo.RENTAL VALUES(60,13, 'XTOYLC',17, NULL,NULL, '20151119','no', 'yes', 67, '48121101664');
INSERT INTO dbo.RENTAL VALUES(10,16, 'XFORMO',13, NULL,NULL, '20151111','yes', 'no', 23, '92020100000');
INSERT INTO dbo.RENTAL VALUES(70,16, 'XFORMO',NULL, '9:00:00','14:00:00', '20151129','no', 'no', 61, '54080801884');
INSERT INTO dbo.RENTAL VALUES(80,8, 'XBMW5',NULL, '11:00:00','21:00:00', '20151017','no', 'no', 62, '53090906641');
INSERT INTO dbo.RENTAL VALUES(110,17, 'XFORMU',14, NULL,NULL, '20151107','no', 'no', 65, '50121107987');
INSERT INTO dbo.RENTAL VALUES(80,10, 'XTOYAU',NULL, '8:00:00','13:00:00', '20151118','no', 'no', 25, '90112155904');
INSERT INTO dbo.RENTAL VALUES(90,14, 'XFORFO',2, NULL,NULL, '20151111','yes', 'yes', 26, '89020433333');
INSERT INTO dbo.RENTAL VALUES(90,14, 'XFORFO',27, NULL,NULL, '20151119','no', 'yes', 59, '56040103332');
INSERT INTO dbo.RENTAL VALUES(130,8, 'XBMW5',15, NULL,NULL, '20151120', 'no', 'yes', 35, '80201014443');
INSERT INTO dbo.RENTAL VALUES(100,6, 'XBMWTF11',NULL, '20:00:00','21:00:00', '20151001','no', 'yes', 37, '78050505450');
INSERT INTO dbo.RENTAL VALUES(80,6, 'XBMWTF11',12, NULL,NULL, '20151130','no', 'yes', 43, '72030317447');
INSERT INTO dbo.RENTAL VALUES(120,4, 'XBENAZ',21, NULL,NULL, '20151121','no', 'no', 63, '52070666646');
INSERT INTO dbo.RENTAL VALUES(10,1, 'XBENMU',1, NULL,NULL, '20151122','no', 'no', 41, '74040511223');
INSERT INTO dbo.RENTAL VALUES(110,9, 'XBMW3',NULL, '7:00:00','12:00:00', '20151017','no', 'no', 60, '55060633433');
INSERT INTO dbo.RENTAL VALUES(30,12, 'XTOYAY',11, NULL,NULL, '20151130','no', 'no', 49, '66060312332');
INSERT INTO dbo.RENTAL VALUES(100,3, 'XBENCONR', 3, NULL,NULL, '20151130','yes', 'no', 23, '92121212121');
INSERT INTO dbo.RENTAL VALUES(40,3, 'XBENCONR',NULL, '12:00:00','17:00:00', '20151114','no', 'no', 44, '71081514134');
INSERT INTO dbo.RENTAL VALUES(160,7, 'XBMWGT',15, NULL,NULL, '20151119','no', 'no', 45, '70050322339');
INSERT INTO dbo.RENTAL VALUES(50,11, 'XTOYAV', 11, NULL,NULL, '20150917','yes', 'no', 40, '75101442117');
INSERT INTO dbo.RENTAL VALUES(140,14, 'XFORFO',29, NULL,NULL, '20151116','no', 'no', 49, '66112905549');
INSERT INTO dbo.RENTAL VALUES(150,1, 'XBENMU', 5, NULL,NULL, '20151112','no', 'no', 68, '47081513774');


-- backup table RENTAL (is used to perform queries)
IF OBJECT_ID('RENTAL_OFFICE', 'U') IS NOT NULL
DROP TABLE RENTAL_OFFICE
GO
SELECT * INTO RENTAL_OFFICE FROM RENTAL

-- view shows which car's model was the most frequently chosen 
IF OBJECT_ID ('TOPMODEL','V') IS NOT NULL
DROP VIEW TOPMODEL
GO
CREATE VIEW TOPMODEL
AS 
SELECT s.Model , [popular ranking] = COUNT(CAR_ID) FROM RENTAL_OFFICE
INNER JOIN Cars AS s ON s.CAR_NUMBER = CAR_ID
GROUP BY CAR_ID, s.Model
GO

-- view shows the most popular brand
IF OBJECT_ID ('TOP_BRAND','V') IS NOT NULL
DROP VIEW TOP_BRAND
GO
CREATE VIEW TOP_BRAND
AS 
SELECT s.CAR_BRAND,  [popular ranking]=COUNT(CAR_ID)  FROM RENTAL_OFFICE 
INNER JOIN Cars AS s ON s.CAR_NUMBER = CAR_ID
GROUP BY s.CAR_BRAND
GO

-- view shows the number of failures in branches
IF OBJECT_ID ('CAR_ERROR','V') IS NOT NULL
DROP VIEW CAR_ERROR
GO
CREATE VIEW CAR_ERROR
AS 
SELECT [failures - office]= COUNT(FAILURES ), Od.CITY AS [office name] FROM RENTAL_OFFICE
INNER JOIN Branch_office AS Od ON  Od.Id = ID_BRANCH
WHERE FAILURES LIKE 'yes'
GROUP BY Od.CITY
GO

-- view shows the most failure car
IF OBJECT_ID ('MOST_FAILURES_CAR' , 'V') IS NOT NULL
DROP VIEW MOST_FAILURES_CAR
GO
CREATE VIEW MOST_FAILURES_CAR
AS
SELECT S.CAR_BRAND, S.Model, [failures quantity] = COUNT(FAILURES) FROM RENTAL_OFFICE
INNER JOIN Cars AS S ON S.CAR_NUMBER = CAR_ID
WHERE FAILURES LIKE 'yes'
GROUP BY S.CAR_BRAND, S.MODEL
GO

-- view shows profits of each branches
IF OBJECT_ID ('EARNINGS', 'V') IS NOT NULL
DROP VIEW EARNINGS
GO
CREATE VIEW EARNINGS
AS
select o.ID, o.CITY, profit = (SUM(ISNULL((RENTAL_DAYS * c.PER_DAY),0)) + SUM(ISNULL((DATEDIFF

(HOUR, RENTAL_HOURS, TIME_REFUND)* c.PER_HOUR),0)))  FROM RENTAL_OFFICE
INNER JOIN Price_list AS c ON c.ID_PRICE = ID_FROM_PRICE
INNER JOIN Branch_office AS o ON o.ID = ID_BRANCH
GROUP BY o.ID, o.CITY
GO

-- view shows the number of rental cars based on car's destiny  
IF OBJECT_ID ('CAR_DESTINATION', 'V') IS NOT NULL
DROP VIEW CAR_DESTINATION
GO
CREATE VIEW CAR_DESTINATION
AS
SELECT SUM(CASE WHEN CAR_TYPE = 'family' THEN 1 ELSE 0 END) AS [family cars],
       SUM(CASE WHEN CAR_TYPE = 'luxury' THEN 1 ELSE 0 END) AS [luxury cars],
       SUM(CASE WHEN CAR_TYPE = 'sport' THEN 1 ELSE 0 END) AS [sport cars]       
FROM RENTAL_OFFICE
INNER JOIN Cars AS s ON s.CAR_NUMBER = CAR_ID
GO

-- view that shows the target groups of customers because of age
IF OBJECT_ID ('AGE', 'V') IS NOT NULL
DROP VIEW AGE
GO
CREATE VIEW AGE
AS
SELECT SUM(CASE WHEN CLIENT_AGE between '18' and '30'  THEN 1 ELSE 0 END) AS [BELOW 30 YEARS],
       SUM(CASE WHEN CLIENT_AGE between '31' and '50'  THEN 1 ELSE 0 END) AS [ 31 - 50 YEARS],
       SUM(CASE WHEN CLIENT_AGE > '50' THEN 1 ELSE 0 END) AS [OVER 50 YEARS]       
FROM RENTAL_OFFICE
GO


PRINT ('The most popular car\s model')
SELECT TOP 1 * FROM TOPMODEL
ORDER BY [popular ranking] DESC

PRINT ('The most popular car\s branch')
SELECT TOP 1 * FROM TOP_BRAND
ORDER BY [popular ranking] DESC

PRINT ('The list of branches of companies due to car failure')
SELECT * FROM CAR_ERROR
ORDER BY [failures - office] DESC

PRINT ('Cars, which are the most common failure')
SELECT * FROM MOST_FAILURES_CAR
ORDER BY [failures quantity] DESC

PRINT ('The profits of each company branches')
SELECT * FROM EARNINGS
ORDER BY profit DESC

PRINT ('Summary defining major customers')
SELECT * FROM CAR_DESTINATION

PRINT ('Costumers selection becouse of age')
SELECT * FROM AGE