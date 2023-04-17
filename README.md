# AdventureWorks-Sales-Module-Report

## Project Overview
This project is a Power BI report that analyzes sales data from the AdventureWorks database. It's  a sample database provided by Microsoft for learning and testing purposes. Specifically, We utilized the Sales module, which contains information about sales orders, products, and sales territories. The goal of this project is getting insights from various aspects of the sales data, including product sales performance, and regional sales trends.

## DataSet
The dataset can be found through [AdventureWorks Database](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms)

## Project Steps
**(1)** Data exploration and defining business logic.

**(2)** Data transformation using SQL.

**(3)** Data Modeling using Star Schema.

**(4)** Data visualizations and extracting insights.

## Analysis Result
**(1)** It appears that the most orders were placed on day 30 of each month, while the most orders were shipped on day 7 and delivered on day 12. These insights can help organizations optimize their supply chain and logistics operations.

**(2)** Across all years, the southwest territory was the top-performing region in terms of sales. This information can be used by organizations to identify regions where sales and marketing efforts may need to be improved to increase profitability.

**(3)** It reveals that 2013 had the highest sales revenue, while 2011 had the lowest. This information can help organizations understand trends in sales performance over time and adjust their strategies accordingly.

## Data Model 
Star schema is used as we are focusing on retrieving insights from the data rather than updating or modifying it.

![Data ModelPNG](https://user-images.githubusercontent.com/128556308/232615070-122582b1-53ef-4245-ba0a-58b42b53d7fa.PNG)

## Report

Sales Overview
![sales](https://user-images.githubusercontent.com/128556308/232615999-69a0063d-c8d2-464b-bd96-80913ba5117b.PNG)

Territory Details
![territory](https://user-images.githubusercontent.com/128556308/232616823-79f794c7-1453-4c28-b3b4-7da04c7d68e8.PNG)


Product Details 
![product](https://user-images.githubusercontent.com/128556308/232616120-db84b556-d104-452d-9d20-519d16a1be78.PNG)







