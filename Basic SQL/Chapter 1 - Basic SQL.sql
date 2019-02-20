/* Write a query to view year, month and west colums from tutorials.us_housing_units table*/

SELECT year,
       month,
       west
  FROM tutorial.us_housing_units
  
  
  
  
 /* 
 Write a query to select all of the columns in the tutorial.us_housing_units 
table without using *   
*/

select year, month, month_name, south, west, midwest, northeast
from tutorial.us_housing_units;





/* Write a query to select all of the columns in tutorial.us_housing_units 
and rename them so that their first letters are capitalized.  */

select year as "Year",
       month as "Month",
      month_name as "Month_Name",
      west as "West",
      midwest as "Midwest",
      south as "South",
      northeast as "Northeast"
from tutorial.us_housing_units;




/*Write a query that uses the LIMIT command to restrict the result set to only 15 rows.*/

select * from tutorial.us_housing_units
LIMIT 15;





/*Comparison Operator*/


/*Note: units in the database table are already in thousands */

/*Write SQL query to return only the rows where the West Region produced 
more than 30,000 housing units */

select * from tutorial.us_housing_units
where west > 30;






/*Write SQL query to return only the rows where the West Region produced 
more than 30,000 housing units but less than 35,000 units and restric the result set to only 20 */

select * from tutorial.us_housing_units
where west > 30 AND west < 35
LIMIT 20;





/*Did the West Region ever produce more than 50,000 housing units in one month?*/

select * from tutorial.us_housing_units
where west > 50;





/*Did the South Region ever produce 20,000 or fewer housing units in one month?*/

select * from tutorial.us_housing_units
where south <= 20;




/*Write SQL query that shows none of the January month rows.*/

select * from tutorial.us_housing_units
where month_name != 'January';





/*Write SQL query that shows rows with month name starts with J or ahead of J*/

select * from tutorial.us_housing_units
where month_name >= 'J';




/*Write a query that only shows rows for which the month name is February.*/

select * from tutorial.us_housing_units 
where month_name = 'February';





/*Write a query that only shows rows for which the month_name starts 
with the letter "N" or an earlier letter in the alphabet.*/

select * from tutorial.us_housing_units
where month_name <= 'N';





/*Arithmetic Operator*/

/*Write a query which produces columns showing sum of whatever is in 
south and west columns for each row*/

select year,
       month,
       month_name,
       south + west as South_And_West
from tutorial.us_housing_units;




/*Write a query that calculates the sum of all four regions in a separate column.*/

select year,
       month,
       month_name,
       south+west+midwest+northeast as S_W_M_N
from tutorial.us_housing_units;




/*Write sql query to find average between south and west column and store the values in new column*/

select year,
       month,
       month_name,
       (south+west) / 2 as AVG_SouthWest
from tutorial.us_housing_units;




/*Write a query that returns all rows for which more units were produced in the 
West region than in the Midwest and Northeast combined.*/

select year,
       month,
       month_name,
       south,
       west,
       midwest,
       northeast
from tutorial.us_housing_units
where west > (midwest + northeast);


      


/*Write a query that calculates the percentage of all houses completed in the 
United States represented by each region. Only return results from the year 2000 and later.

Hint: There should be four columns of percentages*/

select year,
       month,
       month_name,
       south/(south+west+midwest+northeast)*100 as south_percentage,
       west/(south+west+midwest+northeast)*100 as west_percentage,
       midwest/(south+west+midwest+northeast)*100 as midwest_percentage,
       northeast/(south+west+midwest+northeast)*100 as northeast_percentage
from tutorial.us_housing_units
where year >= 2000;





/* LOGICAL Operators */

/* Database used is Billborads Music Charts*/

select * from tutorial.billboard_top_100_year_end;




SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
 
 
 /*Write SQL query which include rows for which "group" starts with “Snoop” and is followed 
by any number and selection of characters*/

select * from tutorial.billboard_top_100_year_end
where "group" like 'Snoop%';




/*Write SQL query which include rows for which "group" starts with “snoop” and is followed 
by any number and selection of characters using ILIKE*/

select * from tutorial.billboard_top_100_year_end
WHERE "group" ilike 'snoop%';





/*Write SQL query which include rows for which "artist" includes “drake” and is followed 
by any number and selection of characters using ILIKE*/

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke'
 
 



 /*Write a query that returns all rows for which Ludacris was a member of the group.*/

select * from tutorial.billboard_top_100_year_end
where "group" ILIKE '%ludacris%'




/*Write a query that returns all rows for which the first artist 
listed in the group has a name that begins with "DJ".*/

select * from tutorial.billboard_top_100_year_end
where artist like 'DJ%'





/*Write a query of data from the Billboard Music Charts will return results for 
which the year_rank column is equal to one of the values in the list:*/

select * from tutorial.billboard_top_100_year_end
where year_rank IN (1,2);





/*Write a query of data from the Billboard Music Charts will return results for 
which the artist column is equal to Taylor Swift, Usher and Ludacris:*/

