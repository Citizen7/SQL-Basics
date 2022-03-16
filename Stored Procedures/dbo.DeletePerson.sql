/* DeletePerson
-- The procedure to logically delete a person from the dbo.Person database.
*/
CREATE PROCEDURE [dbo].[DeletePerson]
    -- Required parameters
    @PersonID int, -- The PersonID to be deleted, required.
    @UserID int -- The UserID that is deleting the person, required.
AS
SET NOCOUNT ON;
    BEGIN TRANSACTION

    DECLARE @thisId int = 0;
    -- Find the record and confirm it has not already been deleted.
    SET @thisId = (SELECT PersonID from dbo.Person where PersonID = @PersonID and IsDeleted = 0);

    IF (@thisId > 0)
    -- Update IsDeleted to true, DateDeleted to now, and UserDeleted to this user
        UPDATE dbo.Person SET IsDeleted = 1, DateDeleted = GETDATE(), UserDeleted = @UserID WHERE PersonID = @PersonID;
    ELSE
        ROLLBACK TRANSACTION
    
    COMMIT TRANSACTION
    RETURN @thisId;