USE [FUBE]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 12/22/2017 4:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/22/2017 4:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [int] NOT NULL,
	[TubeID] [int] NOT NULL,
	[Quantity] [numeric](3, 0) NOT NULL,
	[SizeMultiplier] [numeric](3, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/22/2017 4:20:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ShipDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tubes]    Script Date: 12/22/2017 4:20:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tubes](
	[TubeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Image] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Tubes] PRIMARY KEY CLUSTERED 
(
	[TubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/22/2017 4:20:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 

INSERT [dbo].[Ingredients] ([IngredientID], [Name], [Price]) VALUES (1, N'Apple', CAST(1.00 AS Numeric(8, 2)))
INSERT [dbo].[Ingredients] ([IngredientID], [Name], [Price]) VALUES (2, N'Banana', CAST(2.00 AS Numeric(8, 2)))
INSERT [dbo].[Ingredients] ([IngredientID], [Name], [Price]) VALUES (3, N'Watermelon', CAST(3.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
SET IDENTITY_INSERT [dbo].[Tubes] ON 

INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (12, N'Cereal 1', CAST(4.00 AS Numeric(8, 2)), N'cerealtube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (13, N'Cereal 2', CAST(5.00 AS Numeric(8, 2)), N'cerealtube2.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (14, N'Fruit', CAST(6.00 AS Numeric(8, 2)), N'fruittube_edit.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (18, N'Lasagna', CAST(5.00 AS Numeric(8, 2)), N'lasagnatube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (19, N'Noodle', CAST(4.00 AS Numeric(8, 2)), N'noodletube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (20, N'Pizza Burger', CAST(5.00 AS Numeric(8, 2)), N'pizzburgertube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (21, N'Sea Food', CAST(6.00 AS Numeric(8, 2)), N'seafoodtube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (22, N'Steak', CAST(5.00 AS Numeric(8, 2)), N'steaktube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (24, N'Sushi', CAST(4.00 AS Numeric(8, 2)), N'sushitube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (25, N'Taco', CAST(5.00 AS Numeric(8, 2)), N'tacotube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (26, N'Mix', CAST(6.00 AS Numeric(8, 2)), N'tube-food-4.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (27, N'Vegan 1', CAST(5.00 AS Numeric(8, 2)), N'vegantube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (28, N'Vegan 2', CAST(4.00 AS Numeric(8, 2)), N'vegantube2.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (29, N'Vegan 3', CAST(5.00 AS Numeric(8, 2)), N'vegantube3.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (30, N'Vegan 4', CAST(6.00 AS Numeric(8, 2)), N'vegantube4.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (31, N'Vege', CAST(5.00 AS Numeric(8, 2)), N'vegetube.jpg', N'x')
INSERT [dbo].[Tubes] ([TubeID], [Name], [Price], [Image], [Description]) VALUES (32, N'Wings', CAST(4.00 AS Numeric(8, 2)), N'wingtube.jpg', N'x')
SET IDENTITY_INSERT [dbo].[Tubes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [IsAdmin], [FirstName], [LastName], [Address]) VALUES (1, N'Abby', N'Pass', 1, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [IsAdmin], [FirstName], [LastName], [Address]) VALUES (2, N'NotAbby', N'Pass', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders1]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Tubes] FOREIGN KEY([TubeID])
REFERENCES [dbo].[Tubes] ([TubeID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Tubes]
GO
