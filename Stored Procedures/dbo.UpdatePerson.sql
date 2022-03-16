/* UpdatePerson
-- The procedure for updating person information in dbo.PersonData.
-- ALERT: This procedure does not automatically copy blank information from the previous existing record.
-- This is to allow nullable fields to be set back to null. Recommend setting defaults in form views to
-- prevent unintentional nulling of fields.
*/
CREATE PROCEDURE [dbo].[UpdatePerson]
    -- Required parameters
    @PersonID int, -- The PersonID to update, required
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
    BEGIN TRANSACTION
    DECLARE @thisRowId int = 0;
    -- Find the table row ID for the most recent entry
    SET @thisRowId = (SELECT a.ID FROM dbo.PersonData a where a.PersonID = @PersonID and EndDate is null);

    IF (@thisRowId > 0)
    -- Update EndDate of the current record and save the UserID
        UPDATE dbo.PersonData SET EndDate = GETDATE(), UserModified = @UserID where ID = @thisRowId;
    ELSE
        ROLLBACK TRANSACTION
    -- Create a new record in the dbo.PersonData table
    INSERT INTO dbo.PersonData(PersonID, LastName, FirstName, TypeID, StatusID, GenderID, Birthdate, UserCreated) VALUES (@PersonID, @LastName, @FirstName, @TypeID, @StatusID, @GenderID, @Birthdate, @UserID);        

    COMMIT TRANSACTION
    RETURN SCOPE_IDENTITY();
GO
