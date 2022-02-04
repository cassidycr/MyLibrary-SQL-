-- DATABASE CREATION
-- Creating the Books Table
CREATE TABLE books(
	-- Columns for the Books table
	book_id int identity,
	ISBN varchar(500) NOT NULL,
	title varchar(50) not null,
	author_last_name varchar(30) not null,
	author_first_name varchar(30) not null,
	summary varchar(500) not null,
	publish_year int not null,
	audience varchar(30),
	category varchar(50),
	-- Contraints on the Books Table
	PRIMARY KEY (book_id),
)
-- End Creating the Books table

-- Creating the Members table
CREATE TABLE members(
	-- Columns for the Members table
	member_id int identity,
	member_first_name varchar(30) not null,
	member_last_name varchar(30) not null,
	email_address varchar(50) not null,
	
	-- Contraints on the Members Table
	PRIMARY KEY (member_id),
)
-- End Creating the Members table

-- Creating the Borrow table
CREATE TABLE borrow(
	-- Columns for the Borrow table
	member_id int NOT NULL,
	book_id int NOT NULL,
	borrow_date date,
	due_date date,
	
	-- Contraints on the Borrow Table
	PRIMARY KEY (member_id, book_id),
	FOREIGN KEY (book_id) REFERENCES books(book_id),
)
-- End Creating the Borrow table

-- Creating the History table
CREATE TABLE history(
	-- Columns for the History table
	member_id int NOT NULL,
	book_id int NOT NULL,
	borrow_date date NOT NULL,
	return_date date,
	
	-- Contraints on the History Table
	PRIMARY KEY (member_id, book_id, borrow_date),
	FOREIGN KEY (book_id) REFERENCES books(book_id),
	FOREIGN KEY (member_id) REFERENCES members(member_id),
)
-- End Creating the History table

