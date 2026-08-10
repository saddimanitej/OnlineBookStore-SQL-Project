USE OnlineBookStore;

-- =========================================================
-- LEVEL 1: BEGINNER QUERIES
-- Skills Covered:
-- SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, COUNT
-- =========================================================


-- =========================================================
-- Q1. Display all books available in the bookstore.
-- =========================================================

SELECT *
FROM Books;


-- =========================================================
-- Q2. Display all customers from India.
-- =========================================================

SELECT *
FROM Customers
WHERE Country = 'India';


-- =========================================================
-- Q3. List all books in the Fiction genre.
-- =========================================================

SELECT *
FROM Books
WHERE Genre = 'Fiction';


-- =========================================================
-- Q4. Find books published after the year 2010.
-- =========================================================

SELECT *
FROM Books
WHERE Published_Year > 2010;


-- =========================================================
-- Q5. Display books with a price greater than ₹500.
-- =========================================================

SELECT *
FROM Books
WHERE Price > 500;


-- =========================================================
-- Q6. Find books that have fewer than 10 copies in stock.
-- =========================================================

SELECT *
FROM Books
WHERE Stock < 10;


-- =========================================================
-- Q7. Display the top 5 most expensive books.
-- =========================================================

SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 5;


-- =========================================================
-- Q8. Display the 5 cheapest books.
-- =========================================================

SELECT *
FROM Books
ORDER BY Price ASC
LIMIT 5;


-- =========================================================
-- Q9. Count the total number of books available.
-- =========================================================

SELECT COUNT(*) AS Total_Books
FROM Books;


-- =========================================================
-- Q10. Count the total number of customers.
-- =========================================================

SELECT COUNT(*) AS Total_Customers
FROM Customers;


-- =========================================================
-- Q11. Count the total number of orders placed.
-- =========================================================

SELECT COUNT(*) AS Total_Orders
FROM Orders;


-- =========================================================
-- Q12. Display all unique book genres.
-- =========================================================

SELECT DISTINCT Genre
FROM Books
ORDER BY Genre;


-- =========================================================
-- Q13. List all books sorted by publication year
--      (newest first).
-- =========================================================

SELECT *
FROM Books
ORDER BY Published_Year DESC;


-- =========================================================
-- Q14. Find all books written by a specific author.
-- =========================================================

SELECT *
FROM Books
WHERE Author = 'George Orwell';


-- =========================================================
-- Q15. Display all orders placed after '2023-01-01'.
-- =========================================================

SELECT *
FROM Orders
WHERE Order_Date > '2023-01-01'
ORDER BY Order_Date;