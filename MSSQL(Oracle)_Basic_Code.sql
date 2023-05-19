--DROP A DATABASE
drop database MSSQL_DB;

--CREATE A DATABASE
create database MSSQL_DB;

--USE A DATABASE
use MSSQL_DB;

--DROP A TABLE
drop table DEPARTMENT;
drop table EMPLOYEE;
drop table VEHICLECATEGORY
drop table VEHICLE
drop table ITEMCATEGORY
drop table ITEM
drop table RENT
drop table ITEMORDER


-- CREATE ALL TABLE
-- DEPARTMENT TABLE
create table DEPARTMENT(
	DEPARTMENT_ID int identity(1,1) not null Primary Key,
	DEPARTMENT_NO as ('DM' + right('1234' + cast(DEPARTMENT_ID as varchar(10)),10)) persisted, --STRING AUTO INCREMENT
    DEPARTMENT_NAME varchar(20) not null,
);
--IDENTITY(1,1) USE FOR AUTO INCREMENT


-- CREATE ALL THE TABLE
-- EMPLOYEE TABLE
create table EMPLOYEE(
	EMPLOYEE_ID int identity(1,1) not null Primary Key,
	EMPLOYEE_NO as ('EM' + right('1234' + cast(EMPLOYEE_ID as varchar(10)),10)) persisted,
    DEPARTMENT_ID int not null Foreign Key References DEPARTMENT(DEPARTMENT_ID),
    EMPLOYEE_NAME varchar(100) not null,
    EMPLOYEE_CATEGORY varchar(40),
    EMPLOYEE_GENDER varchar(20) not null,
    EMPLOYEE_AGE int not null check(EMPLOYEE_AGE>=18),
    EMPLOYEE_EMAIL varchar(100) not null unique,
    EMPLOYEE_ADDRESS varchar(200),
    EMPLOYEE_PHONE varchar(50) unique,
    EMPLOYEE_SALARY decimal(20,5),
);


-- VEHICLE CATEGORY TABLE
create table VEHICLECATEGORY(
	VEHICLECATEGORY_ID int identity(1,1) not null Primary Key,
	VEHICLECATEGORY_NO as ('VC' + right('1234' + cast(VEHICLECATEGORY_ID as varchar(10)),10)) persisted,
    VEHICLECATEGORY_NAME varchar(10),
);


-- VEHICLE TABLE
create table VEHICLE(
	VEHICLE_ID int identity(1,1) not null Primary Key,
	VEHICLE_NO as ('VCL' + right('1234' + cast(VEHICLE_ID as varchar(10)),10)) persisted,
    VEHICLECATEGORY_ID int not null Foreign Key References VEHICLECATEGORY(VEHICLECATEGORY_ID),
    VEHICLE_NAME varchar(15) not null,
    VEHICLE_SEAT int,
    VEHICLE_RENTPRICE decimal(20,5),
);

-- ITEM CATEGORY TABLE
create table ITEMCATEGORY(
	ITEMCATEGORY_ID int identity(1,1) not null Primary Key,
	ITEMCATEGORY_NO as ('I' + right('1234' + cast(ITEMCATEGORY_ID as varchar(10)),10)) persisted,
    ITEMCATEGORY_NAME varchar(30),
);


-- ITEM TABLE
create table ITEM(
	ITEM_ID int identity(1,1) not null Primary Key,
	ITEM_NO as ('ITM' + right('1234' + cast(ITEM_ID as varchar(10)),10)) persisted,
    ITEMCATEGORY_ID int not null Foreign Key References ITEMCATEGORY(ITEMCATEGORY_ID),
    ITEM_NAME varchar(40) not null,
    ITEM_STATUS varchar(10),
    ITEM_PRICE decimal(20,5),
);


-- RENT TABLE
create table RENT(
	RENT_ID int identity(1,1) not null Primary Key,
	RENT_NO as ('R' + right('1234' + cast(RENT_ID as varchar(10)),10)) persisted,
    EMPLOYEE_ID int not null Foreign key References EMPLOYEE(EMPLOYEE_ID),
    VEHICLE_ID int not null Foreign Key References VEHICLE(VEHICLE_ID),
    RENT_DATE Date,
    RENT_TOTALDAYS int,
    RENT_TOTALPRICE decimal(20,5),
);


-- ORDER
create table ITEMORDER(
	ORDER_ID int identity(1,1) not null Primary Key,
	ORDER_NO as ('OR' + right('1234' + cast(ORDER_ID as varchar(10)),10)) persisted,
    EMPLOYEE_ID int not null Foreign key References EMPLOYEE(EMPLOYEE_ID),
    ITEM_ID int not null Foreign key References ITEM(ITEM_ID),
    ORDER_DATE Date,
    ORDER_TOTALPIECE int not null,
    ORDER_TOTALPRICE decimal(20,5),
);


-- INSERT DEPARTMENT TABLE
insert into DEPARTMENT(DEPARTMENT_NAME) 
			values('CSE'),
				  ('EEE'),
                  ('CE'),
                  ('ME'),
                  ('IPE'),
                  ('TEX'),
                  ('ARCH'),
                  ('BBA'),
                  ('MATH'),
                  ('Arts & Science');
select * from DEPARTMENT;


