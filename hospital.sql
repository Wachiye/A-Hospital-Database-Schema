CREATE DATABASE hospital;

USE hospital;

CREATE TABLE doctors(
	doc_id int(8) PRIMARY KEY,
	doc_name VARCHAR(30) NOT NULL,
	designation VARCHAR(4)
);

CREATE TABLE nurses(
	nurse_id INT PRIMARY KEY,
	nurse_name VARCHAR(30) NOT NULL,
	section VARCHAR(30)
);

CREATE TABLE patients(
	p_id int(8) PRIMARY KEY,
	firstname VARCHAR(15) NOT NULL,
	lastname VARCHAR(15) NOT NULL,
	birth_date VARCHAR(20) NOT NULL,
	age int NOT NULL,
	gender VARCHAR(8) NOT NULL,
	weight decimal NOT NULL
);

CREATE TABLE tests(
	test_id int PRIMARY KEY AUTO_INCREMENT,
	p_id int REFERENCES patients(p_id),
	test_name VARCHAR(50) NOT NULL,
	test_result VARCHAR(100) NOT NULL,
	test_date VARCHAR(20) NOT NULL,
	doc_id int REFERENCES doctors(doc_id),
	comments VARCHAR(100) NOT NULL
);

CREATE TABLE bills(
	pay_id INT PRIMARY KEY AUTO_INCREMENT,
	p_id int REFERENCES patients(p_id),
	service VARCHAR(50) NOT NULL,
	amount DOUBLE(18,2) NOT NULL,
	bill_date VARCHAR(20)
);

CREATE TABLE appointments(
	app_id 	int PRIMARY KEY,
	appointment VARCHAR(100) NOT NULL,
	p_id int  REFERENCES patients(p_id),
	doc_id int  REFERENCES doctors(doc_id),
	app_date VARCHAR(20),
	app_status VARCHAR(100)
);

CREATE TABLE in_out(
	id 	int PRIMARY KEY AUTO_INCREMENT,
	p_id INT  REFERENCES patients(p_id),
	from_date VARCHAR(20),
	to_date VARCHAR(20)
);

CREATE TABLE inpatients(
	id 	int PRIMARY KEY AUTO_INCREMENT,
	p_id INT  REFERENCES patients(p_id),
	bed_no INT  NOT NULL,
	room_id INT  REFERENCES rooms(room_id),
	nurse_id INT  REFERENCES nurses(nurse_id),
	remarks VARCHAR(100)
);

CREATE TABLE rooms(
	room_id int PRIMARY KEY AUTO_INCREMENT,
	room_name VARCHAR(15) NOT NULL,
	number_of_beds INT,
	capacity int NOT NULL,
	status VARCHAR(100)
);

CREATE TABLE staffs(
       staff_id int PRIMARY KEY,
       staff_name varchar(30),
       staff_duty varchar(30)
);

CREATE TABLE consultations(
	cons_id int PRIMARY KEY AUTO_INCREMENT,
	cons_date VARCHAR(20),
	p_id int  REFERENCES patients(p_id),
	doc_id int  REFERENCES doctors(doc_id),
	remarks VARCHAR(30) 
);

CREATE TABLE addresses(
	add_id int PRIMARY KEY AUTO_INCREMENT,
	user_id int  NOT NULL,
	city VARCHAR(15),sss
	street VARCHAR(30)
);

CREATE TABLE contacts(
	cont_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id int  NOT NULL,
	phone VARCHAR(15) UNIQUE,
	email VARCHAR(100) UNIQUE
);
 
