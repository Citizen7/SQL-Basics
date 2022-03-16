/* PersonReport
-- This report gets the current person(s) from dbo.Person/PersonData that meet the filter criteria.
*/
CREATE PROCEDURE [dbo].[PersonReport]
    @LastName nvarchar(75) = NULL, -- The last name filter
    @FirstName nvarchar(75) = NULL, -- The first name filter
    @TypeIDs nvarchar(50) = NULL, -- The type(s) to filter by, in CSV
    @StatusIDs nvarchar(50) = NULL, -- The status(es) to filter by, in CSV
    @GenderIDs nvarchar(50) = NULL, -- The gender(s) to filter by, in CSV
    @MinBirthdate DateTime = NULL, -- The minimum birthdate filter
    @MaxBirthdate DateTime = NULL, -- The maximum birthdate filter
    @UserIDs nvarchar(50) = NULL -- The UserID(s) to filter by, in CSV
AS
SET NOCOUNT ON;
    SELECT
        a.PersonID
        ,a.LastName
        ,a.FirstName
        ,(a.FirstName + ' ' + a.LastName) as FullName
        ,a.TypeID
        ,b.[Name] as PersonType
        ,a.StatusID
        ,c.[Name] as PersonStatus
        ,a.GenderID
        ,d.[Name] as PersonGender
        ,a.Birthdate
        ,x.UserCreated
        ,e.LoginName as UserCreated
    FROM        
        -- the view that shows the current valid data for each person entry 
        dbo.vw_PersonDataCurrent a
        -- the table with the UserCreated data for Person
        INNER JOIN dbo.vw_Person x
        on a.PersonID = x.PersonID        
        -- the table that defines person types
        LEFT JOIN dbo.PersonType b
        ON a.TypeID = b.ID
        -- the table that defines person statuses
        LEFT JOIN dbo.PersonStatus c
        ON a.StatusID = c.ID
        -- the table that defines person genders
        LEFT JOIN dbo.PersonGender d
        ON a.GenderID = d.ID
        INNER JOIN dbo.Users e
        on x.UserCreated = e.UserID
    WHERE
        -- Filter for last name
        ((@LastName IS NULL) OR (a.LastName LIKE '%' + @LastName + '%'))
        -- Filter for first name
        and ((@FirstName IS NULL) OR (a.FirstName LIKE '%' + @FirstName + '%'))
        -- Filter for type
        and ((@TypeIDs IS NULL) OR (a.TypeID IN (SELECT Item from dbo.Split(@TypeIDs, ','))))
        -- Filter for status
        and ((@StatusIDs IS NULL) OR (a.StatusID IN (SELECT Item from dbo.Split(@StatusIDs, ','))))
        -- Filter for gender
        and ((@GenderIDs IS NULL) OR (a.GenderID IN (SELECT Item from dbo.Split(@GenderIDs, ','))))
        -- Filter by bounded birthdate
        and ((@MinBirthdate IS NULL) OR (a.Birthdate >= @MinBirthdate))
        and ((@MaxBirthdate IS NULL) OR (a.Birthdate <= @MaxBirthdate))
        -- Filter for UserID
        and ((@UserIDs IS NULL) OR (x.UserCreated IN (SELECT Item from dbo.Split(@UserIDs, ','))))
    ORDER BY
        a.LastName,
        a.FirstName
GO        