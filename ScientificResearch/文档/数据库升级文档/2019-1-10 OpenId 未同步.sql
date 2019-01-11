--2019-1-10 
--openid表

CREATE TABLE OpenId
    (
      编号 INT PRIMARY KEY
             IDENTITY ,
      OpenId NVARCHAR(50) NOT NULL ,
      人员编号 INT NOT NULL
    );
GO

--tr
	CREATE TRIGGER [dbo].[tr_OpenId] ON [dbo].OpenId
		FOR INSERT, UPDATE
	AS
		DECLARE @message NVARCHAR(1000) = NULL;

		SELECT  @message = CONCAT('OpenId重复:', a.OpenId)
		FROM    dbo.OpenId a
				JOIN Inserted b ON a.编号 <> b.编号
								   AND a.OpenId = b.OpenId;
   
		IF ( @message IS NOT NULL )
			BEGIN
           
				THROW 50001,@message,1;
				ROLLBACK;
				RETURN;
			END;GO


	--tt
CREATE TYPE tt_OpenId AS TABLE
(
[编号] [INT] NULL ,
[OpenId] [NVARCHAR] (50) NULL ,
[人员编号] [INT] NULL 
);
GO


--sp_xx_增改
CREATE PROC sp_OpenId_增改
    (
      @tt tt_OpenId READONLY
    )
AS
    DECLARE @编号 tt_OpenId;
    MERGE dbo.OpenId t
    USING @tt s
    ON s.OpenId = t.OpenId
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
               t.[人员编号] = s.[人员编号]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.OpenId, s.人员编号 )
    OUTPUT
        Inserted.*
        INTO @编号;
        SELECT  *
        FROM    @编号;
GO
