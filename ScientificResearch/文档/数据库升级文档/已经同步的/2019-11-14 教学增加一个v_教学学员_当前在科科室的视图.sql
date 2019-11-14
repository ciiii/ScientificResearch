CREATE VIEW v_教学学员_当前在科科室 AS 
SELECT  a.* ,
        b.教学本院科室编号 AS 当前在科的科室编号
FROM    dbo.v_教学学员 a
        LEFT JOIN 教学轮转 b ON a.编号 = b.学员编号
                            AND b.实际出科日期 IS NULL
                            AND b.实际出科日期 IS NOT NULL;