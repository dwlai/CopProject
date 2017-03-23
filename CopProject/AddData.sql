

EXECUTE dbo.spAddOrganization "Toronto Police Service"

EXECUTE dbo.spAddUser 1, 11098, "Traffic Services", "Police Constable", Zachary, Lobsinger, "zach@zach.com", "hello"
GO

EXECUTE dbo.spAddUser 1, 5383, "52 Division", "Police Constable", Birinder, Gill, "bernie@bernie.com", "hello2"
GO

EXECUTE dbo.spAddPost 11098, 1, "John", "Harry", "Harry@harry.com", 1042304, "Good Job Zach", "2017-03-01 18:00:00", NULL
GO

EXECUTE dbo.spAddPost 5383, 1, "Roger", NULL, NULL, 1324304, "Good Job Bernie", "2017-03-02 19:00:00", NULL
GO