-- Insert data
-- Iserting books
INSERT INTO dbo.books(ISBN,title,author_last_name,author_first_name,summary,publish_year,audience,category)
	VALUES ('9781478923732 1478923733 9781549140068 154914006X 9781549140075 1549140078','The Cruel Prince',
	 'Black', 'Holly', 'Jude was seven years old when her parents were 
	murdered and she and her two sisters were stolen away to live in the treacherous High Court of Faerie. 
	Ten years later, Jude wants nothing more than to belong there, despite her mortality. But many of the
	 fey despise humans. Especially Prince Cardan, the youngest and wickedest son of the High King. To 
	 win a place at the Court, she must defy him-- and face the consequences.', '2018', 'Young Adult', 'Fantasy')

INSERT INTO dbo.books (ISBN,title,author_last_name,author_first_name,summary, publish_year,audience, category) 
	VALUES ('9781526630780 1526630788 9781526605399 1526605392 9781526617163 1526617161 9781526617170 152661717X 
	9781526617187 1526617188','A Court Of Thorns And Roses', 'Maas', 'Sarah J', 'Feyre is a huntress. The skin
	 of a wolf would bring enough gold to feed her sisters for a month. But the life of a magical creature comes 
	 at a steep price, and Feyre has just killed the wrong wolf... Follow Feyres journey into the dangerous, 
	 alluring world of the Fae, where she will lose her heart, face her demons, and learn what she is truly capable of.',
	  '2016', 'New Adult', 'Fantasy')

INSERT INTO dbo.books (ISBN,title,author_last_name,author_first_name,summary, publish_year,audience, category) 
	VALUES ('9781416955078 1416955070','City of Bones', 'Clare', 'Cassandra', 'Suddenly able to see demons and the 
	Darkhunters who are dedicated to returning them to their own dimension, fifteen-year-old Clary Fray is drawn 
	into this bizarre world when her mother disappears and Clary herself is almost killed by a monster.','2007', 
	'Young Adult', 'Fantasy')

INSERT INTO dbo.books (ISBN,title,author_last_name,author_first_name,summary, publish_year,audience, category) 
	VALUES ('9781416914297 1416914293','City of Ashes', 'Clare', 'Cassandra', '	
Sixteen-year-old Clary continues trying to make sense of the swiftly changing events and relationships in her 
life as she becomes further involved with the Shadowhunters and their pursuit of demons and discovers some 
terrifying truths about her parents, her brother Jace, and her boyfriend Simon.','2008', 'Young Adult', 'Fantasy')

-- End inserting books

-- Inserting library patrons

INSERT INTO dbo.members (member_first_name, member_last_name, email_address)
	VALUES('Cassidy', 'Reid', 'colleencassidyr@gmail.com')
INSERT INTO dbo.members (member_first_name, member_last_name, email_address)
	VALUES('Aubrey', 'Graham', 'drake@gmail.com')
INSERT INTO dbo.members (member_first_name, member_last_name, email_address)
	VALUES('Taylor', 'Swift', 'tswift@gmail.com')
INSERT INTO dbo.members (member_first_name, member_last_name, email_address)
	VALUES('Megan', 'Fox', 'mfox@gmail.com')

-- End inserting library patrons

-- Inserting current borrows
INSERT INTO dbo.borrow (member_id, book_id, borrow_date, due_date)
	VALUES(1,1,'2/2/2022', '2/23/2022')
INSERT INTO dbo.borrow (member_id, book_id, borrow_date, due_date)
	VALUES(2,3,'2/2/2022', '2/23/2022')
INSERT INTO dbo.borrow(member_id, book_id, borrow_date, due_date)
	VALUES(2,2,'1/2/2022', '2/4/2022')
INSERT INTO dbo.borrow(member_id, book_id, borrow_date, due_date)
	VALUES(4,4,'2/4/2022', '3/4/2022')

SELECT * FROM borrow
JOIN members ON borrow.member_id = members.member_id
JOIN books ON borrow.book_id = books.book_id

--End Inserting current borrows

-- Inserting borrow history
INSERT INTO dbo.history(member_id, book_id, borrow_date, return_date)
	VALUES(1,1,'2/2/2022', '')
INSERT INTO dbo.history(member_id, book_id, borrow_date, return_date)
	VALUES(2,3,'2/2/2022', '')
INSERT INTO dbo.history(member_id, book_id, borrow_date, return_date)
	VALUES(1,3,'1/2/2022', '1/29/2022')
INSERT INTO dbo.history(member_id, book_id, borrow_date, return_date)
	VALUES(2,2,'1/2/2022', '')
INSERT INTO dbo.history(member_id, book_id, borrow_date, return_date)
	VALUES(4,4,'2/4/2022', '')

SELECT * FROM history
JOIN members ON history.member_id = members.member_id
JOIN books ON history.book_id = books.book_id
-- End Inserting borrow history

-- MANIPULATING DATA
-- Aubrey Graham (Drake) returns A Court Of Thorns and Roses

UPDATE history SET return_date = '2/4/2022' WHERE member_id = 2 AND book_id =2
DELETE borrow WHERE book_id = 2 AND member_id = 2

SELECT * FROM borrow
JOIN members ON borrow.member_id = members.member_id
JOIN books ON borrow.book_id = books.book_id

SELECT * FROM history
JOIN members ON history.member_id = members.member_id
JOIN books ON history.book_id = books.book_id

-- Megan Fox borrows A Court Of Thorns and Roses due on 3/4/2022

INSERT INTO borrow(member_id, book_id, borrow_date, due_date)
	VALUES(4,2, '2/4/2022', '3/4/2022')
INSERT INTO history(member_id, book_id, borrow_date, return_date)
	VALUES(4,2,'2/4/2022', '')

-- ANSWERING DATA QUESTIONS

-- View all books checked out by Megan Fox

SELECT books.book_id, title, due_date FROM books
JOIN borrow ON books.book_id= borrow.book_id
JOIN members on members.member_id = borrow.member_id
WHERE members.member_first_name = 'Megan' AND members.member_last_name = 'Fox'

-- View borrow history of A Court of Thorns and Roses

SELECT members.member_id, member_first_name, member_last_name, borrow_date, return_date
FROM members
JOIN history on members.member_id = history.member_id
JOIN books on books.book_id = history.book_id
WHERE books.title = 'A Court Of Thorns And Roses'

-- View all books in library by Cassandra Clare

SELECT books.book_id, title, summary, publish_year FROM books
WHERE author_first_name = 'Cassandra' AND author_last_name = 'Clare'

-- Veiw all Young Adult books

SELECT books.book_id, title, category, author_last_name FROM books
WHERE audience = 'Young Adult'



