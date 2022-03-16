CREATE TABLE dbo.Person (
	PersonID int IDENTITY(1000,1) PRIMARY KEY,
	DateCreated DateTime NOT NULL DEFAULT getdate(),
	UserCreated int NOT NULL,
	IsDeleted bit NOT NULL DEFAULT 0,
	DateDeleted DateTime NULL,
	UserDeleted int NULL,
);

ALTER TABLE dbo.Person
ADD CONSTRAINT FK_UserCreated
FOREIGN KEY (UserCreated) REFERENCES dbo.Users(UserID);

ALTER TABLE Person
ADD CONSTRAINT FK_UserDeleted
FOREIGN KEY (UserDeleted) REFERENCES dbo.Users(UserID);