--2019-1-10 
--openid��

CREATE TABLE OpenId
    (
      ��� INT PRIMARY KEY
             IDENTITY ,
      OpenId NVARCHAR(50) NOT NULL ,
      ��Ա��� INT NOT NULL
    );
GO

--tr
	CREATE TRIGGER [dbo].[tr_OpenId] ON [dbo].OpenId
		FOR INSERT, UPDATE
	AS
		DECLARE @message NVARCHAR(1000) = NULL;

		SELECT  @message = CONCAT('OpenId�ظ�:', a.OpenId)
		FROM    dbo.OpenId a
				JOIN Inserted b ON a.��� <> b.���
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
[���] [INT] NULL ,
[OpenId] [NVARCHAR] (50) NULL ,
[��Ա���] [INT] NULL 
);
GO


--sp_xx_����
CREATE PROC sp_OpenId_����
    (
      @tt tt_OpenId READONLY
    )
AS
    DECLARE @��� tt_OpenId;
    MERGE dbo.OpenId t
    USING @tt s
    ON s.OpenId = t.OpenId
    WHEN MATCHED THEN
        UPDATE SET
               t.[OpenId] = s.[OpenId] ,
               t.[��Ա���] = s.[��Ա���]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.OpenId, s.��Ա��� )
    OUTPUT
        Inserted.*
        INTO @���;
        SELECT  *
        FROM    @���;
GO
