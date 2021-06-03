/* drops Database*/
WHILE EXISTS(select NULL from sys.databases where name='GLPI')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'GLPI') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE GLPI
END
GO
/* Creats Database*/
CREATE DATABASE [GLPI];