/*Author : Yann & Sven
  Date   : 24.01.2021
  Project: F1
*/
USE F1 ;
GO

-- tables
SELECT * FROM people;
SELECT * FROM addresses;
SELECT * FROM sponsors;
SELECT * FROM teams;
SELECT * FROM cars;
SELECT * FROM circuits;
SELECT * FROM people_race_circuits;
SELECT * FROM headquarters;
SELECT * FROM roles;
SELECT * FROM results;
SELECT * FROM sponsors_finance_teams;


-- views
SELECT * FROM V_people;
SELECT * FROM V_addresses;
SELECT * FROM V_sponsors;
SELECT * FROM V_teams;
SELECT * FROM V_cars;
SELECT * FROM V_circuits;
SELECT * FROM V_people_race_circuits;
SELECT * FROM V_headquarters;
SELECT * FROM V_roles;
SELECT * FROM V_results;
SELECT * FROM V_sponsors_finance_teams;
