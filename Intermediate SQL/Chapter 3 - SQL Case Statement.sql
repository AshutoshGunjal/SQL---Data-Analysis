



/*  SQL Case  */

SELECT * FROM benn.college_football_players*




/*
Write a query that displays the number of players in each state, with FR, SO, JR, and SR 
players in separate columns and another column for the total number of players. 
Order results such that states with the most players come first.
*/

select state,
      COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS "FR Count",
      COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS "SO Count",
      COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS "JR Count",
      COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS "SR Count",
    COUNT(1) AS total_players
from benn.college_football_players
GROUP BY state
ORDER BY total_players DESC;






/* Write a query to show columns having plaer names with year having SR. If year is not SR then
that rown will contain null value */


select player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE NULL 
            END AS "Is a Senior"
from benn.college_football_players






select player_name,
       year,
       CASE
       WHEN year = 'SR' THEN ' yes'
       ELSE 'no'
       END AS "Is a Senior"
from benn.college_football_players







/*Write a query that includes a column that is flagged "yes" when a player is 
from California, and sort the results with those players first.*/

select player_name,
       State,
       CASE WHEN State = 'CA' THEN 'Yes'
       ELSE 'No'
       END AS "Is from California"
from benn.college_football_players
ORDER BY 3






/* Write a query to 

Check to see if weight is greater than 250. 180 is not greater than 250, so move on to the next WHEN/THEN
Check to see if weight is greater than 200. 180 is not greater than 200, so move on to the next WHEN/THEN
Check to see if weight is greater than 175. 180 is greater than 175, so record “175-200” in the weight_group column.

*/



select player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 AND weight <=250 THEN '201-250'
            WHEN weight > 175 AND weight <=200 THEN '176-200'
        ELSE '175 or Under'
        END AS "Weight Group"
from benn.college_football_players







/*Write a query that includes players' names and a column that 
classifies them into four categories based on height.*/

select player_name,
       height,
       CASE WHEN height > 70 THEN 'Over 70'
            WHEN height > 65 AND height <= 70 THEN '65-70'
            ELSE '65 or under' 
            END AS "Height Group"
from benn.college_football_players











select player_name,
        CASE WHEN year = 'FR' AND position = 'WR' 
        THEN 'frosh_wr'
        ELSE NULL 
        END AS sample_case_statement
from benn.college_football_players








/*
Write a query that selects all columns from benn.college_football_players and adds an 
additional column that displays the player's name if that player is a junior or senior.
*/


  
select *,
    CASE WHEN year IN('JR','SR') THEN player_name 
    ELSE NULL
    END AS upperclass_player_name
from benn.college_football_players





/*

Write a query that counts the number of 300lb+ players for each of the following regions:
West Coast (CA, OR, WA), Texas, and Other (Everywhere else).

*/


SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS arbitrary_regional_designation,
            COUNT(1) AS players
  FROM benn.college_football_players
 WHERE weight >= 300
 GROUP BY 1
 
 
 
 
 
 
 /*
Write a query that shows the number of players at schools with names that start 
with A through M, and the number at schools with names starting with N - Z.
*/

select 
      CASE WHEN school_name < 'n' THEN 'A-M'
           WHEN school_name >='n' THEN 'N-Z'
           ELSE NULL 
           END AS "School Name Group",
           COUNT(1) AS players
from benn.college_football_players
GROUP BY 1




