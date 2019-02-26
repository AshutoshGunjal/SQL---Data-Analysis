/*
Write a query to figure out which conference has highest average weight from tables 
benn.college_football_players and benn.college_football_teams
*/

select teams.conference AS "Coference",
       AVG(players.weight) AS "Average Weight"
from benn.college_football_players players
JOIN benn.college_football_teams teams
      ON teams.school_name = players.school_name
GROUP BY teams.conference
ORDER BY AVG(players.weight) DESC;




/*
Write a query that selects the school name, player name, position, and weight for 
every player in Georgia, ordered by weight (heaviest to lightest). Be sure to make an 
alias for the table, and to reference all column names in relation to the alias.
*/

select players.school_name,
       players.player_name,
       players.position,
       players.weight
from benn.college_football_players players
where players.state = 'GA'    
ORDER BY weight DESC;





/* Write a query to figure out which conference has highest average weight.
Given that information is in two separate tables. how do you do that? A join!
*/

select teams.conference AS "Conference",
       AVG(players.weight) AS "Average Weight"
from benn.college_football_players players
JOIN benn.college_football_teams teams
  ON teams.school_name = players.school_name
GROUP BY teams.conference
ORDER BY AVG(players.weight) DESC;





/*
Write a query that selects the school name, player name, position, and weight for every player 
in Georgia, ordered by weight (heaviest to lightest). Be sure to make an alias for the table, 
and to reference all column names in relation to the alias.
*/

SELECT
    players.school_name,
    players.player_name,
    players.position,
    players.weight
from benn.college_football_players players
where players.state = 'GA'
order by players.weight DESC;
    
    





/*
Write a query that displays player names, school names and conferences for schools in 
the "FBS (Division I-A Teams)" division.
*/

SELECT players.player_name,
       players.school_name,
       teams.conference
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 WHERE teams.division = 'FBS (Division I-A Teams)';
 
 
 
 
 
 
 /*Outer Joins*/

select * from tutorial.crunchbase_companies;




/*
Write a query that performs an inner join between the 
tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table, 
but instead of listing individual rows, count the number of non-null rows in each table.
*/


select count(companies.permalink) as companies_rowcount,
       count(acquisitions.company_permalink) as acquisition_rowcount
from tutorial.crunchbase_companies companies
JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink;
    
    


/* LEFT JOIN
Modify the query above to be a LEFT JOIN. Note the difference in results.
*/


SELECT COUNT(companies.permalink) AS companies_rowcount,
       COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink;




/*
Count the number of unique companies (don't double-count companies) and unique acquired 
companies by state. Do not include results for which there is no state data, and order by the 
number of acquired companies from highest to lowest.
*/


SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS unique_companies,
       COUNT(DISTINCT acquisitions.company_permalink) AS unique_companies_acquired
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 WHERE companies.state_code IS NOT NULL
 GROUP BY 1
 ORDER BY 3 DESC;
 
 
 /*RIGHT JOIN*/
 /*
Rewrite the previous practice query in which you counted total and acquired companies 
by state, but with a RIGHT JOIN instead of a LEFT JOIN. The goal is to produce the exact same results.
*/


SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS unique_companies,
       COUNT(DISTINCT acquisitions.company_permalink) AS acquired_companies
  FROM tutorial.crunchbase_acquisitions acquisitions
 RIGHT JOIN tutorial.crunchbase_companies companies
    ON companies.permalink = acquisitions.company_permalink
 WHERE companies.state_code IS NOT NULL
 GROUP BY 1
 ORDER BY 3 DESC;
 
 
 
 /*
Write a query that shows a company's name, "status" (found in the Companies table), 
and the number of unique investors in that company. Order by the number of investors from most 
to fewest. Limit to only companies in the state of New York.
*/


SELECT companies.name AS company_name,
       companies.status,
       COUNT(DISTINCT investments.investor_name) AS unqiue_investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink
 WHERE companies.state_code = 'NY'
 GROUP BY 1,2
 ORDER BY 3 DESC;
 
 
 
 
 /*
Write a query that lists investors based on the number of companies in which they are invested. 
Include a row for companies with no investor, and order from most companies to least.
*/


SELECT CASE WHEN investments.investor_name IS NULL THEN 'No Investors'
            ELSE investments.investor_name END AS investor,
       COUNT(DISTINCT companies.permalink) AS companies_invested_in
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1
 ORDER BY 2 DESC;
 
 
 
 /*
Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 
using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above.
*/


 SELECT COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments.company_permalink IS NULL
                      THEN companies.permalink ELSE NULL END) AS companies_only,
           COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments.company_permalink IS NOT NULL
                      THEN companies.permalink ELSE NULL END) AS both_tables,
           COUNT(CASE WHEN companies.permalink IS NULL AND investments.company_permalink IS NOT NULL
                      THEN investments.company_permalink ELSE NULL END) AS investments_only
      FROM tutorial.crunchbase_companies companies
      FULL JOIN tutorial.crunchbase_investments_part1 investments
        ON companies.permalink = investments.company_permalink;
 
 
 
 