--DUMMY DATA FOR DOCTORS --
INSERT INTO doctors VALUES(1001,'Mbego Kendal','MK');
INSERT INTO doctors VALUES(1002,'Wachiye Siranjofu','WS');
INSERT INTO doctors VALUES(1003,'Denis Mulwa','DM');
INSERT INTO doctors VALUES(1004,'Laprima Muswahili','LM');
INSERT INTO doctors VALUES(1005,'Jeunice Mwakisha','JM');
INSERT INTO doctors VALUES(1006,'Naomi Kamau','NK');
INSERT INTO doctors VALUES(1007,'Christopher Oloo','CO');
INSERT INTO doctors VALUES(1008,'Mbugua Iam','MI');
INSERT INTO doctors VALUES(1009,'Florence Belinda','FB');
INSERT INTO doctors VALUES(1010,'Linux Kiogora','LK');

-- DUMMY DATA FOR NURSES
INSERT INTO nurses VALUES(3001, 'Joy Wazungu', 'Maternity');
INSERT INTO nurses VALUES(3002, 'Mark Luke', 'A&E');
INSERT INTO nurses VALUES(3003, 'Peter Andrew', 'Ward');
INSERT INTO nurses VALUES(3004, 'Mercy Wafula', 'Surgery');
INSERT INTO nurses VALUES(3005, 'Joyce Kadogo', 'Operation');
INSERT INTO nurses VALUES(3006, 'Alice Kamau', 'Consultation');
INSERT INTO nurses VALUES(3007, 'Steve James', 'Maternity');
INSERT INTO nurses VALUES(3008, 'Elvis Otis', 'Ward');
INSERT INTO nurses VALUES(3009, 'Mark Mkubwa', 'Surgery');
INSERT INTO nurses VALUES(3010, 'Jared Yego', 'Maternity');

-- DUMMY DATA FOR PATIENTS --
INSERT INTO patients VALUES(2001,'John','Kipruto','20/12/1998',21,'Male',69.75);
INSERT INTO patients VALUES(2002,'Erick','Baraza','10/10/1995',24,'Male',62.00);
INSERT INTO patients VALUES(2003,'Christopher','Otieno','05/06/1980',39,'Male',69.50);
INSERT INTO patients VALUES(2004,'Jenifer','Kirigo','02/02/1999',20,'Female',64.75);
INSERT INTO patients VALUES(2005,'Elvis','Wafula','10/03/1996',23,'Male',55.00);
INSERT INTO patients VALUES(2006,'Peter','Ndegwa','06/07/1964',55,'Male',70.00);
INSERT INTO patients VALUES(2007,'Fredrick','Nyangau','03/12/1970',49,'Male',49.25);
INSERT INTO patients VALUES(2008,'Betty','Msupa','12/04/1998',21,'Female',69.15);
INSERT INTO patients VALUES(2009,'Mary','Okey','30/08/1990',29,'Female',56.72);
INSERT INTO patients VALUES(2010,'Alice','Mkubwa','09/05/1998',21,'Female',50.35);

--DUMMY DATA FOR TESTS --
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2001, 'Cholesterol Test', 'HDL', '11/07/2019', 1003,'Good cholesterol level');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2007, 'Urinalysis', 'UTI', '07/07/2019', 1007,'Urinary Track Infection');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2003, 'Stool Test', 'Thyphoid present', '23/09/2019', 1004,'Contains muscus, blood, elastace');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2008, 'Arthroscopy', 'Joint Broken', '10/05/2019', 1010,'Blood cloting');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2009, 'Cultures', 'Thyphoid present', '01/02/2019', 1001,'Black and wet stool');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2001, 'Haemoglobin A1C', 'HDL', '19/08/2019', 1002,'Red blood cells are okay');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2002, 'Thyphoid', 'Thyphoid present', '07/04/2019', 1007,'Thyphoid present');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2004, 'Malaria Test', 'Malaria present', '03/03/2019', 1003,'Flue, broken WBC');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2001, 'Lipid Panel', 'HDL', '11/08/2019', 1003,'Lots of fat');
INSERT INTO tests(p_id, test_name, test_result, test_date, doc_id, comments)
	VALUES(2006, 'Abdominal Ultrasound', 'AC', '11/08/2019', 1002,'All clear');


