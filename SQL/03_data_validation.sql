USE OnlineBookStore;

-- =========================================================
-- VIEWING ALL DATA IN ALL TABLES
-- =========================================================

-- View all data from Books table
SELECT *
FROM Books;

-- View all data from Customers table
SELECT *
FROM Customers;

-- View all data from Orders table
SELECT *
FROM Orders;


-- =========================================================
-- CHECK FOR MISSING DATA
-- =========================================================


-- =========================================================
-- FOR BOOKS TABLE
-- =========================================================

SELECT *
FROM Books
WHERE Book_ID IS NULL
   OR Title IS NULL
   OR Author IS NULL
   OR Genre IS NULL
   OR Published_Year IS NULL
   OR Price IS NULL
   OR Stock IS NULL;


-- =========================================================
-- FOR CUSTOMERS TABLE
-- =========================================================

SELECT *
FROM Customers
WHERE Customer_ID IS NULL
   OR Name IS NULL
   OR Email IS NULL
   OR Phone IS NULL
   OR City IS NULL
   OR Country IS NULL;


-- =========================================================
-- FOR ORDERS TABLE
-- =========================================================

SELECT *
FROM Orders
WHERE Order_ID IS NULL
   OR Customer_ID IS NULL
   OR Book_ID IS NULL
   OR Order_Date IS NULL
   OR Quantity IS NULL
   OR Total_Amount IS NULL;