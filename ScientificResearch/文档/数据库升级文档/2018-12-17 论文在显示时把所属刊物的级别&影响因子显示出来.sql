
ALTER VIEW [dbo].[v1_�ɹ�����_�б�]
AS
    SELECT  a.��� ,
            a.���ı��� ,
            a.����Online���� ,
            a.������ʽ�������� ,
            ISNULL(b.����, b.Ӣ�Ŀ���) AS �������� ,
			b.PMID,b.DOI,b.UT,
			b.�ڿ�ϵ��,b.JCR����,b.Ӱ������,b.�������ӷ�ֵ,
			a.�����˱��,
            dbo.fn_�ɹ�����(1, a.���, '��һ����') AS ��һ����,a.ͨѶ����,a.��������
    FROM    dbo.�ɹ����� a
            LEFT JOIN dbo.�ڿ� b ON a.������ = b.���;

GO


EXEC dbo.sp_Rebuild;

GO
