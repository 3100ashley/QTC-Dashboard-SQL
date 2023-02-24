USE [QTC-Dashboard]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Dashboard].[ApplicationUserType](
	[UserId] BIGINT NOT NULL,
	[UserType] [nvarchar](40) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
    [CreatedDate] [datetime] DEFAULT getutcdate() NOT NULL,
	[UpdatedDate] [datetime] DEFAULT getutcdate() NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserId] PRIMARY KEY CLUSTERED ( [UserId] ASC ) WITH 
 (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
	ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Dashboard].[Application](
	[ApplicationId] BIGINT NOT NULL,
    [ApplicationName] [nvarchar](60) NULL,
	[UserId] BIGINT NOT NULL,
	[APIUrl] BIGINT NOT NULL,
	[UserType] [nvarchar](40) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
    [CreatedDate] [datetime] DEFAULT getutcdate() NOT NULL,
	[UpdatedDate] [datetime] DEFAULT getutcdate() NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ApplicationId] PRIMARY KEY CLUSTERED ( [ApplicationId] ASC ) WITH 
 (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [FK_Application_ApplicationUserType_UserId] FOREIGN KEY ([UserId]) REFERENCES [EFM].[ApplicationUserType] ([UserId]) ON DELETE NO ACTION,
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Dashboard].[Organization](
	[LOBId] BIGINT NOT NULL IDENTITY,
	[ApplicationId] BIGINT NOT NULL,
    [IntegrationPoint] [nvarchar](60) NULL,
	[Address1] [nvarchar](60) NULL,
	[Address2] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](2) NULL,
	[Country] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NOT NULL,
    [Name] [nvarchar](200) NOT NULL,
    [Active] BIT NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
    [CreatedDate] [datetime] DEFAULT getutcdate() NOT NULL,
	[UpdatedDate] [datetime] DEFAULT getutcdate() NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOBId] PRIMARY KEY CLUSTERED ( [LOBId] ASC ) WITH 
 (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [FK_Organization_Application_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [EFM].[Application] ([ApplicationId]) ON DELETE NO ACTION,
) ON [PRIMARY]


