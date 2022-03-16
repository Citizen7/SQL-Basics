CREATE VIEW dbo.vw_PersonDataCurrent AS
(
    SELECT
        ID,
        PersonID,
        LastName,
        FirstName,
        TypeID,
        StatusID,
        GenderID,
        Birthdate        
    FROM dbo.vw_PersonData
    WHERE EndDate IS NULL
)