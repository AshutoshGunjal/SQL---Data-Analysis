



/*SQL Aggregate Functions*/


SELECT *
FROM tutorial.aapl_historical_stock_price;


/*Query to write number of rows in a database*/

select COUNT(*)
from tutorial.aapl_historical_stock_price



/*Write a query to provide count of all the rows in which high column is not null */

select COUNT(high) 
from tutorial.aapl_historical_stock_price



/*Write a query to count the number of non-null rows in the low column.*/

select COUNT(low)
from tutorial.aapl_historical_stock_price




SELECT COUNT(date) AS "Count Of Date"
  FROM tutorial.aapl_historical_stock_price
  
  
  
  
 /*Write a query that determines counts of every single column. Which column has the most null values?*/

select COUNT(year) AS Year,
      COUNT(month) AS Month,
      COUNT(open) AS Open,
      COUNT(high) AS High,
      COUNT(low) AS Low,
      COUNT(close) AS Close,
      COUNT(volume) AS Volume
from tutorial.aapl_historical_stock_price





/*Write a query to select sum of volume column*/

select SUM(volume)
from tutorial.aapl_historical_stock_price



/*Write a query to calculate the average opening price (hint: you will need to use 
both COUNT and SUM, as well as some simple arithmetic.).*/


select SUM(open) / COUNT(open) AS "Average Opening Price"
from tutorial.aapl_historical_stock_price




/*Wriet a query to which selects the MIN and MAX from numerical volume column*/

select MIN(volume) AS "Minimum Volume",
       MAX(volume) AS "Maximum Volume"
from tutorial.aapl_historical_stock_price;




/*What was Apple's lowest stock price (at the time of this data collection)?*/

select MIN(low)
from tutorial.aapl_historical_stock_price;





/*What was the highest single-day increase in Apple's share value?*/

SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price
  
  
  
  
 /*Write a query to find average average of column high*/

select AVG(high)
from tutorial.aapl_historical_stock_price
where high is NOT NULL



/*Write a query that calculates the average daily trade volume for Apple stock.*/

select AVG(volume)
from tutorial.aapl_historical_stock_price




/*Write a query to count the number of entries for each year*/

select year,
       COUNT(*) AS Count
from tutorial.aapl_historical_stock_price
GROUP BY year




/*Write a query to count the number of entries for year and month*/

select year,
       month,
       COUNT(*) AS "Count"
from tutorial.aapl_historical_stock_price
GROUP BY year, month




/*Calculate the total number of shares traded each month. Order your results chronologically.*/

select year, 
      month, 
      SUM(volume) AS Volume_SUM
from tutorial.aapl_historical_stock_price
GROUP BY year,month
ORDER BY year, month;





/*Write a query to calculate the average daily price change in Apple stock, grouped by year.*/

select year,
      AVG(close-open) AS "Average Daily Price Change"
from tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year





/*Write a query that calculates the lowest and highest prices that Apple stock achieved each month.*/

select year,
       month,
       MIN(low) AS "Lowest",
       MAX(high) AS "Highest"
from tutorial.aapl_historical_stock_price
GROUP BY year, month
ORDER BY year, month





/*Write a query to count the number of entries for year and month and 
find every month during which AAPL stock worked its way over $400/share*/

select year,
       month,
       MAX(high) as "Month High"
from tutorial.aapl_historical_stock_price
GROUP BY year, month
HAVING MAX(high) > 400
ORDER BY year, month




/*Write a query to select unique values from the month column in apple stock prices datasets*/

select DISTINCT year, monthhttps://modeanalytics.com/editor/ashutosgunjal/reports/2b1656591181#
from tutorial.aapl_historical_stock_price




/*Write a query that returns the unique values in the year column, in chronological order.*/

select DISTINCT year
from tutorial.aapl_historical_stock_price
ORDER BY year




/*Write a query that counts the unique values in the month column.*/

select COUNT(DISTINCT month) AS "Unique Months"
from tutorial.aapl_historical_stock_price





/*Write a query that average trade volumes by month to get a sense of when Apple stock really moves*/

select month,
       AVG(volume) as "Average Trade Volume"
from tutorial.aapl_historical_stock_price
GROUP BY month





/*Write a query that counts the number of unique values in the month column for each year.*/

select  year,
        COUNT(DISTINCT month) AS "Month Count"
from tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year






/*Write a query that separately counts the number of unique values in the month column and the 
number of unique values in the `year` column.*/

SELECT COUNT(DISTINCT year) AS years_count,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
  
  
  
  
  
  
  