-- INSERT EMPLOYEE TABLE
insert into Employee(DEPARTMENT_ID,EMPLOYEE_NAME,EMPLOYEE_CATEGORY,EMPLOYEE_GENDER,EMPLOYEE_AGE,
			EMPLOYEE_EMAIL,EMPLOYEE_ADDRESS,EMPLOYEE_PHONE, EMPLOYEE_SALARY)
	values(1,'Mohaimen Hasan','Admin','Male',23,'mohaimen@gmail.com','Arichpur, Tongi Bazar, Gazipr',01521209559,38500),
          (2,'Abdullah Saleh','Teacher','Male',25,'saleh@gmail.com','Niketon Bazar, Mohakhali',01751064515,37500),
          (3,'Nabil Ahmed','Proctor','Male',24,'nabil@gmail.com','Sector 07, Uttara, Dhaka',018352415,36400),
          (4,'Tanvir Rahman Shovon','Proctor','Male',26,'shovon@gmail.com','Sundalpur, Noakhali',01521527618,35700),
          (5,'Adit Provat','Teacher','Male',21,'adit@gmail.com','College Gate, Tongi, Gazipur',01954271865,34900),
          (6,'Rashid Abid Bebhob','Admin','Male',23,'bebhob@gmail.com','ECB, Dhaka',0195627856,37100),
          (7,'Rayed Ahmed Abbasy','Teacher','Male',25,'abbasy@gmail.com','Sector 11, Uttara, Dhaka',01721209559,39400),
          (8,'Sultana','Teacher','Female',23,'sultana@gmail.com','Shazahanpur, Bogra',01867985623,35100),
          (1,'Mashfiq Rahman','Admin','Male',24,'mashfiq@gmail.com','Badda, Glshan, Dhaka',01856769813,37100),
          (2,'Robin Khan','Proctor','Male',24,'robin@gmail.com','Joynal Market, Uttara, Dhaka',01756209559,36500),
          (1,'Mohammad Shafiq','Admin','Male',25,'shafiq@gmail.com','Joynal Market, Uttara, Dhaka',01645209559,35500),
          (3,'Joty','Teacher','Female',24,'joty@gmail.com','Shazahanpur, Bogra',01785209959,32500),
          (6,'Raihan Hossain','Teacher','Male',25,'raihan@gmail.com','Arichpur, Tongi Bazar, Gazipur',01785713620,34900),
          (2,'Sadia','Teacher','Female',22,'sadia@gmail.com','Ishwardi, Pabna',01986209559,33100),
          (7,'Samira','Proctor','Female',21,'samira@gmail.com','Shahzadpur, Sirajganj',01589209559,36800),
          (1,'Shishir','Admin','Male',24,'shishir@gmail.com','Laxam, Comilla',01845209559,35600),
          (4,'Tasnim','Teacher','Female',22,'tasnim@gmail.com','Shahzadpur, Sirajganj',01745209559,32900),
          (5,'Abir','Admin','Male',26,'abir@gmail.com','Chokoria, Coxbazar',01545209129,35500),
          (7,'Shahdat','Teacher','Male',21,'shahdat@gmail.com','Mahendranagar, Lalmonirhat',01949209559,35500),
          (6,'Peom Datta','Teacher','Male',22,'peom@gmail.com','Rauzan, Chattogram',01785209559,35500),
          (1,'Shagor Hossain','Teacher','Male',24,'shagor@gmail.com','Thonthonia, Bogra',01690209559,35500),
          (7,'Rayhan','Proctor','Male',25,'rayhan@gmail.com','Naldanga, Nator',01655209559,35500),
          (2,'Badhon Kumar','Admin','Male',26,'badhon@gmail.com','Rajganj, Noakhali',01950209559,35500),
          (5,'Hadi','Teacher','Male',22,'hadi@gmail.com','Nowpara, Nator',01545209559,35500),
          (4,'Nahidul Islam','Proctor','Male',21,'nahidul@gmail.com','Sector 10, Uttara, Dhaka',01987209559,35500),
          (9,'Samia','Admin','Female',24,'samia@gmail.com','Bdda, Dhaka',01845200959,35500),
          (3,'Salma','Teacher','Female',23,'salma@gmail.com','Majhira, Shazahanpur, Bogra',01645569559,35500),
          (1,'Salman','Teacher','Male',22,'salman@gmail.com','Ragurampur, Comilla',01890209559,35500),
          (4,'Jannat','Teacher','Female',24,'jannat@gmail.com','Muradnagar, Comilla',01714209559,35500),
          (7,'Toufiq','Proctor','Male',25,'toufiq@gmail.com','Uposhoshor, Bogra',01533209559,35500),
          (6,'Reza','Teacher','Male',26,'reza@gmail.com','Shapahar, Naogaon',01690709559,35500),
          (4,'Alamin','Admin','Male',23,'alamin@gmail.com','Mainamoti, Comilla',01788209559,34500),
          (1,'Arafat Hossain','Teacher','Male',26,'arafat@gmail.com','Mohonpur, Rajshahi',01895209559,35500),
          (7,'Saifur Rahman Rafi','Teacher','Male',24,'rafi@gmail.com','Sector 9, Uttara, Dhaka',01835658894,36700),
          (9,'Sadia Sultana','Admin','Female',22,'sadiasultana@gmail.com','Mohammadpur, Dhaka',01945209559,33700),
          (1,'Bin Saif','Admin','Male',22,'saif@gmail.com','Josimuddin, Uttara, Dhaka',01832209559,34100),
          (5,'Maisha','Teacher','Female',21,'maisha@gmail.com','Laxam, Comilla',01781209559,31100),
          (2,'Noushin','Admin','Female',23,'noushin@gmail.com','Ishwardi, Pabna',01909312559,35800);
select * from EMPLOYEE;


-- INSERT VEHICLECATEGORY TABLE
insert into VEHICLECATEGORY(VEHICLECATEGORY_NAME) 
		values('Bus'),
			  ('Car'),
              ('Truck'),
              ('Bike'),
              ('Cycle');
select * from VEHICLECATEGORY;


-- INSERT VEHICLE TABLE
insert into VEHICLE(VEHICLECATEGORY_ID,VEHICLE_NAME,VEHICLE_SEAT,VEHICLE_RENTPRICE)
	values(1,'Ena',36,34000),
		  (2,'Corolla',4,8000),
          (3,'Truck A',2,40000),
          (4,'Yamaha R15',2,5000),
          (5,'Veloce A',1,2500),
          (1,'Akota',36,34000),
		  (2,'Corolla X',4,7800),
          (3,'Truck B',2,38400),
          (4,'Gixer X',2,4500),
          (5,'Phonix A',2,1000),
          (1,'Shyamoli',36,32000),
		  (2,'Axio A',4,6000),
          (3,'Truck C',2,39100),
          (4,'Yamaha R1',2,4000),
          (5,'Veloce C',1,2000),
          (1,'Shah Fateh Ali',40,38000),
		  (2,'Toyota A',8,9800),
          (3,'Truck D',2,35600),
          (4,'Pulser A',2,3400),
          (5,'Phonix B',2,1100),
          (1,'Shohug',36,33000),
		  (2,'Toyota B',6,8500),
          (3,'Tata A',2,29100),
          (4,'Discover A',2,2000),
          (5,'Veloce A',1,1800),
          (1,'Hanif',40,35300),
		  (2,'Corolla MS',4,7200),
          (3,'Truck E',2,31800),
          (4,'Gixer ES',2,4000),
          (5,'Phonix D',2,900),
          (1,'C Line',40,33700),
		  (2,'Axio SA',6,7000),
          (3,'Truck Fa',2,30000),
          (4,'Suzuki XS',2,3200),
          (5,'Veloce F',1,1500),
          (1,'MP Sidor',36,33600),
		  (2,'Toyota F',8,9200),
          (3,'Truck SX',2,29800),
          (4,'Pulser W',2,1900),
          (5,'Phonix QD',2,800);
select * from VEHICLE;


-- INSERT VEHICLECATEGORY TABLE
insert into ITEMCATEGORY(ITEMCATEGORY_NAME)
		values('Phone'),
			  ('Watch'),
              ('Laptop'),
              ('Desktop'),
              ('Headphone'),
              ('Football'),
              ('Tripod');
select * from ITEMCATEGORY;


-- INSERT ITEM TABLE
insert into ITEM(ITEMCATEGORY_ID,ITEM_NAME,ITEM_STATUS,ITEM_PRICE)
		values(1,'Oneplus 7T pro','Yes',67000),
			  (2,'Casio','Yes',1200),
              (3,'HP Probook 440G5','Yes',55400),
              (5,'Oneplus Bullet Wireless Z','Yes',3200),
              (6,'Fifa Official Ball-2022','Yes',12000),
              (1,'Pixel 7 pro','No',100000),
			  (2,'Casio SA','No',1800),
              (3,'HP Folio','Yes',230400),
              (5,'Apple AirBuds Pro','Yes',9000),
              (6,'Fifa Official Ball-2018','No',9000),
              (1,'Apple 14 Pro Max','Yes',123000),
			  (2,'Oneplus Watch','Yes',11000),
              (3,'HP Envy','No',78400),
              (5,'Oneplus Buds','Yes',6700),
              (6,'UCL Official Ball-2023','Yes',10000),
              (1,'Pixel 6 Pro','Yes',55000),
			  (2,'Apple Watch X','No',35800),
              (3,'Asus XD','Yes',49400),
              (5,'Oneplus Bullet Wireless Z2','Yes',3800),
              (6,'UCL Official Ball-2022','Yes',7800),
              (1,'Oneplus 10 Pro','Yes',100000),
			  (2,'Samsung Watch 3','No',13100),
              (3,'HP Spectra','Yes',240400),
              (5,'Samsung Buds Pro 3','Yes',8200),
              (6,'Fifa Official Ball-2014','No',7200),
              (1,'Apple 13 Pro Max','Yes',103000),
			  (2,'Amazfit watch 3','Yes',9200),
              (3,'Apple Mackbook Pro','Yes',180400),
              (5,'Oneplus Buds Z','Yes',8200),
              (6,'UCL Official Ball-2018','Yes',9400);
select * from ITEM;



-- INSERT RENT TABLE
insert into Rent(EMPLOYEE_ID,VEHICLE_ID,RENT_DATE,RENT_TOTALDAYS,RENT_TOTALPRICE)
		values(1,2,'2022-09-10',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=2)),
			  (2,7,'2022-09-17',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=7)),
			  (4,1,'2022-09-20',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=1)),
              (3,4,'2022-09-28',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=4)),
              (10,2,'2022-10-1',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=2)),
              (12,8,'2022-10-6',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=8)),
              (11,10,'2022-10-14',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=10)),
              (5,19,'2022-10-15',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=19)),
              (1,13,'2022-10-21',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=13)),
              (14,7,'2022-10-28',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=7)),
              (8,6,'2022-11-5',4,4*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=6)),
              (1,3,'2022-11-9',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=3)),
              (31,4,'2022-11-11',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=4)),
              (38,11,'2022-11-17',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=11)),
              (13,19,'2022-11-26',4,4*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=19)),
              (3,20,'2022-12-1',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=20)),
              (10,11,'2022-12-7',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=11)),
              (20,6,'2022-12-11',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=6)),
              (21,2,'2022-12-18',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=2)),
              (32,9,'2022-11-17',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=9)),
              (33,10,'2022-11-26',4,4*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=10)),
              (11,1,'2022-12-1',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=1)),
              (2,3,'2022-12-7',1,1*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=3)),
              (13,6,'2022-12-11',2,2*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=6)),
              (9,8,'2022-12-18',3,3*(select VEHICLE_RENTPRICE from VEHICLE where VEHICLE_ID=8));
select * from RENT;



-- INSERT ITEMORDER TABLE
insert into ITEMORDER(EMPLOYEE_ID,ITEM_ID,ORDER_DATE,ORDER_TOTALPIECE,ORDER_TOTALPRICE)
		values(8,2,'2022-10-10',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=2)),
			  (1,1,'2022-10-15',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=1)),
              (12,7,'2022-10-22',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=7)),
              (19,3,'2022-10-30',3,3*(select ITEM_PRICE from ITEM where ITEM_ID=3)),
              (28,10,'2022-11-2',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=10)),
              (38,19,'2022-11-8',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=19)),
              (9,5,'2022-11-14',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=5)),
              (11,1,'2022-11-19',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=1)),
              (1,6,'2022-11-26',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=6)),
              (10,8,'2022-12-1',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=8)),
              (19,20,'2022-12-8',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=20)),
              (15,30,'2022-12-15',3,3*(select ITEM_PRICE from ITEM where ITEM_ID=30)),
              (18,26,'2022-12-19',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=26)),
              (11,4,'2022-12-26',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=4)),
              (33,7,'2022-12-29',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=7)),
              (22,19,'2023-1-4',2,2*(select ITEM_PRICE from ITEM where ITEM_ID=19)),
              (29,25,'2023-1-19',1,1*(select ITEM_PRICE from ITEM where ITEM_ID=25)),
              (30,13,'2023-1-24',3,3*(select ITEM_PRICE from ITEM where ITEM_ID=13));
select * from ItemOrder;


--Show all table all data
select * from DEPARTMENT;
select * from EMPLOYEE;
select * from VEHICLECATEGORY;
select * from VEHICLE;
select * from ITEMCATEGORY;
select * from ITEM;
select * from RENT;
select * from ITEMORDER;


--DDL(Data Definition Language)= create,drop,alter,truncate,coment,rename(it works only for table)
--DQL(Data Query Language)= select(it works only for table data)
--DML(Data Manipulation Language)= insert,update,delete,lock,call,explain plan
--DCL(Data Control Language)= grant,revoke
--TCL(Transaction Control Language)= begin transactio,commit,rollback,savepoint

--ACID PROPERTIES
--A = Atomicity, C = Consistency, I = Isolation, D = Durability



--delete all the DATA from ItemOrder tabel
truncate table ItemOrder;
select * from ItemOrder;


--ALL TABLE DETAILS

--DEPARTMENT = DEPARTMENT_ID(PK), DEPARTMENT_NAME
--EMPLOYEE = EMPLOYEE_ID(PK),DEPARTMENT_ID(FK),EMPLOYEE_NAME,EMPLOYEE_CATEGORY,EMPLOYEE_GENDER,EMPLOYEE_AGE,EMPLOYEE_EMAIL,
--			 EMPLOYEE_ADDRESS,EMPLOYEE_PHONE,EMPLOYEE_SALARY
--VEHICLECATEGORY = VEHICLECATEGORY_ID(PK), VEHICLECATGEORY_NAME
--VEHICLE = VEHICLE_ID(PK), VEHICLECATEGORY_ID(FK), VEHICLE_NAME, VEHICLE_SEAT, VEHICLE_RENTPRICE
--ITEMCATEGORY = ITEMCATEGORY_ID(PK), ITEMCATEGORY_NAME
--ITEM = ITEM_ID(PK), ITEMCATEGORY_ID(FK), ITEM_NAME, ITEM_AVAILABLE, ITEM_PRICE
--RENT = RENT_ID(PK), EMPLOYEE_ID(FK), VEHICLE_ID(FK), RENT_DATE, RENT_TOTALDAYS, RENT_TOTALPRICE
--ITEMORDER = ORDER_ID(PK), EMPLOYEE_ID(FK), ITEM_ID(FK), ORDER_DATE, ORDER_TOTALPIECE, ORDER_TOTALPRICE



-- ADD A COLUNM IN A TABLE
alter table EMPLOYEE
add EMPLOYEE_DESIGNATION int;

--CHECK EMPLOYEE TABLE
SELECT * FROM EMPLOYEE



--TO DELETE A COLUMN IN A TABLE
alter table EMPLOYEE
drop column EMPLOYEE_DESIGNATION;

--CHECK EMPLOYEE TABLE
SELECT * FROM EMPLOYEE



--MODIFY A COLUMN / CHANGE THE DATA TYPE OF A COLUMN IN A TABLE
alter table EMPLOYEE
alter column EMPLOYEE_SALARY varchar(30);

alter table EMPLOYEE
alter column EMPLOYEE_SALARY decimal(20,5);




--SELECT Operation
select * from DEPARTMENT;
select * from EMPLOYEE
select EMPLOYEE_ID,EMPLOYEE_NAME from EMPLOYEE;
select VEHICLE_NAME,VEHICLE_SEAT from VEHICLE;
select ITEM_NAME,Item_Price from ITEM;
select distinct(EMPLOYEE_ADDRESS) from EMPLOYEE;
select distinct(EMPLOYEE_ID) from ITEMORDER;
select count(distinct(EMPLOYEE_ID)) from ITEMORDER;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE;
select concat(EMPLOYEE_NAME,'  -  ',EMPLOYEE_ADDRESS) from Employee;
select EMPLOYEE_NAME as Name,EMPLOYEE_AGE as Age,EMPLOYEE_SALARY as Salary from EMPLOYEE;
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE>20 order by EMPLOYEE_AGE;
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE<24 order by EMPLOYEE_NAME;
select EMPLOYEE_AGE,count(*) from Employee where EMPLOYEE_AGE>23 
	   group by EMPLOYEE_AGE having count(*)>5 order by EMPLOYEE_AGE




--SORTING DATA (ORDER BY)
--SELECT select_list FROM table_name ORDER BY column_name | expression [ASC | DESC ]
select * from ITEMORDER order by ORDER_DATE	---by default it is always (Ascending)
select * from ITEMORDER order by ORDER_TOTALPRICE desc
select EMPLOYEE_NAME,EMPLOYEE_AGE from Employee order by EMPLOYEE_AGE;
select EMPLOYEE_NAME,EMPLOYEE_AGE from Employee order by EMPLOYEE_AGE,EMPLOYEE_NAME;
select EMPLOYEE_NAME,EMPLOYEE_AGE,floor(EMPLOYEE_SALARY) from Employee 
order by EMPLOYEE_SALARY desc,EMPLOYEE_AGE asc;

select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_GENDER from Employee 
ORDER BY EMPLOYEE_AGE DESC,EMPLOYEE_NAME ASC