--DUMMY DATA FOR BILLS --
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2001, 'Test',500, '11/07/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2006, 'Test',700, '11/08/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2001, 'Test',1000, '11/07/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2007, 'Test',200, '07/07/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2008, 'Test',500, '10/05/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2009, 'Test',500, '01/02/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2002, 'Test',500, '11/07/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2003, 'Test',600, '23/09/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2001, 'Test',1000, '11/08/2019');
INSERT INTO bills(p_id, service, amount, bill_date)
	VALUES(2004, 'Test',1000, '03/03/2019');

--DUMMY DATA FOR APPOINTMENTS --
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Mariage Counsilling', 2006, 1004, '05/05/2018','Rescheduled to 05/06/2018');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Mariage Counsilling', 2006, 1004, '05/06/2018','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'HIV/AIDS Counsilling', 2010, 1009, '05/07/2018','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Surgery Counsilling', 2009, 1004, '06/07/2018','Pending');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Mariage Counsilling', 2006, 1004, '07/07/2018','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Sex Therapy', 2008, 1009, '08/07/2018','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Stress Managemnet', 2004, 1004, '10/07/2018','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Relaxation Therapy', 2002, 1009, '02/01/2019','Done');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Diet Counsilling', 2001, 1004, '11/08/2019','Pending');
INSERT INTO appointments( appointment, p_id, doc_id, app_date, app_status)
	VALUES( 'Healthy Living Counsilling', 2009, 1004, '11/08/2019','Done');

--DUMMY DATA FOR IN_OUT --
INSERT INTO in_out( p_id, from_date, to_date)
	VALUES( 2001, '11/07/2019', '16/07/2019' );
INSERT INTO in_out( p_id, from_date, to_date)
	VALUES( 2003, '23/09/2019', '30/09/2019' );
INSERT INTO in_out( p_id, from_date, to_date)
	VALUES( 2009, '01/02/2019', '14/02/2019' );
INSERT INTO in_out( p_id, from_date, to_date)
	VALUES( 2002, '03/03/2019', '07/03/2019' );
INSERT INTO in_out( p_id, from_date, to_date)
	VALUES( 2008, '10/05/2019', '09/07/2019' );
-- INSERT INTO in_out( p_id, from_date, to_date)
-- 	VALUES( 2001, '11/07/2019', '16/07/2019' );
-- INSERT INTO in_out( p_id, from_date, to_date)
-- 	VALUES( 2001, '11/07/2019', '16/07/2019' );
-- INSERT INTO in_out( p_id, from_date, to_date)
-- 	VALUES( 2001, '11/07/2019', '16/07/2019' );
-- INSERT INTO in_out( p_id, from_date, to_date)
-- 	VALUES( 2001, '11/07/2019', '16/07/2019' );
-- INSERT INTO in_out( p_id, from_date, to_date)
-- 	VALUES( 2001, '11/07/2019', '16/07/2019' );

--DUMMY DATA FOR INPATENTS
INSERT INTO inpatients( p_id, bed_no, room_id, nurse_id, remarks)
	VALUES(2001,6,7,3001,'Recorvering');
INSERT INTO inpatients( p_id, bed_id, room_id, nurse_id, remarks)
	VALUES(2009,4,3,3006,'Discharge on 15/02/2019');
INSERT INTO inpatients( p_id, bed_id, room_id, nurse_id, remarks)
	VALUES(2008,9,23,3009,'Requires Pain Relievers');

-- DUMMY DATA FOR ROOMS
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Accidents & Emergency', 10, '7 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Casualty', 10, 'Ready');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Day Room', 50, '11 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Delivery Room', 7, 'Empty');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('ICU' 30, '3 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Maternity Ward', 30, '18 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Operating Theatre' ,5, '4 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Surgery', 5, 'Empty');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Sick Room', 30, '14 Empty Slots');
INSERT INTO rooms(room_name, capacity, status)
	VALUES('Ward' ,80, '54 Empty Slots');

