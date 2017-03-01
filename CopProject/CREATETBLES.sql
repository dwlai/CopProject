USE CopProjectDB
GO


IF OBJECT_ID('dbo.Posts', 'U') IS NOT NULL
DROP TABLE dbo.Posts

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
DROP TABLE dbo.Users

IF OBJECT_ID('dbo.Organizations', 'U') IS NOT NULL
DROP TABLE dbo.Organizations

IF OBJECT_ID('dbo.spGetAllOrganizations') IS NOT NULL
DROP PROCEDURE dbo.spGetAllOrganizations

IF OBJECT_ID('dbo.spGetAllUsers') IS NOT NULL
DROP PROCEDURE dbo.spGetAllUsers

IF OBJECT_ID('dbo.spGetAllPosts') IS NOT NULL
DROP PROCEDURE dbo.spGetAllPosts

IF OBJECT_ID('dbo.spAddOrganization') IS NOT NULL
DROP PROCEDURE dbo.spAddOrganization

IF OBJECT_ID('dbo.spAddUser') IS NOT NULL
DROP PROCEDURE dbo.spAddUser

IF OBJECT_ID('dbo.spAddPost') IS NOT NULL
DROP PROCEDURE dbo.spAddPost


CREATE TABLE dbo.Organizations(
OrgID int PRIMARY KEY NOT NULL IDENTITY(1,1),
OrgName varchar(50),
CONSTRAINT UC_OrgName UNIQUE(OrgName))
GO

CREATE TABLE dbo.Users(
UserID int PRIMARY KEY NOT NULL IDENTITY(1,1),
OrgID int NOT NULL,
CONSTRAINT UC_OrgID_Badge UNIQUE (OrgID, Badge),
CONSTRAINT FK_Users_Organizations FOREIGN KEY (OrgID)
	REFERENCES dbo.Organizations (OrgID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
Badge int NOT NULL,
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL)
GO

CREATE TABLE dbo.Posts(
PostID int PRIMARY KEY NOT NULL IDENTITY(1,1),
Userid int NOT NULL,
ReportNumber varchar(20) NOT NULL,
CONSTRAINT FK_Posts_Users FOREIGN KEY (UserID)
	REFERENCES dbo.Users (UserID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
Post varchar(5000),
Date smalldatetime NOT NULL)
GO

CREATE PROCEDURE dbo.spGetAllOrganizations
AS
SELECT * FROM dbo.Organizations
GO

CREATE PROCEDURE dbo.spGetAllUsers
AS
SELECT * FROM dbo.Users
GO

CREATE PROCEDURE dbo.spGetAllPosts
AS
SELECT * FROM dbo.Posts
GO

CREATE PROCEDURE dbo.spAddOrganization

	@OrgName varchar(50)

	AS

	INSERT INTO dbo.Organizations(OrgName)
	VALUES (@OrgName)
GO

CREATE PROCEDURE dbo.spAddUser

	@OrgID int,
	@Badge int,
	@FirstName varchar(25),
	@LastName varchar(25)

	AS

	INSERT INTO dbo.Users (OrgID, Badge, FirstName, LastName)
	VALUES(@OrgID, @Badge, @FirstName, @LastName)

GO

CREATE PROCEDURE dbo.spAddPost
	@Badge int,
	@OrgID int,
	@ReportNumber varchar(20),
	@Post varchar(5000),
	@Date smalldatetime,
	@UserId int

	AS

	SET @UserId=(SELECT UserID from dbo.Users WHERE Badge = @Badge AND  OrgId = @OrgID)
	INSERT INTO dbo.Posts (UserId, ReportNumber, Post, Date)
	VALUES (@UserId, @ReportNumber, @Post, @Date)

GO


