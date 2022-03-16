/*
-- This table is a simple proof of concept in order to provide the foreign key for UserID in the
-- dbo.PersonData table. In an actual live scenario, the User table should be handled in a decoupled
-- User/UserData structure if keeping a history of user table updates is necessary.
-- PASSWORDS SHOULD NEVER BE STORED IN PLAIN TEXT IN ANY ACTUAL ENVIRONMENT. THIS IS MERELY A PROOF-OF-CONCEPT.
*/
CREATE TABLE dbo.Users (
	UserID int identity(1000,1) PRIMARY KEY,
	LoginName nvarchar(255) NOT NULL,
	Password nvarchar(500) NOT NULL,
	EmailAddress nvarchar(500) NULL,
);

ALTER TABLE dbo.Users
ADD UNIQUE (LoginName, EmailAddress);