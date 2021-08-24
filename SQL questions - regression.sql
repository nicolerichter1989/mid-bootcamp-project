-- Create a database called house_price_regression.

-- Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns. 
-- You can find the names of the headers for the table in the regression_data.xls file. Use the same column names as the names in the excel file. Please make sure you use the correct data types for each of the columns.

-- Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. (in this case we have already deleted the header names from the csv files.) 
-- To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
-- SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go
-- SET GLOBAL local_infile = 1;

-- N: after some issues with the upload I had to use the import wizzard 
-- however I tried to make it work via writing SQL queries for creating the database and table and uploading via load data local infile. (separate SQL script)

-- NOTE : PROPERTIES ARE INTERPRETED AS EACH LINE OF AVAILABLE DATA THOUGH SOME ID'S ARE LISTED MORE THAN ONCE
-- HOWEVER FOR THE MODEL AND FURTHER ANALYSIS IN JUPYTER/PYTHON I WILL USE ONLY DISTINCT ID'S

USE house_price_regression;

-- Select all the data from table house_price_data to check if the data was imported correctly
SELECT *
FROM house_price_data;

-- Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE house_price_data
DROP COLUMN date;

SELECT *
FROM house_price_data
LIMIT 10;

-- Use sql query to find how many rows of data you have.
SELECT COUNT(id) as count_rows
FROM house_price_data;

-- Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms
FROM house_price_data
ORDER BY bedrooms;

-- What are the unique values in the column bathrooms?
SELECT DISTINCT bathrooms
FROM house_price_data
ORDER BY bathrooms;

-- What are the unique values in the column floors?
SELECT DISTINCT floors
FROM house_price_data
ORDER BY floors;

-- What are the unique values in the column condition?
SELECT DISTINCT house_price_data.condition
FROM house_price_data
ORDER BY house_price_data.condition;

-- What are the unique values in the column grade?
SELECT DISTINCT grade
FROM house_price_data
ORDER BY grade;

-- Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
SELECT id
FROM (
SELECT id, price,
RANK() over(ORDER BY price desc) as top_10_price
FROM house_price_data) as Table_1
WHERE top_10_price <= 10
ORDER BY top_10_price;

-- What is the average price of all the properties in your data?
SELECT AVG(price) as average_price
FROM house_price_data;

-- In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
-- What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
SELECT bedrooms, AVG(price) as average_price
FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms;

-- What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
SELECT bedrooms, AVG(sqft_living) as average_sqft_living
FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms;

-- What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.

-- N: 1 = waterfront 0 = no waterfront
SELECT waterfront, AVG(price) as average_price
FROM house_price_data
GROUP BY waterfront;

-- Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT house_price_data.condition, AVG(grade) as average_grade
FROM house_price_data
GROUP BY house_price_data.condition
ORDER BY house_price_data.condition;

-- OBSERVATIONS: the grade seems to be highest in condition 3. from 1-3 there is a steep increase and from 3-5 a slight decrease.
-- no clear correlation

SELECT grade, AVG(house_price_data.condition) as average_condition
FROM house_price_data
GROUP BY grade
ORDER BY grade;

-- OBSERVATIONS: grade 3 shows the highest average condition of 5. which has to be further investigated.
-- among the other grades I cannot see a clear trend. the condition seems to be slightly higher within grades 5,6,7.
-- no clear correlation

-- You might also have to check the number of houses in each category (ie number of houses for a given condition) to assess if that category is well represented in the dataset to include it in your analysis.
-- For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis

SELECT house_price_data.condition, COUNT(id) as number_of_houses, AVG(grade) as average_grade
FROM house_price_data
GROUP BY house_price_data.condition
ORDER BY house_price_data.condition;

-- OBSERVATIONS: condition 1 could be excluded because of the low number of houses but it would not make a difference for the previous analysis.

SELECT *
FROM (
SELECT grade, COUNT(id) as number_of_houses, AVG(house_price_data.condition) as average_condition
FROM house_price_data
GROUP BY grade
ORDER BY grade) as correlation_table
WHERE number_of_houses > 100;

-- OBSERVATIONS: removing all categories with less than 200 properties.
-- there seems to be a negative correlation

-- One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
-- Bathrooms more than 3
-- One Floor
-- No waterfront
-- Condition should be 3 at least
-- Grade should be 5 at least
-- Price less than 300000
-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?

SELECT *
FROM house_price_data
WHERE bedrooms in (3,4)
AND bathrooms >= 3
AND floors = 1
AND waterfront = 0
AND house_price_data.condition >= 3
AND grade >= 5
AND price < 300000
ORDER BY grade desc;

-- Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.
SELECT *
FROM house_price_data
WHERE price >= (2*(
SELECT AVG(price) as average_price
FROM house_price_data))
ORDER BY price;

-- Since this is something that the senior management is regularly interested in, create a view called Houses_with_higher_than_double_average_price of the same query.
CREATE VIEW Houses_with_higher_than_double_average_price as
SELECT *
FROM house_price_data
WHERE price >= (2*(
SELECT AVG(price) as average_price
FROM house_price_data))
ORDER BY price;

SELECT *
FROM Houses_with_higher_than_double_average_price;

-- Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms? 
-- In this case you can simply use a group by to check the prices for those particular houses
SELECT bedrooms, AVG(price) as average_price
FROM house_price_data
WHERE bedrooms in (3,4)
GROUP BY bedrooms;

-- What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode
FROM house_price_data
ORDER BY zipcode;

-- Show the list of all the properties that were renovated.
SELECT *
FROM house_price_data
WHERE yr_renovated not in (0)
ORDER BY yr_renovated;

-- Provide the details of the property that is the 11th most expensive property in your database.
SELECT *
FROM (
SELECT *,
RANK() over(ORDER BY price desc) as top_10_price
FROM house_price_data) as Table_1
WHERE top_10_price = 11;
