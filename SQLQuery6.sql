USE [dbsql]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/2/2020 9:21:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Exam](
	[exam_id] [int] NOT NULL,
	[exam_date] [datetime] NULL,
	[grade] [int] NULL,
	[st_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exam] ADD  DEFAULT (getdate()) FOR [exam_date]
GO

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[student] ([st_id])
GO


