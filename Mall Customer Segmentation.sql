
--Select all the data from the table
SELECT * 
FROM public."Mall_Customers"

--Sort all the customers from the table by the revenue in a descending order 
SELECT * 
FROM public."Mall_Customers"
ORDER BY "Annual Income ($)" DESC;

--Sort all the customers from the table by the spending score in a descending order 
SELECT * 
FROM public."Mall_Customers"
ORDER BY "Spending Score (1-100)" DESC;

--Show maximium age, income & spending score
SELECT MAX("Age"),
		MAX("Annual Income ($)"),
		MAX("Spending Score (1-100)")
FROM public."Mall_Customers";

--Show minimium age, income & spending score
SELECT MIN("Age"),
		MIN("Annual Income ($)"),
		MIN("Spending Score (1-100)")
FROM public."Mall_Customers";

--Show average age, income & spending score
SELECT AVG("Age", 2),
		AVG("Annual Income ($)", 2),
		AVG("Spending Score (1-100)")
FROM public."Mall_Customers";

--Median values for age, income and spending score
SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Annual Income ($)") AS "MedianIncome"
FROM public."Mall_Customers";

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Spending Score (1-100)") AS "MedianSpending"
FROM public."Mall_Customers";

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Age") AS "MedianIncome"
FROM public."Mall_Customers";
	
--Median values for age, income and spending score (method 2)
SELECT AVG("Annual Income ($)") AS "MedianA"
FROM
(
	SELECT "Annual Income ($)",
		ROW_NUMBER() OVER (ORDER BY "Annual Income ($)" ASC, "CustomerID" ASC) AS RowAsc,
		ROW_NUMBER() OVER (ORDER BY "Annual Income ($)" DESC, "CustomerID" DESC) AS RowDesc
	FROM public."Mall_Customers"
) data
WHERE 
	RowAsc IN (RowDesc, RowDesc - 1, RowDesc + 1);
	
SELECT AVG("Spending Score (1-100)") AS "MedianA"
FROM
(
	SELECT "Spending Score (1-100)",
		ROW_NUMBER() OVER (ORDER BY "Spending Score (1-100)" ASC, "CustomerID" ASC) AS RowAsc,
		ROW_NUMBER() OVER (ORDER BY "Spending Score (1-100)" DESC, "CustomerID" DESC) AS RowDesc
	FROM public."Mall_Customers"
) data
WHERE 
	RowAsc IN (RowDesc, RowDesc - 1, RowDesc + 1);

