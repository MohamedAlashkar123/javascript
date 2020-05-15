USE [TestVOne]
GO

/****** Object:  Table [dbo].[Questions_Exam]    Script Date: 5/7/2020 4:43:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Questions_Exam](
	[Q_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[st_Answer] [nvarchar](100) NULL,
	[ques_grade] [bit] NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[exam_id] ASC,
--	[Q_id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Questions_Exam]  WITH CHECK ADD FOREIGN KEY([Q_id])
REFERENCES [dbo].[Questoins] ([Q_id])
GO

ALTER TABLE [dbo].[Questions_Exam]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO


