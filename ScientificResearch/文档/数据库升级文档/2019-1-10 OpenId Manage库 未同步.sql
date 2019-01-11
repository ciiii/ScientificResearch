--2019-1-10 
--openid表

CREATE TABLE 人员OpenId
    (
      编号 INT PRIMARY KEY
             IDENTITY ,
      OpenId NVARCHAR(100) NOT NULL ,
	  DbKey NVARCHAR(100) NOT NULL,
      人员编号 INT NOT NULL
    );
GO

--CREATE NONCLUSTERED COLUMNSTORE INDEX NonClu_Column_OpenId ON dbo.人员OpenId(OpenId);
CREATE NONCLUSTERED INDEX NonClu_Column_OpenId ON dbo.人员OpenId(OpenId);
GO

--tr
CREATE TRIGGER [dbo].[tr_OpenId] ON [dbo].人员OpenId
    FOR INSERT, UPDATE
AS
    DECLARE @message NVARCHAR(1000) = NULL;

    SELECT  @message = CONCAT('OpenId重复:', a.OpenId)
    FROM    dbo.人员OpenId a
            JOIN Inserted b ON a.编号 <> b.编号
                               AND a.OpenId = b.OpenId;
   
    IF ( @message IS NOT NULL )
        BEGIN
           
            THROW 50001,@message,1;
            ROLLBACK;
            RETURN;
        END;
			GO


	--tt
--	DROP TYPE tt_人员OpenId
CREATE TYPE tt_人员OpenId AS TABLE
(
[编号] [INT] NULL ,
[OpenId] [NVARCHAR] (100) NULL ,
[DbKey] [NVARCHAR] (100) NULL ,
[人员编号] [INT] NULL 
);
GO

--sp_xx_增改 
--DROP PROC dbo.sp_人员OpenId_增改
CREATE PROC sp_人员OpenId_增改
    (
      @tt tt_人员OpenId READONLY
    )
AS
    DECLARE @编号 tt_人员OpenId;
    MERGE dbo.人员OpenId t
    USING @tt s
    ON s.OpenId = t.OpenId
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
			   t.DbKey = s.DbKey,
               t.[人员编号] = s.[人员编号]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.OpenId,s.DbKey, s.人员编号 )
    OUTPUT
        Inserted.*
        INTO @编号;
    SELECT  *
    FROM    @编号;
GO
