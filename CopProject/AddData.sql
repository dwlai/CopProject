USE CopProjectDB
GO

EXECUTE dbo.spAddOrganization "Toronto Police Service"

EXECUTE dbo.spAddUser 1, 11098, Zachary, Lobsinger
GO

EXECUTE dbo.spAddUser 1, 5383, Bernie, Gill
GO

EXECUTE dbo.spAddPost 11098, 1, "John", "Harry", "Harry@harry.com", 1042304, "Good Job Zach", "2017-03-01 18:00:00", NULL
GO

EXECUTE dbo.spAddPost 5383, 1, "Roger", NULL, NULL, 1324304, "Good Job Bernie", "2017-03-02 19:00:00", NULL
GO