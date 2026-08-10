-- Level 3: Advanced

-- Skills Covered: CTE, Window Functions, CASE, Subqueries, RANK(), DENSE_RANK()

-- 31. Rank customers based on their total spending using RANK().
SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,
    SUM(o.Total_Amount) AS Total_Spending,

    RANK() OVER (
        ORDER BY SUM(o.Total_Amount) DESC
    ) AS Customer_Rank

FROM Customers c

JOIN Orders o
    ON c.Customer_ID = o.Customer_ID

GROUP BY
    c.Customer_ID,
    c.Name

ORDER BY Customer_Rank;
-- 32. Rank books based on total revenue generated.
SELECT
    b.Book_ID,
    b.Title,
    b.Genre,
    SUM(o.Total_Amount) AS Total_Revenue,

    RANK() OVER (
        ORDER BY SUM(o.Total_Amount) DESC
    ) AS Revenue_Rank

FROM Books b

JOIN Orders o
    ON b.Book_ID = o.Book_ID

GROUP BY
    b.Book_ID,
    b.Title,
    b.Genre

ORDER BY Revenue_Rank;
-- 33. Classify customers into spending categories:
-- Gold → ₹10,000+
-- Silver → ₹5,000–₹9,999
-- Bronze → Below ₹5,000
-- (using CASE)

SELECT
    c.Customer_ID,
    c.Name AS Customer_Name,

    SUM(o.Total_Amount) AS Total_Spending,

    CASE
        WHEN SUM(o.Total_Amount) >= 10000
            THEN 'Gold'

        WHEN SUM(o.Total_Amount) >= 5000
            THEN 'Silver'

        ELSE 'Bronze'
    END AS Customer_Segment

FROM Customers c

JOIN Orders o
    ON c.Customer_ID = o.Customer_ID

GROUP BY
    c.Customer_ID,
    c.Name

ORDER BY Total_Spending DESC;
-- 34. Find the second highest-selling book using a window function.
WITH BookSales AS (

    SELECT
        b.Book_ID,
        b.Title,
        SUM(o.Quantity) AS Total_Quantity_Sold,

        DENSE_RANK() OVER (
            ORDER BY SUM(o.Quantity) DESC
        ) AS Sales_Rank

    FROM Books b

    JOIN Orders o
        ON b.Book_ID = o.Book_ID

    GROUP BY
        b.Book_ID,
        b.Title
)

SELECT
    Book_ID,
    Title,
    Total_Quantity_Sold

FROM BookSales

WHERE Sales_Rank = 2;
-- 35. Find customers whose spending is above the average customer spending.
WITH CustomerSpending AS (

    SELECT
        c.Customer_ID,
        c.Name AS Customer_Name,
        SUM(o.Total_Amount) AS Total_Spending

    FROM Customers c

    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID

    GROUP BY
        c.Customer_ID,
        c.Name
)

SELECT
    Customer_ID,
    Customer_Name,
    Total_Spending

FROM CustomerSpending

WHERE Total_Spending >
(
    SELECT AVG(Total_Spending)
    FROM CustomerSpending
)

ORDER BY Total_Spending DESC;
-- 36. Calculate the cumulative monthly revenue using a running total.
WITH MonthlySales AS (

    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m-01') AS Sales_Month,
        SUM(Total_Amount) AS Monthly_Revenue

    FROM Orders

    GROUP BY
        DATE_FORMAT(Order_Date, '%Y-%m-01')
)

SELECT
    Sales_Month,
    Monthly_Revenue,

    SUM(Monthly_Revenue) OVER (
        ORDER BY Sales_Month
    ) AS Cumulative_Revenue

FROM MonthlySales

ORDER BY Sales_Month;
-- 37. Compare each months revenue with the previous month.
WITH MonthlySales AS (

    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m-01') AS Sales_Month,
        SUM(Total_Amount) AS Monthly_Revenue

    FROM Orders

    GROUP BY
        DATE_FORMAT(Order_Date, '%Y-%m-01')
),

MonthlyComparison AS (

    SELECT
        Sales_Month,
        Monthly_Revenue,

        LAG(Monthly_Revenue) OVER (
            ORDER BY Sales_Month
        ) AS Previous_Month_Revenue

    FROM MonthlySales
)

SELECT
    Sales_Month,
    Monthly_Revenue,
    Previous_Month_Revenue,

    Monthly_Revenue - Previous_Month_Revenue
        AS Revenue_Difference,

    ROUND(
        (
            (Monthly_Revenue - Previous_Month_Revenue)
            / Previous_Month_Revenue
        ) * 100,
        2
    ) AS Revenue_Growth_Percentage

FROM MonthlyComparison

ORDER BY Sales_Month;
-- 38. Find the top-selling book in each genre.
WITH BookSales AS (

    SELECT
        b.Book_ID,
        b.Title,
        b.Genre,

        SUM(o.Quantity) AS Total_Quantity_Sold,

        ROW_NUMBER() OVER (
            PARTITION BY b.Genre
            ORDER BY SUM(o.Quantity) DESC
        ) AS Genre_Rank

    FROM Books b

    JOIN Orders o
        ON b.Book_ID = o.Book_ID

    GROUP BY
        b.Book_ID,
        b.Title,
        b.Genre
)

SELECT
    Book_ID,
    Title,
    Genre,
    Total_Quantity_Sold

FROM BookSales

WHERE Genre_Rank = 1

ORDER BY Genre;
-- 39. Calculate each customer's contribution to the bookstore's total revenue as a percentage.
WITH CustomerSales AS (

    SELECT
        c.Customer_ID,
        c.Name AS Customer_Name,
        SUM(o.Total_Amount) AS Customer_Revenue

    FROM Customers c

    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID

    GROUP BY
        c.Customer_ID,
        c.Name
)

SELECT
    Customer_ID,
    Customer_Name,
    Customer_Revenue,

    ROUND(
        Customer_Revenue
        /
        SUM(Customer_Revenue) OVER ()
        * 100,
        2
    ) AS Revenue_Contribution_Percentage

FROM CustomerSales

ORDER BY Revenue_Contribution_Percentage DESC;
-- 40. Create a Book Inventory Report showing:
-- Book Name
-- Current Stock
-- Total Quantity Sold
-- Remaining Stock
-- Inventory Value (Price × Stock)
-- Inventory Status (Low, Medium, High)
-- (using CASE, JOIN, and aggregate functions)

SELECT
    b.Book_ID,
    b.Title,
    b.Genre,
    b.Price,

    b.Stock AS Current_Stock,

    COALESCE(SUM(o.Quantity), 0) AS Total_Quantity_Sold,

    b.Stock * b.Price AS Inventory_Value,

    CASE

        WHEN b.Stock = 0
            THEN 'Out of Stock'

        WHEN b.Stock < 5
            THEN 'Critical - Restock'

        WHEN b.Stock < 10
            THEN 'Low Stock'

        WHEN b.Stock < 20
            THEN 'Healthy'

        ELSE 'High Stock'

    END AS Inventory_Status

FROM Books b

LEFT JOIN Orders o
    ON b.Book_ID = o.Book_ID

GROUP BY
    b.Book_ID,
    b.Title,
    b.Genre,
    b.Price,
    b.Stock

ORDER BY
    b.Stock ASC;