select EMPLOYEE_ADDRESS,EMPLOYEE_NAME from Employee group by EMPLOYEE_ADDRESS,EMPLOYEE_NAME;
select EMPLOYEE_AGE from Employee group by EMPLOYEE_AGE order by EMPLOYEE_AGE;
select EMPLOYEE_ID,EMPLOYEE_AGE from Employee group by EMPLOYEE_ID,EMPLOYEE_AGE
select EMPLOYEE_AGE,count(EMPLOYEE_AGE) as Total_Employee from Employee group by EMPLOYEE_AGE;
select EMPLOYEE_AGE from Employee group by EMPLOYEE_AGE having EMPLOYEE_AGE=24;
select EMPLOYEE_AGE,EMPLOYEE_NAME from Employee group by EMPLOYEE_AGE,EMPLOYEE_NAME having EMPLOYEE_AGE=24;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from Employee group by EMPLOYEE_ADDRESS,EMPLOYEE_NAME 
having EMPLOYEE_ADDRESS like '%Dhaka' order by EMPLOYEE_ADDRESS;

select * from EMPLOYEE order by EMPLOYEE_AGE;
select * from EMPLOYEE where EMPLOYEE_SALARY >34000 order by EMPLOYEE_NAME;
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_SALARY,EMPLOYEE_SALARY from EMPLOYEE 
where EMPLOYEE_ADDRESS like '%Dhaka' order by EMPLOYEE_NAME;

select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_GENDER,round(EMPLOYEE_SALARY,2) from EMPLOYEE 
where EMPLOYEE_AGE>23 order by EMPLOYEE_GENDER asc;

select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_GENDER,round(EMPLOYEE_SALARY,2) from EMPLOYEE 
where EMPLOYEE_AGE>23 order by EMPLOYEE_SALARY desc;

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,Order_Date,round(Order_TotalPrice,2) from EMPLOYEE 
join ItemOrder on EMPLOYEE.EMPLOYEE_ID=ITEMORDER.EMPLOYEE_ID order by ORDER_DATE;

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,Order_Date,round(Order_TotalPrice,2) from EMPLOYEE 
join ItemOrder on EMPLOYEE.EMPLOYEE_ID=ITEMORDER.EMPLOYEE_ID order by ORDER_DATE desc;

select EMPLOYEE_ADDRESS from Employee group by EMPLOYEE_ADDRESS;
select EMPLOYEE_AGE from Employee group by EMPLOYEE_AGE order by EMPLOYEE_AGE;
select EMPLOYEE_ID,EMPLOYEE_AGE from Employee group by EMPLOYEE_ID,EMPLOYEE_AGE;
select EMPLOYEE_AGE,count(EMPLOYEE_AGE) as Total_Employee from Employee group by EMPLOYEE_AGE;
select EMPLOYEE_AGE from Employee group by EMPLOYEE_AGE having EMPLOYEE_AGE=24;
select EMPLOYEE_ADDRESS from Employee group by EMPLOYEE_ADDRESS having EMPLOYEE_ADDRESS 
like '%Dhaka' order by EMPLOYEE_ADDRESS;

select EMPLOYEE_NAME,EMPLOYEE_NO from EMPLOYEE order by len(EMPLOYEE_NAME)
select EMPLOYEE_NAME,EMPLOYEE_NO from EMPLOYEE order by len(EMPLOYEE_NAME) DESC



--OFFSET and FETCH
SELECT EMPLOYEE_NAME, EMPLOYEE_AGE FROM EMPLOYEE ORDER BY EMPLOYEE_AGE,EMPLOYEE_NAME;
SELECT EMPLOYEE_NAME, EMPLOYEE_AGE FROM EMPLOYEE ORDER BY EMPLOYEE_AGE,EMPLOYEE_NAME OFFSET 10 ROWS
SELECT EMPLOYEE_NAME, EMPLOYEE_AGE FROM EMPLOYEE 
ORDER BY EMPLOYEE_AGE,EMPLOYEE_NAME OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY

SELECT EMPLOYEE_NAME, EMPLOYEE_AGE FROM EMPLOYEE 
ORDER BY EMPLOYEE_AGE,EMPLOYEE_NAME OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY




--LIMITING RIWS (TOP, OFFSET FETCH)
SELECT TOP 10 * FROM VEHICLE
SELECT TOP 5 * FROM VEHICLE WHERE VEHICLE_RENTPRICE>35000
SELECT TOP 5 * FROM VEHICLE WHERE VEHICLE_RENTPRICE>35000 ORDER BY VEHICLE_RENTPRICE
SELECT TOP 10 PERCENT * FROM EMPLOYEE
SELECT TOP 10 EMPLOYEE_NAME,EMPLOYEE_AGE FROM EMPLOYEE ORDER BY EMPLOYEE_AGE DESC
SELECT TOP 10 WITH TIES EMPLOYEE_NAME,EMPLOYEE_AGE FROM EMPLOYEE ORDER BY EMPLOYEE_AGE DESC




--DISTINCT (return only distinct value)
--SELECT DISTINCT column_name1, column_name2 FROM table_name;
select distinct EMPLOYEE_GENDER from EMPLOYEE;
select distinct (VEHICLE_NAME),Vehicle_Seat from VEHICLE;
select distinct(EMPLOYEE_GENDER),EMPLOYEE_NAME from EMPLOYEE;
select distinct(VEHICLE_NAME) from VEHICLE;
select distinct(EMPLOYEE_ID) from ITEMORDER;
select count(distinct(EMPLOYEE_ID)) from ITEMORDER;
select count(*) as Total from (select distinct EMPLOYEE_ID from ItemOrder) s;
select DISTINCT(EMPLOYEE_AGE) FROM EMPLOYEE order by EMPLOYEE_AGE;
select EMPLOYEE_AGE,count(*) from EMPLOYEE group by EMPLOYEE_AGE;
select distinct EMPLOYEE_AGE,EMPLOYEE_GENDER from EMPLOYEE order by EMPLOYEE_GENDER,EMPLOYEE_AGE




--WHERE
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_ID=1;
select EMPLOYEE_NAME, EMPLOYEE_AGE, EMPLOYEE_SALARY from EMPLOYEE where EMPLOYEE_GENDER='Male';
select EMPLOYEE_NAME, EMPLOYEE_AGE, EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_AGE between 20 and 23 order by EMPLOYEE_AGE;
select VEHICLE_NAME,VEHICLE_RENTPRICE from VEHICLE where VEHICLE_RENTPRICE>10000;
select VEHICLE_NAME,floor(VEHICLE_RENTPRICE) from VEHICLE where VEHICLE_RENTPRICE>10000;
select VEHICLE_NAME,round(VEHICLE_RENTPRICE,2) from VEHICLE where VEHICLE_RENTPRICE>10000;
select EMPLOYEE_NAME,ORDER_DATE,floor(ORDER_TOTALPIECE) from EMPLOYEE E 
join ITEMORDER I on E.EMPLOYEE_ID = I.EMPLOYEE_ID where e.EMPLOYEE_GENDER='Male';

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,EMPLOYEE_SALARY from Employee where EMPLOYEE_SALARY>=28000;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,EMPLOYEE_SALARY,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_SALARY>=28000 and EMPLOYEE_AGE<25;
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_GENDER from EMPLOYEE where EMPLOYEE_GENDER <> 'Male';
select VEHICLE_NAME from VEHICLE where VEHICLE_SEAT <> 38;
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_AGE IN(23,24);
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_ADDRESS IN ('Bdda, Dhaka','Uttara, Dhaka');
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_ADDRESS IN ('Male','Female');




--GROUP BY
select EMPLOYEE_AGE,count(*) from EMPLOYEE group by EMPLOYEE_AGE;
select EMPLOYEE_ID from RENT group by EMPLOYEE_ID
select distinct(EMPLOYEE_ID) from RENT group by EMPLOYEE_ID
select EMPLOYEE_AGE,EMPLOYEE_GENDER from EMPLOYEE group by EMPLOYEE_AGE,EMPLOYEE_GENDER
select EMPLOYEE_AGE,COUNT(*) from EMPLOYEE e 
join ITEMORDER i on e.EMPLOYEE_ID=i.EMPLOYEE_ID group by EMPLOYEE_Age

select e.EMPLOYEE_ID,COUNT(*) from EMPLOYEE e 
join ITEMORDER i on e.EMPLOYEE_ID=i.EMPLOYEE_ID group by e.EMPLOYEE_ID

