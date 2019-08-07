USE ScientificResearch_Manage;
GO

CREATE TABLE [dbo].[��ѧѧԱOpenId]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [OpenId] [NVARCHAR](100) NOT NULL ,
      [DbKey] [NVARCHAR](100) NOT NULL ,
      [��ѧѧԱ���] [INT] NOT NULL ,
      CONSTRAINT [PK_��ѧѧԱOpenId] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  UserDefinedTableType [dbo].[tt_��ѧѧԱOpenId]    Script Date: 2019/8/7 14:02:54 ******/
CREATE TYPE [dbo].[tt_��ѧѧԱOpenId] AS TABLE(
	[���] [INT] NULL,
	[OpenId] [NVARCHAR](100) NULL,
	[DbKey] [NVARCHAR](100) NULL,
	[��ѧѧԱ���] [INT] NULL
)
GO


CREATE PROC [dbo].[sp_��ѧѧԱOpenId_����]
    (
      @tt tt_��ѧѧԱOpenId READONLY
    )
AS
    DECLARE @output tt_��ѧѧԱOpenId;
    MERGE dbo.��ѧѧԱOpenId t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
               t.[DbKey] = s.[DbKey] ,
               t.[��ѧѧԱ���] = s.[��ѧѧԱ���]
    WHEN NOT MATCHED THEN
        INSERT ( OpenId, DbKey, ��ѧѧԱ��� )
        VALUES ( s.[OpenId] ,
                 s.[DbKey] ,
                 s.[��ѧѧԱ���]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;

GO



