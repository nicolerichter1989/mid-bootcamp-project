# REGRESSION PROJECT - HOUSE PRICES

## Introduction to the Project
I worked on this project as part of my mid-bootcamp-project during a Data Analytics course at Ironhack Coding School.

## Instructions
You are working as an analyst for a real estate company. Your company wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated.

## Objective
The task is to build a model that will predict the price of a house based on features provided in the dataset.

## Data

### Data Source

The Data has been provided from Ironhack coding school as part of my mid-bootcamp-project for my Data Analytics course.

### Structure of the Data

The data set consists of information on some 21.597 properties. The dataset consisted of historic data of houses sold between May 2014 to May 2015.
Following features are available:
1. id
2. date
3. bedrooms
4. bathrooms
5. sqft_living
6. sqft_lot
7. floors
8. waterfront
9. view
10. condition
11. grade
12. sqft_above
13. sqft_basement
14. yr_built
15. yr_renovated
16. zipcode
17. lat
18. long
19. sqft_living15
20. sqft_lot15
21. price 

## The Project

### Import, Review and Clean Data

The dataframe given had no great need to clean naming or column content. I decided to make following changes:
- Deal with ID column. The ID column showed on a couple of rows double listings of some of the properties. All data except the price has remained unchanged. As there was no way for me to find out whether or not those properties have been listed and sold more than once I decided to sort the data by id and date and drop duplicates. Also I decided to use the now unique value ID as index.
- Deal with both year columns. I decided to group both year columns in about 30 year bins. I took this decision because I could see that both variables provide insight on the property value but many values are present. They cannot be used as numerical values so they had to be changed into categoricals.
- Drop columns: date, lat (latitute), long (longitude), yr_buil, yr_renovated
- Change dtypes: waterfront to boolean, view, condition, zipcode, bedrooms, bathrooms, floors to object.
- Check for null values : none present

### Deal with Outliers

The numerical columns showed a wide distribution of data points. I tried following approaches:
- try a visual check via boxplot and remove the outliers using a funcion and a threshold. After 3 tries with different thresholds I was able to remove all Outliers which led to a big loss in data. (60%)
- windsorize outliers: capping the highest values at the upper or lower quantile. No loss in data.

### Create and Evaluate different Models

Using different Models I reached following r values:
- Outliers not removed, no normalization, dummy encoding - 79.90%
- Outliers not removed, standard scaler, onehotencoding - 81.19%
- Outliers removed(boxplot), no normalization, dummy encoding - 81.73%
- Outliers removed(windsorize), no normalization, dummy encoding - 86.67%
- Outliers removed(windsorize), boxcox transformation, dummy encoding - 87.78%

## Conclusion

I reached the highest r value and therfore highest explanation of the price via the variables with capping outliers, boxcox transformation and dummy encoding.

## Python Libraries
- [pandas](https://pandas.pydata.org/)
- [numpy](https://numpy.org/)
- [seaborn](https://seaborn.pydata.org/)
- [matplotlib](https://matplotlib.org/)
- [statsmodels](https://www.statsmodels.org/stable/index.html)
- [scipy](https://www.scipy.org/)
- [sklearn](https://scikit-learn.org/stable/)
