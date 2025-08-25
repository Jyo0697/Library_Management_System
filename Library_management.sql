/* ---------------------------------------------------
Library Management System
Author: Jyotshna Janjanam
Description: This script creates a relational
database schema for managing a library.
It includes tables, relationships, sample data,
and example queries (CRUD, reports, analytics).
----------------------------------------------------*/

/* ================================
1. DROP & CREATE TABLES IF EXISTS
=================================*/
drop table if exists branch;
 CREATE TABLE Branch( 
 Branch_id varchar(10) primary key,
 Manager_id Varchar(10),
 Branch_address Varchar(50),
 Contact varchar(15)
 );
 
drop table if exists Employees;
 CREATE TABLE Employees(
	Empl_id varchar(25) primary key,
	Empl_name varchar(50),
	Positions varchar(25),
	Salary int,
	Branch_id varchar(10)
 );
 
drop table if exists Books;
 CREATE TABLE Books(
	ISBN varchar(20) primary key,
	Book_title varchar(50),
	Category varchar(15),
	Rental_price float,
	Status varchar(10),
	Author varchar(25),
	Publisher varchar(50)
);

alter table books
alter column category type varchar(25);

alter table books
alter column Book_title type varchar(75);

alter table books
alter column Publisher type varchar(75);

drop table if exists Members;
CREATE TABLE Members(
	Member_id varchar(10) primary key,
	Member_name varchar(25),
	Member_address varchar(75),
	Reg_date date
);

drop table if exists Issued_status;
CREATE TABLE Issued_status(
	Issued_id varchar(10) primary key,
	Issued_member_id varchar(10),
	Issued_book varchar(25),
	Issued_date date,
	Issued_book_isbn varchar(20),
	Issued_Emp_id varchar(10)
);

alter table Issued_status
alter column Issued_book type varchar(75);

drop table if exists Return_status;
CREATE TABLE Return_status(
	Return_id varchar(10) primary key,
	Issued_id varchar(10),
	Return_book varchar(25),
	Return_date date,
	Return_book_isbn varchar(20)
);

alter table return_status
alter column Return_book type varchar(75);

/* ================================
3. DEFINE RELATIONSHIPS
=================================*/
alter table Issued_status
Add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table Issued_status
Add constraint fk_books
foreign key (issued_book_isbn)
references books(ISBN);

alter table Issued_status
Add constraint fk_employees
foreign key (issued_emp_id)
references Employees(empl_id);

alter table Employees
Add constraint fk_branch
foreign key (branch_id)
references Branch(Branch_id);

alter table Return_status
Add constraint fk_issued
foreign key (issued_id)
references Issued_status(issued_id);


/* ================================
4. INSERT  DATA
=================================*/

-- Insert values into BRANCH table
INSERT INTO branch(branch_id, manager_id, branch_address, contact) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');


