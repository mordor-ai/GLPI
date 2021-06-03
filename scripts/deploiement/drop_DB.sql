/****************************************************/
/*		Created by: Emmanuel Pellegrin              */
/*		Date: 27/11/2015  12:57:30					*/
/*       SQLCMD script								*/
/*		Copyrigths ORCHESTRA 2015					*/
/****************************************************/
-- :Setvar dataFilepath  'C:\work\DATA\'
-- :Setvar logFilePath  'C:\work\LOG\'
DECLARE @DbName sysname;
--	PRINT datafilepath : $(dataFilepath)
 -- SET @DataFilePath = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\'
  SET @DbName ="$(dbName)";


/* drops Database*/

WHILE EXISTS(select NULL from sys.databases where name=@DbName)
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(@DbName) AND SPId <> @@SPId
    EXEC(@SQL);
    EXEC ('DROP DATABASE ['+@dbName+']');
    
END
GO