select * from tutorial.billboard_top_100_year_end
where artist IN ('Taylor Swift','Usher','Ludacris');





/*Write SQL query which displays year rank which includes range of 5 and 10*/

select * from tutorial.billboard_top_100_year_end
where "year_rank" BETWEEN 5 AND 10; 




/*Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990*/

select * from tutorial.billboard_top_100_year_end
where year BETWEEN 1985 AND 1990;






/*Write a query to select null values in artist column*/

SELECT * from tutorial.billboard_top_100_year_end
where artist IS NULL;




/*Write a query that shows all of the rows for which song_name is null.*/

select * from tutorial.billboard_top_100_year_end
where song_name IS NULL;




/*Write a query to select all the records having year 2012 and year rank should be less than 10*/

select * from tutorial.billboard_top_100_year_end
where year = 2012 AND year_rank <= 10;





/* Write a query to select year 2012, year rank should be less than 10 and 
all rows with group column containing feat as a value*/

select * from tutorial.billboard_top_100_year_end
where year = 2012
AND year_rank <= 10
AND "group" ilike '%feat%';






/*Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.*/

select * from tutorial.billboard_top_100_year_end
where year_rank <= 10 
AND "group" ilike '%ludacris%';





/*Write a query that surfaces the top-ranked records in 1990, 2000, and 2010*/

select * from tutorial.billboard_top_100_year_end
where year_rank = 1
AND year IN (1990,2000,2010);





/*Write a query that lists all songs from the 1960s with "love" in the title.*/

select * from tutorial.billboard_top_100_year_end
where year BETWEEN 1960 AND 1969 
AND song_name ilike '%love%' 





/*Write a query which give us a rows with year rank 5 also artist name Gotye*/

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 5 OR artist = 'Gotye'
 
 
 
 
 
 /*Write sql query to fetch the rows with year 2013 and group having macklemore or timberlake 
from the table Tutorial Billboard*/


select * from tutorial.billboard_top_100_year_end
where year = 2013
AND ("group" ilike '%macklemore%' OR "group" ilike '%timberlake%');





/*Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.*/

select * from tutorial.billboard_top_100_year_end
where year_rank <= 10
AND("group" ilike '%katy perry%' OR "group" ilike '%bon jovi%');






/*Write a query that returns all songs with titles that contain the 
word "California" in either the 1970s or 1990s.*/

select * from tutorial.billboard_top_100_year_end
where "song_name" ilike '%california%'
AND("year" BETWEEN 1970 AND 1979 OR "year" BETWEEN 1990 AND 1999)








/*Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.*/

select * from tutorial.billboard_top_100_year_end
where "group" ilike '%dr. dre%'
AND(year<2001 OR year>2009)






/*Write a query to select the number of rows with year 2013 and year rank excluding 2 or 3*/


select * from tutorial.billboard_top_100_year_end
where year = 2013 
AND (year_rank Not BETWEEN 2 AND 3)





/** Wriet a query to identify not null values in the artist column in the year 2013*/

select * from tutorial.billboard_top_100_year_end
where year = 2013 
AND("artist" IS NOT NULL)





/*Write a query that returns all rows for songs that were on the 
charts in 2013 and do not contain the letter "a".*/

select * from tutorial.billboard_top_100_year_end
where year = 2013
AND (song_name Not ilike '%a%')







/*ORDER BY Clause*/

/*Write a query to that diaplys result of artist column alphabatically*/

select * from tutorial.billboard_top_100_year_end
ORDER BY artist;







/*Write a query that returns all rows from 2012, ordered by song title from Z to A.*/


select * from tutorial.billboard_top_100_year_end
where year=2012
ORDER BY song_name DESC







SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY year_rank, year DESC
 
 
 
 
 
 /*Write a query that returns all rows from 2010 ordered by rank, with artists 
ordered alphabetically for each song.*/

select * from tutorial.billboard_top_100_year_end
where year = 2010
ORDER BY artist ASC




/**Write a query that shows all rows for which T-Pain was a group member, ordered by rank on 
the charts, from lowest to highest rank (from 100 to 1).*/

select * from tutorial.billboard_top_100_year_end
where "group" ilike '%T-Pain%'
ORDER BY year_rank DESC






/*Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 
2003, or 2013. Order the results by year and rank, and leave a comment on each line 
of the WHERE clause to indicate what that line does*/

select * from tutorial.billboard_top_100_year_end
where year_rank >= 10 AND year_rank <= 20 
AND year IN (1993,2003,2013)
ORDER BY year, year_rank;





/*Write a query that shows all of the entries for Elvis and M.C. Hammer.

Hint: M.C. Hammer is actually on the list under multiple names, so you may need to 
first write a query to figure out exactly how M.C. Hammer is listed. 
You're likely to face similar problems that require some exploration in many real-life scenarios.

*/

select * from tutorial.billboard_top_100_year_end
where "group" IN ('M.C. Hammer','Hammer','Elvis Presley');


 









