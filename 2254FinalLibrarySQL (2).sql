CREATE DATABASE library;
USE library;

-- Entity Sets

-- DROP TABLE titles;
CREATE TABLE titles (
title_id char(6),
title char(30) NOT NULL UNIQUE,
section_id char(6),
PRIMARY KEY (title_id)
);
-- table contains information on titles in the library

-- DROP TABLE patrons;
CREATE TABLE patrons (
libcard_id char(6),
p_fname char(15),
p_lname char(15) NOT NULL,
p_phonenumber char(14),
PRIMARY KEY (libcard_id)
);
-- table contains information on the library's patrons

-- DROP TABLE librarians;
CREATE TABLE librarians (
employee_id char(6),
l_fname char(15),
l_lname char(15) NOT NULL,
l_phonenumber char(14),
PRIMARY KEY (employee_id)
);
-- table contains information on the library's employees

-- DROP TABLE sections;
CREATE TABLE sections (
section_id char(6),
genre char(20),
roomnumber int NOT NULL,
PRIMARY KEY (section_id)
);
-- table contains information on the different sections of the library

-- DROP TABLE authors;
CREATE TABLE authors (
author_id char(6),
a_fname char(15),
a_lname char(15)  NOT NULL,
a_phonenumber char(14),
a_country char(15),
PRIMARY KEY (author_id)
);
-- table contains information on the authors of titles

-- DROP TABLE publishers;
CREATE TABLE publishers (
publisher_id char(6),
p_name char(30) NOT NULL UNIQUE,
p_country char (15),
city char(20),
date_est date,
PRIMARY KEY (publisher_id)
);
-- table contains information on the publishers of titles


-- Relationship Sets

-- DROP TABLE borrows;
CREATE TABLE borrows (
title_id char(6),
libcard_id char(6),
borrowdate date NOT NULL,
returndate date NOT NULL,
PRIMARY KEY (title_id, libcard_id),
FOREIGN KEY (title_id) REFERENCES titles(title_id),
FOREIGN KEY (libcard_id) REFERENCES patrons(libcard_id)
);
-- table contains infomration on the relationship of partons borrowing titles

-- DROP TABLE worksin;
CREATE TABLE worksin (
employee_id char(6),
section_id char(6),
since date NOT NULL,
PRIMARY KEY (employee_id, section_id),
FOREIGN KEY (employee_id) REFERENCES librarians(employee_id),
FOREIGN KEY (section_id) REFERENCES sections(section_id)
);
-- table contains infomration on the relationship of librarians working in certain sections