select e.EMPLOYEE_ID,i.ORDER_NO from EMPLOYEE e 
join ITEMORDER i on e.EMPLOYEE_ID=i.EMPLOYEE_ID group by e.EMPLOYEE_ID,i.ORDER_NO

select year(ORDER_DATE) FROM ITEMORDER GROUP BY year(ORDER_DATE)
select year(ORDER_DATE),COUNT(*) FROM ITEMORDER GROUP BY year(ORDER_DATE)

select year(ORDER_DATE),COUNT(*) FROM EMPLOYEE E 
JOIN ITEMORDER I ON E.EMPLOYEE_ID=I.EMPLOYEE_ID WHERE EMPLOYEE_AGE IN (22,23,24) 
GROUP BY year(ORDER_DATE)




--HAVING
SELECT RENT_NO,year(RENT_DATE) from RENT 
group by RENT_NO,year(RENT_DATE) having year(RENT_DATE)=2022;

SELECT EMPLOYEE_GENDER,count(*) from EMPLOYEE 
group by EMPLOYEE_GENDER having count(EMPLOYEE_GENDER)>1;

SELECT EMPLOYEE_SALARY,count(*) from EMPLOYEE 
group by EMPLOYEE_SALARY having EMPLOYEE_SALARY>35000;

select VEHICLE_RENTPRICE,sum(VEHICLE_RENTPRICE) from VEHICLE 
group by VEHICLE_RENTPRICE having sum((VEHICLE_RENTPRICE))>7000

SELECT VEHICLE_ID,min(RENT_TOTALPRICE) as Minimum,max(RENT_TOTALPRICE) as Maximum
from RENT group by VEHICLE_ID having min(RENT_TOTALPRICE)>25000 and max(RENT_TOTALPRICE)<100000

SELECT VEHICLE_ID,min(RENT_TOTALPRICE) as Minimum,max(RENT_TOTALPRICE) as Maximum
from RENT group by VEHICLE_ID having min(RENT_TOTALPRICE)=40000 or max(RENT_TOTALPRICE)<50000

SELECT VEHICLE_ID,sum(RENT_TOTALPRICE) from RENT group by VEHICLE_ID order by VEHICLE_ID
SELECT VEHICLE_ID,avg(RENT_TOTALPRICE) from RENT 
group by VEHICLE_ID having avg(RENT_TOTALPRICE) between 50000 and 150000 order by VEHICLE_ID





--GROUPING
select * from RENT group by RENT_TOTALDAYS,RENT_DATE
select EMPLOYEE_GENDER from EMPLOYEE group by EMPLOYEE_GENDER
select * from EMPLOYEE group by EMPLOYEE_ID,EMPLOYEE_NO,
							DEPARTMENT_ID,EMPLOYEE_NAME,EMPLOYEE_CATEGORY,
							EMPLOYEE_GENDER,EMPLOYEE_AGE,EMPLOYEE_EMAIL,
							EMPLOYEE_ADDRESS,EMPLOYEE_PHONE, EMPLOYEE_SALARY

SELECT ORDER_DATE,SUM(ORDER_TOTALPRICE) FROM ITEMORDER GROUP BY ORDER_DATE ORDER BY ORDER_DATE;

SELECT ORDER_DATE,ORDER_NO,SUM(ORDER_TOTALPRICE)
FROM ITEMORDER
GROUP BY GROUPING SETS ((ORDER_DATE, ORDER_NO),(ORDER_DATE),(ORDER_NO),())
ORDER BY ORDER_DATE, ORDER_NO;

SELECT GROUPING(ORDER_DATE) Date, GROUPING(ORDER_NO) OrderNumber,
    ORDER_DATE,ORDER_NO,SUM(ORDER_TOTALPRICE)
FROM ITEMORDER
GROUP BY GROUPING SETS ((ORDER_DATE, ORDER_NO),(ORDER_DATE),(ORDER_NO),())
ORDER BY ORDER_DATE, ORDER_NO;




--CUBE
SELECT ORDER_DATE, floor(SUM(ORDER_TOTALPRICE))
FROM ITEMORDER GROUP BY ORDER_DATE;

SELECT ITEM_NAME, floor(SUM(ORDER_TOTALPRICE))
FROM ITEMORDER O
join ITEM I on O.ITEM_ID=I.ITEM_ID
GROUP BY ITEM_NAME




-- EQUAL TO(=), GREATER THAN(>), LESS THAN(<)
select * from EMPLOYEE where EMPLOYEE_NAME='Mohaimen';
select * from EMPLOYEE where EMPLOYEE_ID=4;
select * from EMPLOYEE where EMPLOYEE_ADDRESS='Address, Tongi, Gazipur';
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,EMPLOYEE_SALARY from Employee where EMPLOYEE_GENDER='Female';
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_AGE>23;
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where len(EMPLOYEE_NAME)>15;
select EMPLOYEE_NAME,round(EMPLOYEE_SALARY,1),EMPLOYEE_AGE,len(EMPLOYEE_ADDRESS) from EMPLOYEE where len(EMPLOYEE_ADDRESS)<15;




--AND, OR, NOT
select * from EMPLOYEE where EMPLOYEE_AGE=24 and EMPLOYEE_GENDER='Male';
select * from EMPLOYEE where EMPLOYEE_SALARY>31000 and EMPLOYEE_AGE>24 and EMPLOYEE_GENDER='Male';
select * from EMPLOYEE where EMPLOYEE_SALARY>36000 and EMPLOYEE_ADDRESS like '%uttara%' or EMPLOYEE_GENDER='Female';
select * from EMPLOYEE where EMPLOYEE_ADDRESS not like '%Uttara%';
select * from EMPLOYEE where EMPLOYEE_ADDRESS not like '%Uttara%' and EMPLOYEE_GENDER='';
select * from EMPLOYEE where not EMPLOYEE_GENDER='Male';
select * from EMPLOYEE where not EMPLOYEE_AGE IN (23,24);
select * from EMPLOYEE where not EMPLOYEE_AGE between 22 and 25;
select * from EMPLOYEE where EMPLOYEE_GENDER='Male' and (EMPLOYEE_AGE IN(23,25));
select * from EMPLOYEE where EMPLOYEE_GENDER='Male' and (EMPLOYEE_ADDRESS like '%Uttara%' and EMPLOYEE_AGE>24);
select * from EMPLOYEE where EMPLOYEE_GENDER='Male' and (EMPLOYEE_ADDRESS like '%Uttara%' or EMPLOYEE_AGE>24);
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE>23;
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE>23 and EMPLOYEE_SALARY>35000;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_AGE>25 or EMPLOYEE_CATEGORY='Admin';
select EMPLOYEE_ID,VEHICLE_ID,RENT_DATE from RENT where RENT_DATE>'2022-11-10';
select * from EMPLOYEE where EMPLOYEE_ADDRESS like '%Dhaka' and EMPLOYEE_AGE=24;
select * from EMPLOYEE where EMPLOYEE_AGE>24 and EMPLOYEE_ADDRESS like '%Uttara%';
select * from EMPLOYEE where EMPLOYEE_AGE in (23,25) and EMPLOYEE_ADDRESS like '%Dhaka';
select * from EMPLOYEE where EMPLOYEE_AGE between 23 and 25 and EMPLOYEE_ADDRESS <> 'Dhaka' and EMPLOYEE_ADDRESS !='Uttara';
select * from DEPARTMENT where DEPARTMENT_NAME='CSE' or DEPARTMENT_NAME='EEE' order by DEPARTMENT_NAME asc;
select * from EMPLOYEE where EMPLOYEE_NAME like 'M%' and EMPLOYEE_ADDRESS like '%Uttara%';
select * from EMPLOYEE where EMPLOYEE_NAME like 'M%' or EMPLOYEE_ADDRESS like '%Uttara%';
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_GENDER from EMPLOYEE where (EMPLOYEE_AGE>23 or EMPLOYEE_NAME like '%M') and EMPLOYEE_SALARY>34000;



