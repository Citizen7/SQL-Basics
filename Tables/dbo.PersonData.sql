CREATE TABLE dbo.PersonData (
	ID int IDENTITY(1,1) PRIMARY KEY,
	PersonID int NOT NULL,
	LastName nvarchar(75),
	FirstName nvarchar(75),
	TypeID int NOT NULL,
	StatusID int NULL,
    GenderID int NULL,
	Birthdate DateTime NULL,
	StartDate DateTime NOT NULL DEFAULT GETDATE(),
	EndDate DateTime NULL,
	UserCreated int NOT NULL,
	UserModified int NULL
);

-- Foreign Key PersonID to dbo.Person.PersonID
ALTER TABLE dbo.PersonData
ADD CONSTRAINT FK_PersonID
FOREIGN KEY (PersonID) REFERENCES dbo.Person(PersonID);

-- Foreign Key TypeID to dbo.PersonType.ID
ALTER TABLE dbo.PersonData
ADD CONSTRAINT FK_PersonType
FOREIGN KEY (TypeID) REFERENCES dbo.PersonType(ID);

-- Foreign Key StatusID to dbo.PersonStatus.ID
ALTER TABLE dbo.PersonData
ADD CONSTRAINT FK_PersonStatus
FOREIGN KEY (StatusID) REFERENCES dbo.PersonStatus(ID);

-- Foreign Key GenderID to dbo.PersonGender.ID
ALTER TABLE dbo.PersonData
ADD CONSTRAINT FK_PersonGender
FOREIGN KEY (GenderID) REFERENCES dbo.PersonGender(ID);

-- Foreign Key UserID to dbo.Users.UserID
ALTER TABLE dbo.PersonData
ADD CONSTRAINT FK_UserModified
FOREIGN KEY (UserModified) REFERENCES dbo.Users(UserID);

-- Unique constraint to prevent more than one active record per PersonID at a time
ALTER TABLE dbo.PersonData
ADD CONSTRAINT UC_EndDate UNIQUE (PersonID, EndDate);
