# Library Management System (DBMS Project)

This project is a Library Management System developed as part of a Database Management System (DBMS) course. It is designed to manage library operations such as book inventory, member registrations, borrowing and returning of books, fine calculations, and librarian activity. The backend is implemented using MySQL.

## Table of Contents

- Overview  
- Features  
- Technologies Used  
- Database Design  
- ER Diagram  
- Installation & Usage  
- Sample Queries  
- Project Structure  
- Report  

## Overview

The Library Management System aims to automate and simplify library processes including book tracking, member management, and issuing/returning activities. It uses relational database principles to ensure data integrity and efficient retrieval of information.

## Features

- Add, update, and delete book records  
- Manage member registrations and data  
- Issue and return books with due dates  
- Calculate fines for late returns  
- Maintain librarian records  
- Generate reports for issued books, defaulters, and available stock  

## Technologies Used

- Database: MySQL  
- Language: SQL  
- Tools: MySQL Workbench, phpMyAdmin  
- Platform: Windows or Linux  

## Database Design

The system includes the following tables:

1. books – Stores book details including ISBN, title, author, and copies  
2. members – Contains member registration and contact info  
3. issued_books – Tracks issued books and return status  
4. librarians – Stores librarian login and role data  
5. fines – Calculates and stores overdue penalties  
6. categories – Categorizes books by subject or genre

All tables are connected through appropriate primary and foreign keys to maintain consistency.

## ER Diagram

The ER Diagram illustrates the relationships among books, members, librarians, and other entities. Refer to the ER_Diagram image provided in the project files.

## Installation & Usage

1. Download or clone the repository to your system.

2. Open MySQL Workbench or phpMyAdmin.

3. Import the following SQL files in order:  
   - Tables_Creation.sql  
   - Insert_Queries.sql  
   - Select_Queries.sql

4. Run the queries to test library operations.

5. Sample_Output_Screenshots folder contains screenshots of query results.

## Sample Queries

- List all books currently issued to a member  
- Show overdue books and calculate fine  
- View available books in a specific category  
- Search books by author or title  
- View total books issued by a librarian  

## Project Structure

Library-Management-System/  
├── ER_Diagram.png  
├── Table_Relations.png  
├── Tables_Creation.sql  
├── Insert_Queries.sql  
├── Select_Queries.sql  
├── Sample_Output_Screenshots/  
├── library_management_report.pdf  
└── README.md

## Report

The project report includes:  
- Introduction  
- Tools and Techniques Used  
- System Setup  
- ER Diagram  
- Table Relationships  
- Database Schema  
- Query Outputs  
- Summary and Conclusion

Refer to library_management_report.pdf for the complete documentation.

