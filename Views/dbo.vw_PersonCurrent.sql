CREATE VIEW dbo.vw_PersonCurrent AS
(
	SELECT
		PersonID,
		DateCreated,
		UserCreated
	FROM dbo.vw_Person
	WHERE IsDeleted = 0
		AND DateDeleted IS NULL
);