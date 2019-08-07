USE ScientificResearch_Manage;
GO

CREATE TABLE [dbo].[教学学员OpenId]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [OpenId] [NVARCHAR](100) NOT NULL ,
      [DbKey] [NVARCHAR](100) NOT NULL ,
      [教学学员编号] [INT] NOT NULL ,
      CONSTRAINT [PK_教学学员OpenId] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  UserDefinedTableType [dbo].[tt_教学学员OpenId]    Script Date: 2019/8/7 14:02:54 ******/
CREATE TYPE [dbo].[tt_教学学员OpenId] AS TABLE(
	[编号] [INT] NULL,
	[OpenId] [NVARCHAR](100) NULL,
	[DbKey] [NVARCHAR](100) NULL,
	[教学学员编号] [INT] NULL
)
GO


CREATE PROC [dbo].[sp_教学学员OpenId_增改]
    (
      @tt tt_教学学员OpenId READONLY
    )
AS
    DECLARE @output tt_教学学员OpenId;
    MERGE dbo.教学学员OpenId t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
               t.[DbKey] = s.[DbKey] ,
               t.[教学学员编号] = s.[教学学员编号]
    WHEN NOT MATCHED THEN
        INSERT ( OpenId, DbKey, 教学学员编号 )
        VALUES ( s.[OpenId] ,
                 s.[DbKey] ,
                 s.[教学学员编号]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;

GO



