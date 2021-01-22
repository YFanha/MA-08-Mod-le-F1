/*Author 		: Yann Fanha, Sven Volery
  Date   		: 22/01/2021
  Project		: F1
  Description	: Create Views of the database F1
*/

USE F1;

--Create the views

GO

CREATE VIEW [dbo].[V_addresses]
AS
SELECT count(*) AS [addresses]
FROM [dbo].[addresses]

GO

CREATE VIEW [dbo].[V_cars]
AS
SELECT count(*) AS [cars]
FROM [dbo].[cars]

GO

CREATE VIEW [dbo].[V_circuits]
AS
SELECT count(*) AS [circuits]
FROM [dbo].[circuits]

GO

CREATE VIEW [dbo].[V_headquarters]
AS
SELECT count(*) AS [headquarters]
FROM [dbo].[headquarters]

GO

CREATE VIEW [dbo].[V_people]
AS
SELECT count(*) AS [people]
FROM [dbo].[people]

GO

CREATE VIEW [dbo].[V_people_race_circuits]
AS
SELECT count(*) AS [people_race_circuits]
FROM [dbo].[people_race_circuits]

GO

CREATE VIEW [dbo].[V_results]
AS
SELECT count(*) AS [results]
FROM [dbo].[results]

GO

CREATE VIEW [dbo].[V_roles]
AS
SELECT count(*) AS [roles]
FROM [dbo].[roles]

GO

CREATE VIEW [dbo].[V_sponsors]
AS
SELECT count(*) AS [sponsors]
FROM [dbo].[sponsors]

GO

CREATE VIEW [dbo].[V_sponsors_finance_teams]
AS
SELECT count(*) AS [sponsors_finance_teams]
FROM [dbo].[sponsors_finance_teams]

GO

CREATE VIEW [dbo].[V_teams]
AS
SELECT count(*) AS [teams]
FROM [dbo].[teams]

GO