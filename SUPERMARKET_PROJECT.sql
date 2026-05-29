CREATE DATABASE Supermarket_Project;
USE Supermarket_Project;
SELECT * FROM supermarket;
CREATE TABLE 
SuperMarket_Analysis AS 
SELECT * FROM supermarket;

/*CHECKING NULLS*/

SELECT * FROM SuperMarket_Analysis 
WHERE Sales IS NULL;

/*ANALYSIS- There are no NULLS in Sales*/

/*CHECKING PAYMENT METHODS*/

SELECT DISTINCT Payment FROM SuperMarket_Analysis;

/*Sales VS Product VS Quantity Analysis*/

CREATE TABLE SuperMarket_Comparison AS
SELECT `Product Line`,
SUM(Quantity) AS Total_Quantity,
AVG(Sales) AS Average_Sales
FROM SuperMarket_Analysis 
GROUP BY `Product Line`;

SELECT * FROM SuperMarket_Comparison;

/*ANALYSIS- 
Electronic accessories are sold maximum(971)
Home and lifestyle products generates maximum average sales(336.64)*/

/*BRANCH PERFORMANCE*/

CREATE TABLE Branch_Analysis AS 
SELECT Branch,
SUM(Quantity) AS Total_Quantity,
AVG(Sales) AS Average_Sales
FROM SuperMarket_Analysis
GROUP BY Branch;

SELECT * FROM Branch_Analysis;

/*ANALYSIS-
The Branch "Alex" had the maximum quantity sold
The Branch "Giza" generated the maximum average sales*/

/*Payment analysis*/

CREATE TABLE Payment_anal AS 
SELECT `Payment`,
COUNT(Payment) AS Total_Transactions,
AVG(`Unit Price`) AS Average_Unit_price
FROM SuperMarket_Analysis 
GROUP BY `Payment`;

SELECT * FROM Payment_anal;

/*ANALYSIS-
Most Payments were made using 'Ewallet'*/

/*CITY ANALYSIS*/

CREATE TABLE Customer_Analysis AS 
SELECT city,
COUNT(Gender) AS GENDER_COUNT,
COUNT(`Customer type`) AS CUSTOMER_TYPE_COUNT
FROM SuperMarket_analysis
GROUP BY city;

SELECT * FROM Customer_Analysis;
/*ANALYSIS-
The city 'Yangon' has the maximum customers*/

/*GENDER-WISE CUSTOMER ANALYSIS*/

CREATE TABLE Gender_Analysis AS
SELECT gender,
AVG(Sales) AS Average_Sales
FROM SuperMarket_Analysis
GROUP BY Gender;

SELECT * FROM Gender_Analysis;

/*ANALYSIS- Female customers are more than Male ones.*/

