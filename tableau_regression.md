# Tableau - Regression

In this part of the project you will work with the data set `regression.xls` and use Tableau to answer the questions below: 

Create a visually appealing dashboard to represent the information.

**Some points to keep in mind while working on the tableau questions:**

   a) The plots should be well labelled briefly describing the purpose of the plot
   b) Select the chart type that produces an effective outcome for a given scenario
   c) Focus audience attention on the most important data
   d) Use space, color and fonts appropriately
   e) Use correct title for the plots.
   f) Utilize formatted tooltips and descriptive titles
   g) Format the axes wherever necessary
   h) Use caption to add details wherever necessary
   i) Use appropriate level of details with labels and color coding etc.
   j) For the dashboard make sure that the information represented is clear and easy to understand. The user of the dashboard should be able to understand the purpose of the dashboard and should be able to make decisions looking at the plots presented.
   k) You can also use filters wherever appropriate to give the user the flexibility to view different information easily.


**Tableau Questions:**

**1.** Convert the necessary dimensions to measures  (the variables that are categorical in nature). When you use a separate sheet for this question, add a note in that sheet on which columns were changed.
Converted to dimension (condition, waterfront, view, grade)

**2.** Plot the distribution of `price` vs. _number of bedrooms_, `price` vs. _number of bathrooms_, `price` vs. _condition_, `price` vs. _floors_, `price` vs. _grade_, `price` vs. _view_, and `price` vs. _waterfront_.
   State your observation for each one of those graphs. Do you see any trends in prices vs the rest of those variables individually? This can also be used for EDA to identify some data cleaning operations that you might need to perform further.
price/bedrooms: the average selling price peaks at 8 bedrooms. This peak seems to start at around 5 and end at around 10 bedrooms. Values 11 and 33 are single outliers and cannot be taken into consideration.
price/bathrooms: the average selling price increases steadily until 6.25 bathrooms. As the count of listings is decreasing  as the number of bathrooms is increasing the higher fluctuation cannot be clearly interpreted. but there is definetly a trend towards higher avg selling price = higher amount of bathrooms.
price/grade: the average selling price is increasing as the grade is increasing. this does not seem to be affected by the count of values present.
price condition: the average selling price is increasing as the condition is increasing. this does not seem to be affected by the count of values present.
price/floors: the average selling price peaks at 2.5 floors. 
price/view: the average selling price is increasing as the view rating is increasing. 
price/waterfront: the average selling price is about 3 times higher when the property is located waterfront.

**3.** Draw scatter plots for `price` vs. `sqft_above`, `price` vs. `sqft_basement`, `price` vs. `living15`, `price` vs. `sqft_lot15`.

**4.** Identify using tableau which state data is presented to you. Use latitude, longitude, and zip code for this. Color code the zip codes based on the prices to see which areas are more expensive than the others.
most expensive zip codes are 98039, 98004 and 98040.

**5.** Create a plot to check which are the more selling properties based on the number of bedrooms in the house. Create a plot of bedrooms vs. count of data points.
most selling properties have 3 bedrooms

**6.** We want to see the trend in price of houses based on the year built. From our previous plot, we know that most of our customers are interested in three and four bedroom houses. Create a filter on bedroom feature to select those properties and compare the trends in prices using line charts.
decreasing tredn until 1969. after that increasing again.

**7.** Create calculated field `year_built_bins` for the column `year_built` by creating buckets as follows, for houses built between 1900 and 1930 - category A, for houses built between 1930 and 1960 - category B, and for houses built between 1960 and 1990 - category C, and for houses built between 1990 and 2015 - category D. Use `IF-ELSE` statement to create the bins/buckets. Compare the prices of houses for the four categories.
the average selling price for houses is highest in category D followed by category A

**8.** Now we want to deep dive into the categories we created in the last question. Let???s see how many properties are in each of the categories. Indicate the numbers as labels on each of the three categories.
A 2.732
B 4.901
C 7.293
D 6.671

**9.** Deep dive in category A, category B, category C and category D using filters. Identify different characteristics/trends for each of the four categories.

