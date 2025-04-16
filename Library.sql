create database abc;
use abc;


CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Publisher VARCHAR(100),
  YearPublished INT,
  ISBN VARCHAR(20),
  Genre VARCHAR(50),
  CopiesAvailable INT
);

INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, '9780061', 'Fiction', 5),
(2, '1984', 'George Orwell', 'Secker & Warburg', 1949, '9780451', 'Dystopian', 4),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, '97807', 'Classic', 6),
(4, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 1960, '978006', 'Drama', 3),
(5, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen', 1937, '97805', 'Fantasy', 7),
(6, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, '978014', 'Romance', 5),
(7, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown', 1951, '978031', 'Classic', 2),
(8, 'Moby Dick', 'Herman Melville', 'Harper & Brothers', 1851, '97815', 'Adventure', 4);

CREATE TABLE Members (
  MemberID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(150),
  MembershipDate DATE
);

INSERT INTO Members VALUES
(1, 'Alice Sharma', 'alice@example.com', '9876543210', 'Delhi', '2023-01-15'),
(2, 'Bob Verma', 'bob@example.com', '9876543211', 'Chandigarh', '2023-02-10'),
(3, 'Cathy Gill', 'cathy@example.com', '9876543212', 'Mumbai', '2023-03-05'),
(4, 'David Roy', 'david@example.com', '9876543213', 'Kolkata', '2023-04-20'),
(5, 'Eva Singh', 'eva@example.com', '9876543214', 'Pune', '2023-05-12'),
(6, 'Frank Thomas', 'frank@example.com', '9876543215', 'Hyderabad', '2023-06-01'),
(7, 'Grace Kaur', 'grace@example.com', '9876543216', 'Amritsar', '2023-07-22'),
(8, 'Harry Dutt', 'harry@example.com', '9876543217', 'Bangalore', '2023-08-18');

CREATE TABLE Borrowing (
  BorrowID INT PRIMARY KEY,
  MemberID INT,
  BookID INT,
  BorrowDate DATE,
  DueDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Borrowing VALUES
(1, 1, 2, '2024-03-01', '2024-03-10', '2024-03-08'),
(2, 2, 3, '2024-03-02', '2024-03-12', NULL),
(3, 3, 5, '2024-03-05', '2024-03-15', '2024-03-14'),
(4, 4, 1, '2024-03-10', '2024-03-20', NULL),
(5, 5, 7, '2024-03-11', '2024-03-21', '2024-03-19'),
(6, 6, 6, '2024-03-13', '2024-03-23', '2024-03-21'),
(7, 7, 4, '2024-03-15', '2024-03-25', NULL),
(8, 8, 8, '2024-03-18', '2024-03-28', '2024-03-27');

CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  Name VARCHAR(100),
  Position VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20)
);

INSERT INTO Staff VALUES
(1, 'Rita Mehra', 'Librarian', 'rita@example.com', '9123456780'),
(2, 'Sahil Bansal', 'Assistant', 'sahil@example.com', '9123456781'),
(3, 'Pooja Yadav', 'Admin', 'pooja@example.com', '9123456782'),
(4, 'Amit Rana', 'Clerk', 'amit@example.com', '9123456783'),
(5, 'Neha Roy', 'Technician', 'neha@example.com', '9123456784'),
(6, 'Manoj Das', 'Security', 'manoj@example.com', '9123456785'),
(7, 'Sunita Paul', 'Receptionist', 'sunita@example.com', '9123456786'),
(8, 'Rakesh Rao', 'Inventory Manager', 'rakesh@example.com', '9123456787');

CREATE TABLE Fines (
  FineID INT PRIMARY KEY,
  BorrowID INT,
  Amount DECIMAL(6,2),
  PaidStatus VARCHAR(10),
  PaymentDate DATE,
  FOREIGN KEY (BorrowID) REFERENCES Borrowing(BorrowID)
);

INSERT INTO Fines VALUES
(1, 1, 0.00, 'Paid', '2024-03-08'),
(2, 2, 10.00, 'Unpaid', NULL),
(3, 3, 0.00, 'Paid', '2024-03-14'),
(4, 4, 5.00, 'Unpaid', NULL),
(5, 5, 0.00, 'Paid', '2024-03-19'),
(6, 6, 0.00, 'Paid', '2024-03-21'),
(7, 7, 15.00, 'Unpaid', NULL),
(8, 8, 0.00, 'Paid', '2024-03-27');

CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY,
  Name VARCHAR(100),
  Contact VARCHAR(20),
  Email VARCHAR(100),
  Address VARCHAR(150)
);

INSERT INTO Suppliers VALUES
(1, 'Book World', '9988776655', 'bookworld@example.com', 'Delhi'),
(2, 'ReadMore Ltd.', '9988776656', 'readmore@example.com', 'Mumbai'),
(3, 'Pages & Co.', '9988776657', 'pagesco@example.com', 'Bangalore'),
(4, 'Global Publishers', '9988776658', 'globalpub@example.com', 'Hyderabad'),
(5, 'LitSupply', '9988776659', 'litsupply@example.com', 'Kolkata'),
(6, 'Wordsmiths', '9988776660', 'wordsmiths@example.com', 'Chennai'),
(7, 'BookBarn', '9988776661', 'bookbarn@example.com', 'Pune'),
(8, 'Educators Hub', '9988776662', 'educators@example.com', 'Ahmedabad');

SELECT b.Title, m.Name AS BorrowedBy
FROM Books b
JOIN Borrowing br ON b.BookID = br.BookID
JOIN Members m ON br.MemberID = m.MemberID;

SELECT Genre, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Genre;

SELECT b.Title, COUNT(br.MemberID) AS TotalBorrowed
FROM Books b
JOIN Borrowing br ON b.BookID = br.BookID
GROUP BY b.Title;

SELECT m.Name, b.Title, br.DueDate
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE br.ReturnDate IS NULL AND br.DueDate < CURDATE();

SELECT m.Name, SUM(f.Amount) AS TotalPaid
FROM Members m
JOIN Borrowing br ON m.MemberID = br.MemberID
JOIN Fines f ON br.BorrowID = f.BorrowID
WHERE f.PaidStatus = 'Paid'
GROUP BY m.Name;

SELECT b.Title, COUNT(br.BookID) AS TimesBorrowed
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
GROUP BY b.Title
ORDER BY TimesBorrowed DESC
LIMIT 1;

SELECT Name
FROM Members
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM Borrowing);

SELECT Title
FROM Books
WHERE BookID IN (SELECT DISTINCT BookID FROM Borrowing);

SELECT *
FROM Staff
ORDER BY Position ASC;

SELECT m.Name, f.Amount, f.PaidStatus
FROM Fines f
JOIN Borrowing br ON f.BorrowID = br.BorrowID
JOIN Members m ON br.MemberID = m.MemberID
WHERE f.PaidStatus = 'Unpaid';

SELECT s.Name AS SupplierName, COUNT(b.BookID) AS TotalSupplied
FROM Suppliers s
JOIN Books b ON s.SupplierID = b.BookID
GROUP BY s.Name;

SELECT m.Name, AVG(f.Amount) AS AverageFine
FROM Members m
JOIN Borrowing br ON m.MemberID = br.MemberID
JOIN Fines f ON br.BorrowID = f.BorrowID
GROUP BY m.Name;

SELECT m.Name, b.Title, br.BorrowDate
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE (br.BorrowDate, m.MemberID) IN (
  SELECT MAX(BorrowDate), MemberID
  FROM Borrowing
  GROUP BY MemberID
);