-- DUMMY DATA FOR STAFF
INSERT INTO staffs VALUES(4001, 'Daniel Mukinu', 'Cleaner');
INSERT INTO staffs VALUES(4002, 'Ezekiel Mukinu', 'Secretary');
INSERT INTO staffs VALUES(4003, 'Fred Wanjala', 'Accountant');
INSERT INTO staffs VALUES(4004, 'Joy Ochieng', 'Cleaner');
INSERT INTO staffs VALUES(4005, 'Albert Kamau', 'Messenger');
INSERT INTO staffs VALUES(4006, 'Rabbeca Mukinu', 'Driver');
INSERT INTO staffs VALUES(4007, 'Eunice Macho', 'Store Keeper');
INSERT INTO staffs VALUES(4008, 'Willy Marks', 'Driver');
INSERT INTO staffs VALUES(4009, 'Jones Jim', 'Cleaner');
INSERT INTO staffs VALUES(4010, 'Stephen Waruguru', 'Phamarcist');

-- DUMMY DATA FOR CONSULTATIONS
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2001, '11/07/2019', 1003,'Breathing difficulties, Headaches, Sweeating');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2007,'07/07/2019', 1007,'pain when urinating, burns in the abdomen');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2003, 'Stool Test', '23/09/2019', 1004,'Severe stomachace, Headaches');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2008, 'Arthroscopy', '10/05/2019', 1010,'pain in the arm, flammation');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2009, '01/02/2019', 1001,'Hot nights, stomachace, Headaches');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2001, '19/08/2019', 1002,'Paleness, white eyes');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2002, '07/04/2019', 1007,'Severe stomachace, Headaches');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2004, '03/03/2019', 1003,'Colds, joint pains, Headaches');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2001, '11/08/2019', 1003,'Breathing difficulties, Sweeating');
INSERT INTO consultations(p_id, cons_date, doc_id, remarks)
	VALUES(2006, '11/08/2019', 1002,'Severe Back pains');

-- DUMMY DATA FOR ADDRESSES
INSERT INTO addresses( user_id, city, street)
	VALUES(1001, 'Kitale', '203007-232 Baraton');
INSERT INTO addresses( user_id, city, street)
	VALUES(1006, 'Nakuru', '205007-90 Njoro');
INSERT INTO addresses( user_id, city, street)
	VALUES(1009, 'Nairobi', '20509-04');
INSERT INTO addresses( user_id, city, street)
	VALUES(2004, 'Nakuru', '205007-90 Njoro');
INSERT INTO addresses( user_id, city, street)
	VALUES(2001, 'Nakuru', '205007-90 Njoro');
INSERT INTO addresses( user_id, city, street)
	VALUES(3001, 'Nakuru', '205007-90 Njoro');
INSERT INTO addresses( user_id, city, street)
	VALUES(4001, 'Kitale', '203007-234 Kiminini');
INSERT INTO addresses( user_id, city, street)
	VALUES(1002, 'Mombasa', '20508-456');
INSERT INTO addresses( user_id, city, street)
	VALUES(2007, 'Eldoret', '20503-365 Matunda');
INSERT INTO addresses( user_id, city, street)
	VALUES(1010, 'Nairobi', '20509-04 Gest');

-- DUMMY DATA FOR CONTACTS
INSERT INTO contacts( user_id, phone, email)
	VALUES(1001, '0790984562','example@gmail.com');
INSERT INTO contacts( user_id, phone, email)
	VALUES(3002, '0790984784','example2@gmail.com');
INSERT INTO contacts( user_id, phone, email)
	VALUES(2001, '0790984563','example9@gmail.com');
INSERT INTO contacts( user_id, phone, email)
	VALUES(4005, '0790984462','example7@gmail.com');
INSERT INTO contacts( user_id, phone, email)
	VALUES(1010, '0712678945','example2@gmail.com');
INSERT INTO contacts( user_id, phone, email)
	VALUES(3003, '0704048484','email@gmail.com');
