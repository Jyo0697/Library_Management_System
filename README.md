**📚 Library Management System – SQL Project**
A complete Library Management System built in PostgreSQL with schema design, sample data, CRUD operations, and analytical queries.

**🔹 Project Overview**
  Database Schema Design: Branches, Employees, Books, Members, Issued Books, and Returned Books. 
  Data Integrity: Primary keys, foreign keys, and constraints applied. 
  Sample Data: Rich dataset of books, employees, members, and transactions. 
  Operations Included: Create, Read, Update, Delete (CRUD) 
  Analytical queries (rental income, overdue books, branch performance, etc.) 
  CTAS (Create Table As Select) for reporting

**🔹 File Structure**
  Library_management.sql → Main SQL script (schema, data, queries)
  ERD_Library.JPG → Entity Relationship Diagram
  books.csv → Sample dataset of books
  branch.csv → Sample dataset of branches
  employees.csv → Sample dataset of employees
  members.csv → Sample dataset of library members
  issued_status.csv → Sample dataset of issued books
  return_status.csv → Sample dataset of returned books
  
**🔹 Database Schema (ERD)**
The ER diagram shows relationships between entities such as Books, Members, Employees, Branches, Issued books, and Return records. 
![ERD_Library](https://github.com/user-attachments/assets/b1fe111b-9a8f-4ca4-a9e6-48ae66f4a692)


**🔹 How to Run**
  1. Clone the repository: 
              https://github.com/Jyo0697/Library_Management_System
  2. Open pgAdmin 4 or connect to your PostgreSQL database.
  3. Run the Library_management.sql script to:
  4. Create tables
  5. Insert sample data
  6. Run CRUD operations
  7. Generate reports and analytical queries

**🔹 Example Analytical Queries** 
  Total rental income by category 
  Overdue books (with assumed 500-day return period) 
  Branch performance report (books issued, books returned, revenue) 
  Active members in the last 2 years 
  Expensive books (rental > 7.0)

**🔹 Tech Stack** 
  PostgreSQL 
  pgAdmin 4 (for ERD and execution)

**🔹 Use Case** 
This project is a great resource for: 
    SQL learners practicing end-to-end projects 
    Data Analysts building portfolio projects 
    Business Analysts understanding how queries drive insights

**✨ Author: Jyotshna Janjanam**