--Show all data for male customers
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Show all data for female customers
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Show the number of male customers
SELECT COUNT("Gender")
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Show the number of female customers
SELECT COUNT("Gender")
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Maximium income for male customers
SELECT MAX("Annual Income ($)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Maximium income for female customers
SELECT MAX("Annual Income ($)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Show all information for the customer with the highest revenue
SELECT "CustomerID",
		"Age",
		"Gender"
		"Annual Income ($)", 
		"Spending Score (1-100)"
FROM public."Mall_Customers"
ORDER BY "Annual Income ($)" DESC
LIMIT 1;

--Show all information for the male customer with the highest revenue
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%'
ORDER BY "Annual Income ($)" DESC
LIMIT 1;

--Show all information for the female customer with the highest revenue
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%'
ORDER BY "Annual Income ($)" DESC
LIMIT 1;

--Total income for all male customers
SELECT SUM("Annual Income ($)")
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Total income for all female customers
SELECT SUM("Annual Income ($)")
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Average income for all female customers
SELECT AVG("Annual Income ($)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Average income for all male customers
SELECT AVG("Annual Income ($)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Show all information for the customer with the highest spending score
SELECT * 
FROM public."Mall_Customers"
ORDER BY "Spending Score (1-100)" DESC
LIMIT 1;

--Show all information for the male customers with the highest spending score
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%'
ORDER BY "Spending Score (1-100)" DESC
LIMIT 1;

--Show all information for the female customers with the highest spending score
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%'
ORDER BY "Spending Score (1-100)" DESC
LIMIT 1;

--Average spending score for all male customers
SELECT AVG("Spending Score (1-100)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Average spending score for all female customers
SELECT AVG("Spending Score (1-100)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Average spending score for all male customers
SELECT AVG("Spending Score (1-100)") 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Median income for male customers
SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Annual Income ($)") AS "MedianIncomeM"
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Median income for female customers
SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Annual Income ($)") AS "MedianIncomeF"
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Median spending score for male customers
SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Spending Score (1-100)") AS "MedianSpendingM"
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%';

--Median spending score for female customers
SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY "Spending Score (1-100)") AS "MedianSpendingF"
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%';

--Sort all customers by age in descending order
SELECT * 
FROM public."Mall_Customers"
ORDER BY "Age" DESC;

--Sort all male customers by age in descending order
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Male%'
ORDER BY "Age" DESC;

--Sort all female customers by age in descending order
SELECT * 
FROM public."Mall_Customers"
WHERE "Gender" LIKE '%Female%'
ORDER BY "Age" DESC;

--Sort all customers aged under 20 by spending score in descending order 
SELECT *
FROM public."Mall_Customers"
WHERE "Age" <= 20
ORDER BY "Spending Score (1-100)" DESC;

--Sort all customers aged between 21 and 40 by spending score in descending order 
SELECT *
FROM public."Mall_Customers"
WHERE "Age" BETWEEN 21 AND 40
ORDER BY "Spending Score (1-100)" DESC;

--Sort all customers aged between 41 and 60 by spending score in descending order 
SELECT *
FROM public."Mall_Customers"
WHERE "Age" BETWEEN 41 AND 60
ORDER BY "Spending Score (1-100)" DESC;

--Sort all customers aged above 60 by spending score in descending order 
SELECT *
FROM public."Mall_Customers"
WHERE "Age" > 60
ORDER BY "Spending Score (1-100)" DESC;

--Sort all customers with annual income above $100 by the income in descending order
SELECT *
FROM public."Mall_Customers"
WHERE "Annual Income ($)" > 100
ORDER BY "Annual Income ($)" DESC;

--Average income for all customers earning above $100
SELECT AVG("Annual Income ($)")
FROM public."Mall_Customers"
WHERE "Annual Income ($)" > 100;

--Sort all customers earning between $51 and $100 by the income in descending order
SELECT *
FROM public."Mall_Customers"
WHERE "Annual Income ($)" BETWEEN 51 AND 100
ORDER BY "Annual Income ($)" DESC;

--Sort all customers earning below $50 by the income in descending order
SELECT *
FROM public."Mall_Customers"
WHERE "Annual Income ($)" < 50
ORDER BY "Annual Income ($)" DESC;

SELECT *
FROM public."Mall_Customers"
WHERE "Annual Income ($)"=(select max("Annual Income ($)") as max_annualincome from public."Mall_Customers")
ORDER BY "Spending Score (1-100)" 

--Sort all customers with spending score greater than 50 in a descending order
SELECT *
FROM public."Mall_Customers"
WHERE "Spending Score (1-100)" > 50
ORDER BY "Spending Score (1-100)" DESC;

--Row number according to Age
SELECT "CustomerID", 
		"Gender", 	
		"Age", 
		"Annual Income ($)",
		ROW_NUMBER() OVER (PARTITION BY "Age"
		ORDER BY "Annual Income ($)") AS row_num
FROM public."Mall_Customers";

--Rank by Age
SELECT "CustomerID", 
		"Gender", 	
		"Age",
		"Annual Income ($)",
		"Spending Score (1-100)",
		RANK() OVER (PARTITION BY "Age"
		ORDER BY "Spending Score (1-100)") AS total_rank
FROM public."Mall_Customers";

--Lag difference for the annual income
SELECT "CustomerID",
		"Age",
		annual_sum,
		LAG(annual_sum) OVER (ORDER BY annual_sum) AS lag,
		annual_sum - LAG(annual_sum) OVER (ORDER BY annual_sum) AS lag_difference
FROM (
		SELECT "CustomerID", "Age", SUM("Annual Income ($)") AS annual_sum
		FROM public."Mall_Customers"
		GROUP BY 1,2
		) sub
		
--Lead difference for the annual income
SELECT "CustomerID",
		"Age",
		annual_sum,
		LEAD(annual_sum) OVER (ORDER BY annual_sum) AS lead,
		annual_sum - LEAD(annual_sum) OVER (ORDER BY annual_sum) AS lead_difference
FROM (
		SELECT "CustomerID", "Age", SUM("Annual Income ($)") AS annual_sum
		FROM public."Mall_Customers"
		GROUP BY 1,2
		) sub

--Percentile for annual income
SELECT "CustomerID",
		"Age",
		"Annual Income ($)",
		NTILE(4) OVER (ORDER BY "Annual Income ($)") AS quartile,
		NTILE(5) OVER (ORDER BY "Annual Income ($)") AS quintile,
		NTILE(100) OVER (ORDER BY "Annual Income ($)") AS percentile
FROM public."Mall_Customers"
ORDER BY "Annual Income ($)" DESC;

--Percentile for the spending score
SELECT "CustomerID",
		"Age",
		"Annual Income ($)",
		"Spending Score (1-100)",
		NTILE(4) OVER (ORDER BY "Spending Score (1-100)") AS quartile,
		NTILE(5) OVER (ORDER BY "Spending Score (1-100)") AS quintile,
		NTILE(100) OVER (ORDER BY "Spending Score (1-100)") AS percentile
FROM public."Mall_Customers"
ORDER BY "Spending Score (1-100)" DESC;