--IN
select EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_SALARY from EMPLOYEE where EMPLOYEE_AGE in(23,24);
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_NAME in(select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE>24);
select EMPLOYEE_NAME,EMPLOYEE_SALARY,EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_ADDRESS in
(select EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_ADDRESS like '%Dhaka');

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_AGE in(23,24);
select * from EMPLOYEE where EMPLOYEE_AGE in (23,25);
select * from EMPLOYEE where EMPLOYEE_AGE not in (23,25);
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_SALARY from EMPLOYEE where EMPLOYEE_AGE between 23 and 26;




--NOT IN
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_AGE,floor(EMPLOYEE_SALARY) from EMPLOYEE where EMPLOYEE_AGE not in(23,24,25);
select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_ADDRESS from EMPLOYEE 
where EMPLOYEE_ADDRESS not in(select EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_ADDRESS like '%Dhaka');

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_AGE not in(23,24);




-- NOT EQUAL TO(<> , !=)
select * from EMPLOYEE where EMPLOYEE_AGE>24;
select * from EMPLOYEE where EMPLOYEE_AGE<25;
select * from EMPLOYEE where EMPLOYEE_AGE>=23;
select * from EMPLOYEE where EMPLOYEE_AGE<=22;
select EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE where EMPLOYEE_AGE <>23;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,round(EMPLOYEE_SALARY,2) from EMPLOYEE where EMPLOYEE_GENDER <>'Male';
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,round(EMPLOYEE_SALARY,2) from EMPLOYEE where EMPLOYEE_GENDER !='Female';
select * from EMPLOYEE where not EMPLOYEE_AGE=24;
select * from EMPLOYEE where not EMPLOYEE_AGE=24 and not EMPLOYEE_AGE=25;
select * from EMPLOYEE where not EMPLOYEE_AGE between 23 and 25;
select * from EMPLOYEE where not EMPLOYEE_AGE in (23,25);

select top 1 e.EMPLOYEE_SALARY from 
(select distinct top 4 EMPLOYEE_SALARY from EMPLOYEE order by EMPLOYEE_SALARY desc) e 
order by e.EMPLOYEE_SALARY;





--NULL
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_AGE is null;
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_AGE is not null;




--update
Update EMPLOYEE set EMPLOYEE_AGE=26 where EMPLOYEE_ID=7;
update EMPLOYEE set EMPLOYEE_ADDRESS='Uttara, Dhaka', EMPLOYEE_SALARY=35800 where EMPLOYEE_ID=11;
update EMPLOYEE set EMPLOYEE_ADDRESS='Uttara, Dhaka';



--DELETE
delete from ITEMORDER where ORDER_ID=18;
delete from EMPLOYEE where EMPLOYEE_AGE='Gender';
delete from ITEMORDER;




--TOP, RIGHT
select * from EMPLOYEE;
select top 3 * from EMPLOYEE;
select top 3 percent * from EMPLOYEE;
select top 4 EMPLOYEE_NAME,EMPLOYEE_AGE from EMPLOYEE;
select top 4 EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_GENDER='Male';
select top 4 EMPLOYEE_NAME,EMPLOYEE_SALARY from EMPLOYEE order by EMPLOYEE_SALARY desc;
select left(EMPLOYEE_NAME,4) as Short_Name from EMPLOYEE;
select right(EMPLOYEE_NAME,4) as Short_Name from EMPLOYEE;
select left(ORDER_DATE,4) as Year from ITEMORDER;
select distinct(left(Order_Date,4)) as Year from ItemOrder;




--MIN, MAX
select min(EMPLOYEE_SALARY) from EMPLOYEE;
select max(EMPLOYEE_SALARY) from EMPLOYEE;
select min(floor(EMPLOYEE_SALARY)) from EMPLOYEE;




--COUNT, AVG, SUM
select count(*) from EMPLOYEE;
select count(EMPLOYEE_ID) from EMPLOYEE;
select count(EMPLOYEE_ID) from EMPLOYEE where EMPLOYEE_ADDRESS like '%Uttara%';
select EMPLOYEE_AGE,count(EMPLOYEE_AGE) as Total from EMPLOYEE group by EMPLOYEE_AGE;
select EMPLOYEE_AGE,count(EMPLOYEE_AGE) as Total from EMPLOYEE group by EMPLOYEE_AGE order by Total;
select avg(EMPLOYEE_SALARY) from EMPLOYEE;
select sum(EMPLOYEE_SALARY)/count(EMPLOYEE_ID) from EMPLOYEE;
select count(EMPLOYEE_ID) from EMPLOYEE where EMPLOYEE_GENDER='Male';




--LIKE
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_NAME like '%n';
select * from EMPLOYEE where EMPLOYEE_NAME like 'M%';					-- started with M
select * from EMPLOYEE where EMPLOYEE_NAME like '%M%';					-- M in any position
select * from EMPLOYEE where EMPLOYEE_NAME like '_oh%';					-- second or third position 'oh'
select * from EMPLOYEE where EMPLOYEE_NAME like 's_%_%';				-- started s and atleast 3 character
select * from EMPLOYEE where EMPLOYEE_NAME like '%n';					-- end with n
select * from EMPLOYEE where EMPLOYEE_NAME like '_o%n';					-- o in second position and ends with n
select * from EMPLOYEE where EMPLOYEE_NAME like 'M%n';					-- start with M and ends with n
select * from EMPLOYEE where EMPLOYEE_ADDRESS like '%Dhaka';			
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_NAME like '[MA]%';	-- start with M or A
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_NAME like '[A-M]%';	-- start with A to M any character (A B C D E F G H I J K L M)
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_NAME like '[^A-M]%';	-- not start with A to M any character (N O P R S T U V W X Y Z)



--NOT LIKE
select EMPLOYEE_NAME,round(EMPLOYEE_SALARY,2) from EMPLOYEE where EMPLOYEE_SALARY not like'%30%';
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,round(EMPLOYEE_SALARY,2) from EMPLOYEE where EMPLOYEE_ADDRESS not like '%Dhaka';




--ALIAS
select EMPLOYEE_NAME as Name from EMPLOYEE;
select EMPLOYEE_SALARY as Salary ,count(EMPLOYEE_SALARY) as Total from EMPLOYEE 
group by EMPLOYEE_SALARY;

select EMPLOYEE_SALARY as Salary ,count(EMPLOYEE_SALARY) as Total from EMPLOYEE 
group by EMPLOYEE_SALARY;




--SIMPLE JOIN
select EMPLOYEE_NAME,EMPLOYEE_AGE,ORDER_DATE from EMPLOYEE e 
join ITEMORDER i on e.EMPLOYEE_ID=i.EMPLOYEE_ID;

select EMPLOYEE_NAME,EMPLOYEE_AGE,ORDER_DATE from EMPLOYEE e 
join ITEMORDER i on e.EMPLOYEE_ID=i.EMPLOYEE_ID order by ORDER_DATE;

select EMPLOYEE_NAME,EMPLOYEE_AGE,ITEM_NAME,ORDER_DATE from ITEMORDER a join EMPLOYEE b  
on a.EMPLOYEE_ID=b.EMPLOYEE_ID join ITEM c on a.ITEM_ID=c.ITEM_ID ;



--CROSS JOIN
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE cross join DEPARTMENT;
select * from DEPARTMENT cross join EMPLOYEE;
select * from EMPLOYEE cross join DEPARTMENT;
SELECT EMPLOYEE_NAME, ORDER_DATE FROM ITEMORDER
CROSS JOIN EMPLOYEE ORDER BY EMPLOYEE_AGE,ORDER_DATE;




--INNER JOIN
select EMPLOYEE_NAME,floor(Rent_TotalPrice) from EMPLOYEE a 
inner join Rent b on a.EMPLOYEE_ID=b.EMPLOYEE_ID;

select EMPLOYEE_NAME,DEPARTMENT_NAME from EMPLOYEE a 
inner join DEPARTMENT b on a.DEPARTMENT_ID=b.DEPARTMENT_ID order by DEPARTMENT_NAME;

