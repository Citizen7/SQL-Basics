CREATE VIEW dbo.vw_Person AS
(
	SELECT 
		PersonID,
		DateCreated,
		UserCreated,
		IsDeleted,
		DateDeleted,
		UserDeleted
	FROM dbo.Person
);