-- Inserting values into Employees table
INSERT INTO employees(empl_id, empl_name, positions, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');


-- Inserting values into Books table --
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');


-- Inserting values into Members table --
INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');

-- Inserting values into Issued_status table --
INSERT INTO issued_status(issued_id, issued_member_id, issued_book, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');


-- Inserting values into Return_status table --
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');


SELECT * FROM BRANCH;
SELECT * FROM EMPLOYEES;
SELECT * FROM MEMBERS;
SELECT * FROM BOOKS;
SELECT * FROM ISSUED_STATUS;
SELECT * FROM RETURN_STATUS;


/* ================================
5. CRUD OPERATIONS
=================================*/

 -- CREATE : Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')--
  INSERT INTO BOOKS(ISBN, BOOK_TITLE, CATEGORY, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
  VALUES ('978-1-60129-456-2', 
  			'To Kill a Mockingbird', 
			  'Classic', 
			  	6.00, 
				  'yes', 
				  	'Harper Lee', 
					  'J.B. Lippincott & Co.');

 -- READ : Read the issued_id of a particular book
 SELECT ISSUED_EMP_ID, ISSUED_DATE, iSSUED_BOOK_ISBN FROM ISSUED_STATUS
 WHERE ISSUED_BOOK= 'A Game of Thrones';
 

 -- UPDATE: Update member's name
 UPDATE MEMBERS
 SET MEMBER_NAME = 'Eveiry Brown'
 where member_id = 'C105';

 -- DELETE: Delete a record from Issued_status --
 DELETE FROM ISSUED_STATUS
 WHERE ISSUED_ID ='IS125';

	SELECT * FROM ISSUED_STATUS
	WHERE ISSUED_ID='IS125';

/* ================================
6. ANALYTICAL QUERIES
=================================*/

-- Creating table as SELECT(CTAS) : Use CTAS to generate a new table based on query results - Each book and their issues count --
CREATE TABLE BOOK_COUNTS AS 
SELECT B.ISBN, B.BOOK_TITLE, COUNT(IST.ISSUED_ID) AS ISSUED_COUNT FROM BOOKS AS B
JOIN ISSUED_STATUS AS IST
ON IST.ISSUED_BOOK_ISBN = B.ISBN
GROUP BY B.ISBN;

SELECT * FROM BOOK_COUNTS;

-- Find total rental income by category --
SELECT B.CATEGORY, SUM(RENTAL_PRICE) AS RENTAL_INCOME
FROM BOOKS AS B
JOIN ISSUED_STATUS AS IST
ON B.ISBN = IST.ISSUED_BOOK_ISBN
GROUP BY CATEGORY;

-- Members who registered in the last 2 YEARS --
SELECT * FROM MEMBERS WHERE REG_DATE >= CURRENT_DATE - INTERVAL '2 YEARS';

-- Employee details with thier branch managers
SELECT E1.EMPL_NAME, E1.EMPL_ID, E1.POSITIONS, E1.SALARY,
BR.BRANCH_ID, BR.MANAGER_ID, E2.EMPL_NAME AS MANAGER
FROM EMPLOYEES AS E1
JOIN BRANCH AS BR
ON E1.BRANCH_ID = BR.BRANCH_ID
JOIN EMPLOYEES AS E2
ON BR.MANAGER_ID= E2.EMPL_ID;

-- Create a table with high rental price --
CREATE TABLE Expensive_books as
SELECT * FROM BOOKS
WHERE RENTAL_PRICE>7.00;

select * from Expensive_books;

-- Find out the books which has not yet returned --
SELECT * FROM ISSUED_STATUS AS IST
LEFT JOIN RETURN_STATUS AS RST
ON IST.ISSUED_ID = RST.ISSUED_ID
WHERE RETURN_ID IS NULL;

/* Write a query to identify members who have overdue books (assume a 500-day return period). 
  Display the member's_id, member's name, book title, issue date, and days overdue.*/

  -- Issued_status JOIN Members JOIN Books JOIN Return_status --
  SELECT IST.ISSUED_MEMBER_ID, M.MEMBER_NAME, B.BOOK_TITLE, IST.ISSUED_DATE, 
  			CURRENT_DATE-IST.ISSUED_DATE AS Over_due_date
  FROM 
  ISSUED_STATUS AS IST
  JOIN
  MEMBERS AS M
  ON IST.ISSUED_MEMBER_ID = M.MEMBER_ID
  JOIN
  BOOKS AS B
  ON B.ISBN = IST.ISSUED_BOOK_ISBN
  LEFT JOIN 
  RETURN_STATUS AS RST
  ON RST.ISSUED_ID = IST.ISSUED_ID
  WHERE 
  	RST.RETURN_DATE IS NULL
	  AND
	(CURRENT_DATE - IST.ISSUED_DATE)> 500
ORDER BY IST.ISSUED_MEMBER_ID;

/* Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, 
showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.*/

SELECT * FROM BRANCH;
SELECT * FROM ISSUED_STATUS;
SELECT * FROM EMPLOYEES;
SELECT * FROM BOOKS;
SELECT * FROM RETURN_STATUS;

CREATE TABLE BRANCH_REPORTS AS(

	SELECT 	B.BRANCH_ID, 
		B.MANAGER_ID,
		SUM(BK.RENTAL_PRICE) AS REVENUE,
		COUNT(IST.ISSUED_ID) AS Num_books_issued,
		COUNT(RST.ISSUED_ID) AS Num_books_returned
	FROM ISSUED_STATUS AS IST
JOIN EMPLOYEES AS EMP
ON EMP.EMPL_ID = IST.ISSUED_EMP_ID
JOIN BRANCH AS B
ON EMP.BRANCH_ID = B.BRANCH_ID
LEFT JOIN RETURN_STATUS AS RST
ON RST.ISSUED_ID = IST.ISSUED_ID
JOIN BOOKS AS BK
ON IST.ISSUED_BOOK_ISBN = BK.ISBN

GROUP BY B.BRANCH_ID, B.MANAGER_ID
ORDER BY B.BRANCH_ID
);

SELECT * FROM BRANCH_REPORTS;

/*CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members 
containing members who have issued at least one book in the last 2 years.*/

CREATE TABLE ACTIVE_MEMBERS AS(
	SELECT * FROM MEMBERS 
	WHERE MEMBER_ID IN (
		SELECT DISTINCT ISSUED_MEMBER_ID FROM ISSUED_STATUS
		WHERE ISSUED_DATE >= CURRENT_DATE - INTERVAL '24 MONTHS'
		ORDER BY 1));

SELECT * FROM ACTIVE_MEMBERS;



/* ====================
       THANK YOU
=======================*/
