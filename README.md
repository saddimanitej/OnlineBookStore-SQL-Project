# 📚 Online Bookstore SQL Analysis

## 1. Project Overview

This project analyzes an **Online Bookstore dataset** using MySQL. The analysis focuses on books, customers, and orders to uncover useful insights related to sales, revenue, customer behavior, and inventory.

The project is divided into **Beginner, Intermediate, and Advanced SQL analysis**.

---

## 2. Business Problem

The bookstore wants to better understand its data and answer questions such as:

* Which books and genres perform best?
* Which customers generate the most revenue?
* What are the overall sales trends?
* Which books have low stock?
* Which genres generate the highest revenue?
* Who are the repeat customers?

The goal is to use SQL to turn raw bookstore data into meaningful business insights.

---

## 3. Database Schema

The database contains three tables:

```text
Customers
    │
    │ Customer_ID
    ▼
  Orders
    │
    │ Book_ID
    ▼
  Books
```

### Tables

**Books**

* Book_ID
* Title
* Author
* Genre
* Published_Year
* Price
* Stock

**Customers**

* Customer_ID
* Name
* Email
* Phone
* City
* Country

**Orders**

* Order_ID
* Customer_ID
* Book_ID
* Order_Date
* Quantity
* Total_Amount

---

## 4. Tools Used

* MySQL
* MySQL Workbench
* SQL
* GitHub

---

## 5. SQL Concepts

### Beginner

* SELECT
* WHERE
* ORDER BY
* LIMIT
* DISTINCT
* COUNT

### Intermediate

* GROUP BY
* HAVING
* SUM
* AVG
* MIN / MAX
* JOINs
* CASE
* Date Functions

### Advanced

* Subqueries
* CTEs
* Window Functions
* RANK
* DENSE_RANK
* ROW_NUMBER
* Running Totals

---

## 6. Questions

### Beginner

* What books are available in the bookstore?
* Which customers are from India?
* Which books belong to the Fiction genre?
* What are the most expensive books?
* Which books have low stock?
* How many books, customers, and orders are there?

### Intermediate

* Which genres have the most books?
* What is the average price by genre?
* Which books have sold the most copies?
* Which customers have placed multiple orders?
* What is the total revenue by genre?
* Which books have never been ordered?

### Advanced

* Who are the top customers by revenue?
* What are the top 3 books in each genre?
* Which customers spend more than the average customer?
* What percentage of revenue comes from each genre?
* What is the monthly revenue trend?
* Which books have high sales but low stock?

---

## 7. Key Insights

> **To be updated after completing the SQL analysis.**

The final insights will highlight:

* Top-performing books
* Best-performing genres
* Highest-value customers
* Revenue trends
* Inventory concerns
* Customer purchasing behavior

---

## 8. Project Structure

```text
OnlineBookStore-SQL-Project/
│
├── Dataset/
│   ├── 03_Books.csv
│   ├── 04_Orders.csv
│   └── 05_Customers.csv
│
├── SQL/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_data_validation.sql
│   ├── 04_beginner_queries.sql
│   ├── 05_intermediate_queries.sql
│   └── 06_advanced_queries.sql
│
└── README.md
```

---

## 9. How to Run

1. Open MySQL Workbench.
2. Run `01_create_database.sql`.
3. Run `02_create_tables.sql`.
4. Import the three CSV files using MySQL Workbench.
5. Run `03_data_validation.sql`.
6. Run the Beginner SQL queries.
7. Run the Intermediate SQL queries.
8. Run the Advanced SQL queries.

---

## 10. Author

**Manitej**

Aspiring Data Analyst | SQL | Data Analysis

⭐ Feel free to explore the project and SQL analysis.
