SHOW DATABASES;

CREATE DATABASE house_price_regression;

USE house_price_regression;

CREATE TABLE IF NOT EXISTS house_price_data(
id INT NOT NULL,
listing_date DATE NOT NULL,
bedrooms INT NOT NULL,
bathrooms INT NOT NULL,
sqft_living INT NOT NULL,
sqft_lot INT NOT NULL,
floors INT NOT NULL,
waterfront BOOLEAN,
house_view INT NULL,
house_condition INT NOT NULL,
grade INT NOT NULL,
sqft_above INT NOT NULL,
sqft_basement INT NULL,
yr_built INT NOT NULL,
yr_renovated INT NULL,
zipcode	INT NOT NULL,
lat_long FLOAT NOT NULL,
houselong FLOAT NOT NULL,
sqft_living15 INT NOT NULL,
sqft_lot15 INT NOT NULL,
price INT NOT NULL,
PRIMARY KEY(id)
);

show global variables like 'local_infile';

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE '\Users\nicol\mid-bootcamp-project\mid-bootcamp-project-1\regression\data\regression_data.csv'
INTO TABLE house_price_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY 'n'
IGNORE 1 ROWS
(id, listing_date, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, house_view, house_condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat_long, houselong, sqft_living15, sqft_lot15, price)
SET listing_date = STR_TO_DATE(@listing_date, '%m/%d/%y');