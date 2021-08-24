SHOW DATABASES;
CREATE DATABASE house_price_regression;

USE house_price_regression;

DROP TABLE IF EXISTS house_price_data;

CREATE TABLE IF NOT EXISTS house_price_data(
id BIGINT NOT NULL,
`date` TEXT NOT NULL,
bedrooms INT NOT NULL,
bathrooms INT NOT NULL,
sqft_living INT NOT NULL,
sqft_lot INT NOT NULL,
floors INT NOT NULL,
waterfront BOOLEAN,
`view` INT NULL,
`condition` INT NOT NULL,
grade INT NOT NULL,
sqft_above INT NOT NULL,
sqft_basement INT NULL,
yr_built INT NOT NULL,
yr_renovated INT NULL,
zipcode INT NOT NULL,
lat FLOAT NOT NULL,
`long` FLOAT NOT NULL,
sqft_living15 INT NOT NULL,
sqft_lot15 INT NOT NULL,
price INT NOT NULL
);

SET GLOBAL local_infile= 'ON';

SHOW VARIABLES LIKE "local_infile";

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'regression_data.csv'
INTO TABLE house_price_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY 'n'
IGNORE 1 ROWS
(id, `date`, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, `view`, `condition`, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, `long`, sqft_living15, sqft_lot15, price)
SET `date` = STR_TO_DATE(@`date`, '%d/%m/%y');