select VEHICLECATEGORY_NAME,VEHICLE_NAME,VEHICLE_RENTPRICE from VEHICLE a 
inner join VEHICLECATEGORY b on a.VEHICLECATEGORY_ID=b.VEHICLECATEGORY_ID;

select a.EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_EMAIL,VEHICLE_NAME,VEHICLE_SEAT,RENT_DATE from EMPLOYEE a 
inner join RENT b on a.EMPLOYEE_ID=b.EMPLOYEE_ID 
Inner join VEHICLE c on b.VEHICLE_ID=c.VEHICLE_ID order by RENT_DATE;

select DEPARTMENT_NAME,EMPLOYEE_NAME,EMPLOYEE_SALARY from EMPLOYEE,DEPARTMENT 
where EMPLOYEE.DEPARTMENT_ID=Department.DEPARTMENT_ID;

select EMPLOYEE_NAME from EMPLOYEE,ITEMORDER where EMPLOYEE.EMPLOYEE_ID=ITEMORDER.EMPLOYEE_ID;

select EMPLOYEE_NAME,DEPARTMENT_NAME,EMPLOYEE_SALARY from EMPLOYEE e 
INNER JOIN DEPARTMENT d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_EMAIL FROM EMPLOYEE E  
INNER JOIN ITEMORDER O ON E.EMPLOYEE_ID=O.EMPLOYEE_ID
INNER JOIN ITEM I ON O.ITEM_ID=I.ITEM_ID;

select EMPLOYEE_NAME,EMPLOYEE_AGE,EMPLOYEE_EMAIL FROM EMPLOYEE E  
INNER JOIN ITEMORDER O ON E.EMPLOYEE_ID=O.EMPLOYEE_ID
INNER JOIN ITEM I ON O.ITEM_ID=I.ITEM_ID where EMPLOYEE_AGE>24;

select EMPLOYEE_NAME,RENT_DATE,EMPLOYEE_GENDER,VEHICLE_NAME from EMPLOYEE E 
INNER JOIN RENT R ON E.EMPLOYEE_ID=R.EMPLOYEE_ID
INNER JOIN VEHICLE V ON R.VEHICLE_ID=V.VEHICLE_ID AND  V.VEHICLE_NAME LIKE '%Ena%'





--LEFT JOIN
select a.EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_AGE,RENT_DATE from EMPLOYEE a 
left join RENT b on a.EMPLOYEE_ID=b.EMPLOYEE_ID;

select EMPLOYEE_NAME,RENT_DATE,RENT_TOTALDAYS,RENT_TOTALPRICE from EMPLOYEE e 
Left join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID;

select a.EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_EMAIL,VEHICLE_NAME,VEHICLE_SEAT,RENT_DATE from EMPLOYEE a 
left join RENT b on a.EMPLOYEE_ID=b.EMPLOYEE_ID 
left join VEHICLE c on b.VEHICLE_ID=c.VEHICLE_ID order by a.EMPLOYEE_ID;

select VEHICLE_NAME,floor(VEHICLE_RENTPRICE),RENT_DATE from VEHICLE a left join RENT b on a.VEHICLE_ID=b.VEHICLE_ID
where b.VEHICLE_ID is null;

select EMPLOYEE_NAME,RENT_DATE,EMPLOYEE_GENDER,VEHICLE_NAME from EMPLOYEE E 
LEFT JOIN RENT R ON E.EMPLOYEE_ID=R.EMPLOYEE_ID
LEFT JOIN VEHICLE V ON R.VEHICLE_ID=V.VEHICLE_ID;

select EMPLOYEE_NAME,RENT_DATE,EMPLOYEE_GENDER,VEHICLE_NAME from EMPLOYEE E 
LEFT JOIN RENT R ON E.EMPLOYEE_ID=R.EMPLOYEE_ID
LEFT JOIN VEHICLE V ON R.VEHICLE_ID=V.VEHICLE_ID AND  V.VEHICLE_NAME LIKE '%Ena%'

select EMPLOYEE_NAME,RENT_DATE,EMPLOYEE_GENDER,VEHICLE_NAME from EMPLOYEE E 
LEFT JOIN RENT R ON E.EMPLOYEE_ID=R.EMPLOYEE_ID
LEFT JOIN VEHICLE V ON R.VEHICLE_ID=V.VEHICLE_ID AND  V.VEHICLE_NAME LIKE '%Ena%' 
where V.VEHICLE_NAME !=NULL;

select EMPLOYEE_NAME,RENT_DATE,EMPLOYEE_GENDER,VEHICLE_NAME from EMPLOYEE E 
LEFT JOIN RENT R ON E.EMPLOYEE_ID=R.EMPLOYEE_ID
LEFT JOIN VEHICLE V ON R.VEHICLE_ID=V.VEHICLE_ID AND  V.VEHICLE_NAME LIKE '%Ena%' 
where E.EMPLOYEE_GENDER !='Male';





--RIGHT JOIN
select EMPLOYEE_NAME,RENT_DATE,RENT_TOTALDAYS,RENT_TOTALPRICE from EMPLOYEE e 
right join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID;

select EMPLOYEE_NAME,DEPARTMENT_NAME from EMPLOYEE e 
right join DEPARTMENT d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

select VEHICLE_NAME,floor(VEHICLE_RENTPRICE),RENT_DATE from VEHICLE a 
right join RENT b on a.VEHICLE_ID=b.VEHICLE_ID;

select VEHICLE_NAME,floor(VEHICLE_RENTPRICE),RENT_DATE from VEHICLE a 
right join RENT b on a.VEHICLE_ID=b.VEHICLE_ID
where a.VEHICLE_ID is null;

select VEHICLE_NAME,floor(VEHICLE_RENTPRICE),RENT_DATE from VEHICLE as a right join RENT as b on a.VEHICLE_ID=b.VEHICLE_ID;




-- SELF JOIN
SELECT e.EMPLOYEE_NAME as Employee_Name, e.EMPLOYEE_ADDRESS as Address FROM EMPLOYEE e, EMPLOYEE b
WHERE e.EMPLOYEE_ID <> b.EMPLOYEE_ID AND e.EMPLOYEE_ADDRESS = b.EMPLOYEE_ADDRESS
ORDER BY e.EMPLOYEE_ADDRESS;

SELECT e.EMPLOYEE_NAME as Employee_Name, e.EMPLOYEE_ADDRESS as Address FROM EMPLOYEE e 
join EMPLOYEE b on e.EMPLOYEE_ID <> b.EMPLOYEE_ID AND e.EMPLOYEE_ADDRESS = b.EMPLOYEE_ADDRESS
ORDER BY e.EMPLOYEE_ADDRESS;





--FULL JOIN / FULL OUTER JOIN
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,RENT_DATE from EMPLOYEE a 
full outer join RENT b on a.EMPLOYEE_ID=b.EMPLOYEE_ID;

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS,RENT_DATE from EMPLOYEE a 
full outer join RENT b on a.EMPLOYEE_ID=b.EMPLOYEE_ID
where a.EMPLOYEE_ID is null or b.EMPLOYEE_ID is null;

select EMPLOYEE_NAME,RENT_DATE,RENT_TOTALPRICE from EMPLOYEE e 
full outer join Rent r on e.EMPLOYEE_ID=r.EMPLOYEE_ID
full outer join vehicle v on r.VEHICLE_ID=v.VEHICLE_ID where RENT_DATE is not null;




--UNION (attribute name must be same)
select EMPLOYEE_ID from EMPLOYEE union select EMPLOYEE_ID from Rent; --union(distinct value)
select EMPLOYEE_ID from EMPLOYEE union all select EMPLOYEE_ID from Rent order by EMPLOYEE_ID; --union all(duplicate value)
select EMPLOYEE_ID from EMPLOYEE where EMPLOYEE_AGE>24 union all select EMPLOYEE_ID from Rent order by EMPLOYEE_ID;
select EMPLOYEE_ID from EMPLOYEE where EMPLOYEE_GENDER='Female' union all select EMPLOYEE_ID from RENT order by EMPLOYEE_ID;




