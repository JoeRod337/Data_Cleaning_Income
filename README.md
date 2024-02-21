# ***Data-Cleaning In MySQL***

  Demonstrating data cleaning using MySQL using USHouseholdIncome.cvs and USHouseholdIncome_Statistics.cvs.


### ***Project Overview***

  This project will demonstrate the cleaning and exploratory aspects of data analytics. I will import a total of 4 tables. Two of these tables will be edited and the other two tables will be the control tables of the edited tables to use as a reference and a backup if needed. The tables used in this project are ‘USHousholdIncome.csv’ and ‘USHousholdIncome_Statistics.csv’.


  ### ***Data***

  The data used for this project are USHouseholdIncome.cvs and USHouseholdIncome_Statistics.cvs files imported into MySQL.


  ### ***Tools***

MySQL
  - Used to clean data and do a exploratory data analysis.


### ***Goals***

Clean Data:
  - Show an understanding of looking for and correcting errors in the dataset.


### ***Table of Contents***
  - [***Importing Data***](#importing-data)

  - [***Cleaning Data***](#Cleaning-Data)
    
  - [***Exploratory Data Analysis***](#exploratory-data-analysis)


## ***Importing Data***

   I importanted a total of 4 tables. Two of these tables will be edited and the other two tables will be the control tables of the edited tables to use as a reference and a backup if needed. The tables used in this project are ‘USHousholdIncome.csv’ and ‘USHousholdIncome_Statistics.csv’.

![alt text](Data_Import1.0.png)



## ***Cleaning Data***


  After importing the tables I noticed that there was an issue with one of the column heads in the ‘Us_Household_Income_Statistics’ table. The first column head was not listed as a usable column in MySQL. This could be due to an import issue caused from formatting in the original data source.

![alt text](Data_Cleaning1.0.png)

![alt text](Data_Cleaning1.1.png)


  Next step would be to inspect the data column by column to see if there are any obvious errors in the data. After inspecting the dataset there are a number of areas that have misspelled names and missing data. We can systematically go through each column to ensure that the data is as accurate as possible.

  First before we alter anything, we should check for duplicates. Correcting this may correct some of the work we would start somewhere else. Starting with the ‘Us_Household_Income’ table I check for duplicates using the id column. As shown in the image below there are a number of rows that have duplicates.

![alt text](Data_Cleaning1.2.png)


To find the column location I need to query out the ‘row_id’ and ‘id’ using a subquery as shown in the image below to identify the rows that need to be removed.

![alt text](Data_Cleaning1.3.png)


  Next, we can move this query into a delete query to update the dataset as shown in the image below.

![alt text](Data_Cleaning1.4.png)


  I then ran through the same process for the other table ‘Us_Household_Income_Statistics’ to clean up any duplicates. According to the results there are no duplicates as shown below.

![alt text](Data_Cleaning1.5.png)


  Going back to the earlier findings of misspelling in the columns, we want to see the extent of the misspelling. When we looked at the ‘State_Name’ column we saw that Alabama was spelled as alabama. We want to do a count similar to what we did earlier to try and identify any more issues with ‘State_Name’. As you will see when queried out MySQL corrects the issue with alabama however we do find an issue with Georgia being misspelled.

![alt text](Data_Cleaning1.6.png)


  We want to update the misspelled goriga by running the query shown below to update the column.

![alt text](Data_Cleaning1.7.png)


  We can do the same to correct the Alabama spelling form alabama to Alabama.

![alt text](Data_Cleaning1.8.png)


  Another area we found easy was a blank in the ‘Place’ column. To check to see if there are any other blanks in that column, we used the following query and found that there was only one that had a blank cell.

![alt text](Data_Cleaning1.9.png)


  Looking at the data and running a query on the county the data shows that it was a small error and that the blank should be filled with Autaugaville. This would need to be followed up with a manager or stakeholder to be verified on what to do if any further analysis is needed before correcting. In this case we will fill the blank with Autaugaville as shown below.


![alt text](Data_Cleaning1.10.png)

![alt text](Data_Cleaning1.11.png)


  We want to inspect the ‘Type’ column and we find that there is an issue with spelling. Borough has been spelled two different ways Borough and boroughs. We want to correct this, and we will do so similar to the ways we listed previously.

![alt text](Data_Cleaning1.12.png)



## ***Exploratory Data Analysis***


  To start exploring this data I wanted to see if some basic queries make sense when going through the data. I searched for the sum of ‘Aland’ by State to see if land sizes looked to make sense. Texas has the largest and D.C. has the smallest. 

![alt text](Exploratory_Analysis1.1.png)


  Say I wanted to know the top 10 states that have land and the top 10 that have water. The images below show how to do that by adding a ‘limit X’ to the query respectively.

![alt text](Exploratory_Analysis1.2.png)

![alt text](Exploratory_Analysis1.3.png)


  So far, we have only worked with the ‘US_Household_income’ data. We have not worked with the ‘US_Household_Income_Statistics’ data. To do so we must join the tables.  See image below to see how I joined the two together. We used the ‘id’ column as our reference point to execute the inner join.

![alt text](Exploratory_Analysis1.4.png)


  However, it appears that not all the data came into the quarry so to correct these issues I changed the inner join to a right join. This will pull all data from ‘US_Household_Satistics’. This will pull the rest of the data from ‘US_Household_Income’ and create null cells where there may be missing or nonexistent data from the joining table.

![alt text](Exploratory_Analysis1.5.png)


  After the right join finished, I found that there are many areas of data that are missing. Using exploratory analysis, we have found a rather large hole in the data. This would be where I would reach out to the project manager or stakeholders to ensure that I correct the data before moving on or if I needed to remove the blank areas from any other analysis.

![alt text](Exploratory_Analysis1.6.png)

![alt text](Exploratory_Analysis1.7.png)

  The image above shows data that can be used for querying. I would also export this data for a report that can be created in any software of the user’s favor.


  The next several images shows how I would query out average income and list them in different orders.  This shows the different ways I can query and order data using MySQL.

![alt text](Exploratory_Analysis1.8.png)

![alt text](Exploratory_Analysis1.9.png)

![alt text](Exploratory_Analysis1.10.png)

![alt text](Exploratory_Analysis1.11.png)

![alt text](Exploratory_Analysis1.12.png)

![alt text](Exploratory_Analysis1.13.png)
