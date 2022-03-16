CREATE VIEW dbo.vw_PersonData AS
(
    SELECT
        b.ID,
        b.PersonID,
        b.LastName,
        b.FirstName,
        b.TypeID,
        b.StatusID,
        b.GenderID,
        b.Birthdate,
        b.StartDate,
        b.EndDate,
        b.UserCreated,
        b.UserModified
    FROM
        dbo.vw_PersonCurrent a
        inner join dbo.PersonData b
        on a.PersonID = b.PersonID
)