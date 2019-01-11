--2019-1-10 
--openid��

CREATE TABLE ��ԱOpenId
    (
      ��� INT PRIMARY KEY
             IDENTITY ,
      OpenId NVARCHAR(100) NOT NULL ,
	  DbKey NVARCHAR(100) NOT NULL,
      ��Ա��� INT NOT NULL
    );
GO

--CREATE NONCLUSTERED COLUMNSTORE INDEX NonClu_Column_OpenId ON dbo.��ԱOpenId(OpenId);
CREATE NONCLUSTERED INDEX NonClu_Column_OpenId ON dbo.��ԱOpenId(OpenId);
GO

--tr
CREATE TRIGGER [dbo].[tr_OpenId] ON [dbo].��ԱOpenId
    FOR INSERT, UPDATE
AS
    DECLARE @message NVARCHAR(1000) = NULL;

    SELECT  @message = CONCAT('OpenId�ظ�:', a.OpenId)
    FROM    dbo.��ԱOpenId a
            JOIN Inserted b ON a.��� <> b.���
                               AND a.OpenId = b.OpenId;
   
    IF ( @message IS NOT NULL )
        BEGIN
           
            THROW 50001,@message,1;
            ROLLBACK;
            RETURN;
        END;
			GO


	--tt
--	DROP TYPE tt_��ԱOpenId
CREATE TYPE tt_��ԱOpenId AS TABLE
(
[���] [INT] NULL ,
[OpenId] [NVARCHAR] (100) NULL ,
[DbKey] [NVARCHAR] (100) NULL ,
[��Ա���] [INT] NULL 
);
GO

--sp_xx_���� 
--DROP PROC dbo.sp_��ԱOpenId_����
CREATE PROC sp_��ԱOpenId_����
    (
      @tt tt_��ԱOpenId READONLY
    )
AS
    DECLARE @��� tt_��ԱOpenId;
    MERGE dbo.��ԱOpenId t
    USING @tt s
    ON s.OpenId = t.OpenId
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
			   t.DbKey = s.DbKey,
               t.[��Ա���] = s.[��Ա���]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.OpenId,s.DbKey, s.��Ա��� )
    OUTPUT
        Inserted.*
        INTO @���;
    SELECT  *
    FROM    @���;
GO