-- DROP TABLE writtenby;
CREATE TABLE writtenby (
title_id char(6),
author_id char(6),
PRIMARY KEY (title_id, author_id),
FOREIGN KEY (title_id) REFERENCES titles(title_id),
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
-- table contains infomration on the relationship of authors writing titles

-- DROP TABLE publishedby;
CREATE TABLE publishedby (
title_id char(6),
publisher_id char(6),
PRIMARY KEY (title_id, publisher_id),
FOREIGN KEY (title_id) REFERENCES titles(title_id),
FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);
-- table contains infomration on the relationship of published titles


-- Inserting Data

INSERT INTO titles VALUES('T00101', 'Get the MONEY!', 'S10101');
INSERT INTO titles VALUES('T04801', 'Basics of Economics', 'S10101');
INSERT INTO titles VALUES('T01032', 'Linear Algebra', 'S10102');
INSERT INTO titles VALUES('T04444', 'Rome-in Around', 'S10104');
INSERT INTO titles VALUES('T05302', 'Ages and Empires', 'S10104');
INSERT INTO titles VALUES('T06600', 'Learn Korean in 2 Months', 'S10106');
INSERT INTO titles VALUES('T00707', 'Understanding English', 'S10106');
INSERT INTO titles VALUES('T08802', 'Rocks and Stuff', 'S10108');
INSERT INTO titles VALUES('T09992', 'Volcanic Activity and You', 'S10108');
INSERT INTO titles VALUES('T10104', 'Sherlock Houses', 'S20201');
INSERT INTO titles VALUES('T10226', '4-Minute Mysteries', 'S20201');
INSERT INTO titles VALUES('T10333', 'Inspector Spacetime', 'S20203');
INSERT INTO titles VALUES('T10409', 'Star Conflicts', 'S20203');
INSERT INTO titles VALUES('T10055', 'Im Not Big and I Must Chungus', 'S20203');
INSERT INTO titles VALUES('T10006', 'The Thingy', 'S20204');
INSERT INTO titles VALUES('T10711', 'A Shadow Over Innsmaw', 'S20204');
INSERT INTO titles VALUES('T10828', 'Very Scary Stories', 'S20204');
INSERT INTO titles VALUES('T10900', 'Dungeons & Dragging', 'S20206');
INSERT INTO titles VALUES('T20000', 'The Lord of the Lockets', 'S20206');
INSERT INTO titles VALUES('T20110', 'Big Hug, Little Kiss', 'S20269');
INSERT INTO titles VALUES('T20208', 'Sands of Passion', 'S20269');
INSERT INTO titles VALUES('T20033', 'Whispers of the Sea', 'S20269');
INSERT INTO titles VALUES('T20404', 'Epic Love', 'S20269');

INSERT INTO patrons VALUES('P00001', 'Jadyn', 'Jensen', '1-807-1112222');
INSERT INTO patrons VALUES('P00002', 'Bob', 'Jones', '1-807-4543874');
INSERT INTO patrons VALUES('P03201', 'Jimmy', 'Smith', '1-807-2335657');
INSERT INTO patrons VALUES('P00441', 'Nathan', 'Heerema', '1-807-2847284');
INSERT INTO patrons VALUES('P00501', 'Jinwoo', 'Cheon', '1-807-5567890');
INSERT INTO patrons VALUES('P00666', 'Lucas', 'Peterson', '1-807-2113412');
INSERT INTO patrons VALUES('P07022', 'Sharron', 'Daniels', '1-807-5657788');
INSERT INTO patrons VALUES('P01337', 'John', 'Gamer', '1-807-2621337');

INSERT INTO librarians VALUES('L00100', 'Fredrik', 'Hopp', '1-807-4445555');
INSERT INTO librarians VALUES('L00122', 'Martin', 'Lindelof', '1-807-2334444');
INSERT INTO librarians VALUES('L03300', 'Michael', 'Lindholm', '1-807-4565554');
INSERT INTO librarians VALUES('L00400', 'Nathaniel', 'Norberg', '1-807-3331234');
INSERT INTO librarians VALUES('L05040', 'Elias', 'Johannson', '1-807-5676665');
INSERT INTO librarians VALUES('L06670', 'Ove', 'Stenbock', '1-807-0787708');
INSERT INTO librarians VALUES('L07002', 'Melina', 'Strom', '1-807-8568877');
INSERT INTO librarians VALUES('L00803', 'Leonard', 'Brahe', '1-807-8899495');
INSERT INTO librarians VALUES('L00990', 'Olena', 'Bruun', '1-807-9099009');
INSERT INTO librarians VALUES('L10000', 'Bruford', 'Beefcake', '1-807-6998001');

INSERT INTO sections VALUES('S10101', 'Business', 101);
INSERT INTO sections VALUES('S10102', 'Mathematics', 102);
INSERT INTO sections VALUES('S10104', 'History', 104);
INSERT INTO sections VALUES('S10106', 'Language', 106);
INSERT INTO sections VALUES('S10108', 'Geology', 108);
INSERT INTO sections VALUES('S20201', 'Mystery', 201);
INSERT INTO sections VALUES('S20203', 'Science Fiction', 203);
INSERT INTO sections VALUES('S20204', 'Horror', 204);
INSERT INTO sections VALUES('S20206', 'Fantasy', 206);
INSERT INTO sections VALUES('S20269', 'Romance', 269);

INSERT INTO authors VALUES('A01000', 'Alfred', 'Smartsonn', '44-688-1213455', 'UK');
INSERT INTO authors VALUES('A01220', 'Alfred Jr.', 'Smartsonn-Jeffe', '44-688-6773433', 'UK');
INSERT INTO authors VALUES('A01333', 'Richard', 'Geologist', '1-281-8870787', 'USA');
INSERT INTO authors VALUES('A01041', 'Rory', 'Jeffers', '1-807-9993345', 'Canada');
INSERT INTO authors VALUES('A01512', 'William', 'Tostito', '1-506-3440909', 'Canada');
INSERT INTO authors VALUES('A01657', 'Chika', 'Winnegish', '1-506-5651112', 'Canada');
INSERT INTO authors VALUES('A09999', 'Harpy', 'Lovercat', '1-307-7273495', 'USA');
INSERT INTO authors VALUES('A01769', 'Giga', 'Chad', '33-1-6961008', 'France');
INSERT INTO authors VALUES('A01888', 'Iama', 'Failure', '1-807-6327494', 'Canada');

INSERT INTO publishers VALUES('B00001', 'Blackmore Education', 'UK', 'London', '1972-05-12');
INSERT INTO publishers VALUES('B02085', 'Puffin Publishing', 'USA', 'Seattle', '1995-02-06');
INSERT INTO publishers VALUES('B00374', 'Thundercork', 'Canada', 'Thunder Bay', '2004-11-23');
INSERT INTO publishers VALUES('B04480', 'Samsons Golden Press', 'USA', 'New York', '1961-04-24');
INSERT INTO publishers VALUES('B00555', 'Barnabus Books', 'UK', 'London', '1986-08-27');
INSERT INTO publishers VALUES('B00691', 'GigaChad Internationale', 'Paris', 'France', '2019-06-09');


INSERT INTO borrows VALUES('T20404', 'P00001', '2020-08-27', '2020-11-27');
INSERT INTO borrows VALUES('T10226', 'P00002', '2020-09-15', '2020-12-15');
INSERT INTO borrows VALUES('T06600', 'P00441', '2020-09-03', '2020-12-03');
INSERT INTO borrows VALUES('T00707', 'P00501', '2021-10-24', '2021-01-24');
INSERT INTO borrows VALUES('T10711', 'P00666', '2020-07-31', '2020-10-31');
INSERT INTO borrows VALUES('T04444', 'P07022', '2021-11-01', '2021-02-01');
INSERT INTO borrows VALUES('T20033', 'P01337', '2011-05-25', '2011-08-25');

INSERT INTO worksin VALUES('L00100', 'S10104', '2018-10-01');
INSERT INTO worksin VALUES('L00122', 'S20201', '2019-11-09');
INSERT INTO worksin VALUES('L03300', 'S10101', '2020-02-27');
INSERT INTO worksin VALUES('L00400', 'S10108', '2016-01-17');
INSERT INTO worksin VALUES('L05040', 'S20206', '2018-03-15');
INSERT INTO worksin VALUES('L06670', 'S10102', '2018-11-22');
INSERT INTO worksin VALUES('L07002', 'S20203', '2019-12-22');
INSERT INTO worksin VALUES('L00803', 'S10106', '2015-06-15');
INSERT INTO worksin VALUES('L00990', 'S20204', '2017-10-31');
INSERT INTO worksin VALUES('L10000', 'S20269', '2011-05-25');

INSERT INTO writtenby VALUES('T00101', 'A01220');
INSERT INTO writtenby VALUES('T04801', 'A01000');
INSERT INTO writtenby VALUES('T01032', 'A01000');
INSERT INTO writtenby VALUES('T04444', 'A01220');
INSERT INTO writtenby VALUES('T05302', 'A01000');
INSERT INTO writtenby VALUES('T06600', 'A01041');
INSERT INTO writtenby VALUES('T00707', 'A01000');
INSERT INTO writtenby VALUES('T08802', 'A01220');
INSERT INTO writtenby VALUES('T09992', 'A01333');
INSERT INTO writtenby VALUES('T10104', 'A01512');
INSERT INTO writtenby VALUES('T10226', 'A01041');
INSERT INTO writtenby VALUES('T10333', 'A01041');
INSERT INTO writtenby VALUES('T10409', 'A01512');
INSERT INTO writtenby VALUES('T10055', 'A01333');
INSERT INTO writtenby VALUES('T10006', 'A01657');
INSERT INTO writtenby VALUES('T10711', 'A09999');
INSERT INTO writtenby VALUES('T10828', 'A01512');
INSERT INTO writtenby VALUES('T10900', 'A01000');
INSERT INTO writtenby VALUES('T20000', 'A01657');
INSERT INTO writtenby VALUES('T20110', 'A01769');
INSERT INTO writtenby VALUES('T20208', 'A01769');
INSERT INTO writtenby VALUES('T20033', 'A01769');
INSERT INTO writtenby VALUES('T20404', 'A01769');

INSERT INTO publishedby VALUES('T00101', 'B00555');
INSERT INTO publishedby VALUES('T04801', 'B00001');
INSERT INTO publishedby VALUES('T01032', 'B00001');
INSERT INTO publishedby VALUES('T04444', 'B02085');
INSERT INTO publishedby VALUES('T05302', 'B00001');
INSERT INTO publishedby VALUES('T06600', 'B00555');
INSERT INTO publishedby VALUES('T00707', 'B00001');
INSERT INTO publishedby VALUES('T08802', 'B00374');
INSERT INTO publishedby VALUES('T09992', 'B00555');
INSERT INTO publishedby VALUES('T10104', 'B04480');
INSERT INTO publishedby VALUES('T10226', 'B00374');
INSERT INTO publishedby VALUES('T10333', 'B04480');
INSERT INTO publishedby VALUES('T10409', 'B02085');
INSERT INTO publishedby VALUES('T10055', 'B00555');
INSERT INTO publishedby VALUES('T10006', 'B00555');
INSERT INTO publishedby VALUES('T10711', 'B04480');
INSERT INTO publishedby VALUES('T10828', 'B02085');
INSERT INTO publishedby VALUES('T10900', 'B04480');
INSERT INTO publishedby VALUES('T20000', 'B00374');
INSERT INTO publishedby VALUES('T20110', 'B00691');
INSERT INTO publishedby VALUES('T20208', 'B00691');
INSERT INTO publishedby VALUES('T20033', 'B00691');
INSERT INTO publishedby VALUES('T20404', 'B00691');