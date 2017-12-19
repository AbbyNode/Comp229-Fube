USE [FUBE]
GO

/****** Object:  Table [dbo].[Ingredients]    Script Date: 12/19/2017 2:34:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

DROP TABLE [dbo].[Ingredients] GO

CREATE TABLE [dbo].[Ingredients](
	[IngredientID] [numeric](8, 0) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [float] NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