--EXIXTS
select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where exists 
(select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_ADDRESS like '%Dhaka%');

select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where exists 
(select EMPLOYEE_ID from Rent where RENT.EMPLOYEE_ID=EMPLOYEE.EMPLOYEE_ID and RENT_TOTALPRICE>5000);



--ANY, ALL
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_ID=any(select EMPLOYEE_ID from Rent where RENT_TOTALDAYS>3);
select all EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_GENDER='Male';
select EMPLOYEE_NAME from EMPLOYEE where EMPLOYEE_ID=all(select EMPLOYEE_ID from Rent where RENT_TOTALDAYS>3);




--CASE
SELECT EMPLOYEE_NAME, floor(EMPLOYEE_SALARY),
CASE
    WHEN EMPLOYEE_ADDRESS like '%Dhaka%' then 'Dhaka Area'
    WHEN EMPLOYEE_ADDRESS like '%Bogra%' then 'Bogra Are'
    ELSE 'Area Not Found'
END AS Area
FROM EMPLOYEE;

SELECT EMPLOYEE_NAME, EMPLOYEE_AGE, EMPLOYEE_ADDRESS, floor(EMPLOYEE_SALARY)
FROM EMPLOYEE
ORDER BY
(CASE
    WHEN EMPLOYEE_AGE>25 THEN EMPLOYEE_AGE
    ELSE EMPLOYEE_SALARY
END);




--PROCEDURE
CREATE PROCEDURE EmployeeAge
AS SELECT EMPLOYEE_AGE FROM EMPLOYEE
GO;

exec EmployeeAge;

CREATE PROCEDURE EmpAddress @Adr varchar(30)
AS
SELECT * FROM Employee WHERE EMPLOYEE_ADDRESS = @Adr
;
exec EmpAddress @Adr='Arichpur, Tongi Bazar, Gazipr';

create procedure EmpSimple @a int,@b float
as select EMPLOYEE_NAME,EMPLOYEE_ADDRESS from EMPLOYEE where EMPLOYEE_AGE=@a and EMPLOYEE_SALARY>@b;
exec EmpSimple @a=24, @b=34000;




--VIEW
--drop view Salary;
create view Salary as select EMPLOYEE_NAME,EMPLOYEE_SALARY from EMPLOYEE;
select * from Salary;




-- BUILT-IN FUNCTION
select ascii(EMPLOYEE_NAME) from EMPLOYEE;
select char(EMPLOYEE_NAME) from EMPLOYEE;
select char(65) from EMPLOYEE;
select charindex('n', EMPLOYEE_NAME) from EMPLOYEE;
select concat(EMPLOYEE_NAME,' ',EMPLOYEE_AGE) from EMPLOYEE;
select datalength(EMPLOYEE_NAME) from EMPLOYEE;
select len(EMPLOYEE_NAME) from EMPLOYEE;
select DIFFERENCE(EMPLOYEE_NAME,EMPLOYEE_GENDER) from EMPLOYEE;
select DIFFERENCE('June','July') from EMPLOYEE;
select left(EMPLOYEE_NAME,5) from EMPLOYEE;
select right(EMPLOYEE_NAME,4) from EMPLOYEE;
select left(EMPLOYEE_NAME,0) from EMPLOYEE;
select lower(EMPLOYEE_NAME) from EMPLOYEE;
select upper(EMPLOYEE_NAME) from EMPLOYEE;
SELECT LTRIM('     Abdullah') AS LeftTrimmedString; --remove front space
SELECT RTRIM('Mohaimen     ') AS LeftTrimmedString; --remove end space
select ltrim(EMPLOYEE_NAME) from EMPLOYEE;
SELECT QUOTENAME('abcdef');
SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLICATE('SQL Tutorial ', 5);
select REVERSE(EMPLOYEE_NAME) from EMPLOYEE;
SELECT SUBSTRING(EMPLOYEE_NAME, 1, 3) from EMPLOYEE;
SELECT UNICODE('Atlanta');



-- BUILT-IN FUNCTION
select upper(EMPLOYEE_NAME) from EMPLOYEE;
select lower(EMPLOYEE_NAME) from EMPLOYEE;
select upper(EMPLOYEE_NAME),lower(EMPLOYEE_ADDRESS),round(EMPLOYEE_SALARY,2) from EMPLOYEE;
select EMPLOYEE_SALARY / EMPLOYEE_AGE from EMPLOYEE;
select round(EMPLOYEE_SALARY / EMPLOYEE_AGE,2) from EMPLOYEE;
select EMPLOYEE_SALARY - EMPLOYEE_AGE from EMPLOYEE;
select EMPLOYEE_SALARY + EMPLOYEE_AGE from EMPLOYEE;
select EMPLOYEE_SALARY * EMPLOYEE_AGE from EMPLOYEE;
select EMPLOYEE_SALARY % EMPLOYEE_AGE from EMPLOYEE;
select floor(EMPLOYEE_SALARY/EMPLOYEE_AGE) from EMPLOYEE;
SELECT RAND() AS random_result;




--NUMERIC FUNCTION
SELECT Abs(-243.5) AS AbsNum;
SELECT ACOS(0.25); --COS
SELECT ASIN(0.25); --SIN
SELECT ATAN(2.5); --TAN
SELECT CEILING(EMPLOYEE_SALARY) from EMPLOYEE;
SELECT COS(2);
SELECT COT(6);
SELECT DEGREES(1.5);
SELECT DEGREES(ACOS(0.25));
SELECT DEGREES(COS(0.25));
SELECT EXP(1);
SELECT LOG(2);
SELECT LOG10(2);
SELECT PI();
SELECT POWER(4, 2);
SELECT RADIANS(180);
SELECT ROUND(235.415, 2) AS RoundValue;
SELECT SQUARE(64);
SELECT YEAR(2023-10-12);




--EXTRA
select YEAR(ORDER_DATE) AS YEAR,DAY(ORDER_DATE) AS DAY,MONTH(ORDER_DATE) AS MONTH from ITEMORDER
select EMPLOYEE_NAME,RENT_DATE from EMPLOYEE e join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID
where YEAR(RENT_DATE)='2022' order by RENT_DATE

select EMPLOYEE_NAME,RENT_DATE,VEHICLE_NAME,VEHICLE_SEAT from EMPLOYEE e 
join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID
join VEHICLE v on r.VEHICLE_ID=v.VEHICLE_ID
where YEAR(RENT_DATE)='2022' order by RENT_DATE

select EMPLOYEE_NAME,RENT_DATE,VEHICLE_NAME,VEHICLE_SEAT from EMPLOYEE e 
join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID
join VEHICLE v on r.VEHICLE_ID=v.VEHICLE_ID
where YEAR(RENT_DATE) in ('2022','2023') order by RENT_DATE

select EMPLOYEE_NAME,RENT_DATE,VEHICLE_NAME,VEHICLE_SEAT from EMPLOYEE e 
join RENT r on e.EMPLOYEE_ID=r.EMPLOYEE_ID
join VEHICLE v on r.VEHICLE_ID=v.VEHICLE_ID
where EMPLOYEE_AGE in (22,23) order by RENT_DATE

select EMPLOYEE_NAME as Name,EMPLOYEE_AGE as Age,EMPLOYEE_GENDER as Gender,
	   ITEMCATEGORY_NAME as Category,
	   ITEM_NAME as ItemName,floor(ITEM_PRICE) as Price,
	   ORDER_DATE as Date,ORDER_TOTALPIECE as Piece,floor(ORDER_TOTALPRICE) as TotalPrice,
	   floor((ORDER_TOTALPRICE*5)/100) as VatAmount,
	   floor(((ORDER_TOTALPRICE*5)/100+ORDER_TOTALPRICE)) as TotalAmount
from EMPLOYEE E 
join ITEMORDER O on E.EMPLOYEE_ID=O.EMPLOYEE_ID
join ITEM I on O.ITEM_ID=I.ITEM_ID
join ITEMCATEGORY IC on I.ITEMCATEGORY_ID=IC.ITEMCATEGORY_ID












