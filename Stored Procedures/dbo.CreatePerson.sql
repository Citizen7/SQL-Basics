/* CreatePerson
-- The procedure for creating a new person. A record will be generated in
-- dbo.Person and a corresponding record in dbo.PersonData. This data structre allows the
-- person data to be changed, keeping a record of what changes were made, who made them, 
-- and when, while keeping a stable PersonID.
*/
CREATE PROCEDURE [dbo].[CreatePerson]
    -- Required parameters
    @LastName nvarchar(75), -- The last name of the person, required
    @FirstName nvarchar(75), -- The first name of the person, required
    @TypeID int, -- The dbo.PersonType.ID of the person, required
    @UserID int, -- The current UserID, required
    -- Non-required parameters
    @StatusID int NULL, -- The dbo.PersonStatus.ID of the person
    @GenderID int NULL, -- The dbo.PersonGender.ID of the person
    @Birthdate DateTime NULL -- The birthdate of the person
    
AS
SET NOCOUNT ON;
    DECLARE @id int = 0;
    BEGIN TRANSACTION

    -- Create a new dbo.Person record to get the PersonID.
    INSERT INTO dbo.Person(UserCreated) VALUES (@UserID);
    SELECT @id = (SELECT SCOPE_IDENTITY());

    IF (@id > 0)
    -- Create a new dbo.PersonData entry using the PersonID
        INSERT INTO dbo.PersonData(PersonID, LastName, FirstName, TypeID, StatusID, GenderID, Birthdate, UserCreated) 
        VALUES (@id, @LastName, @FirstName, @TypeID, @StatusID, @GenderID, @Birthdate, @UserID);
    ELSE
        ROLLBACK TRANSACTION

    COMMIT TRANSACTION
    RETURN @id;
GO
