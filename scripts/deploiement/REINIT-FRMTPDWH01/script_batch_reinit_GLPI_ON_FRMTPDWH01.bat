@echo off
SET database=GLPI
set mypath=%~dp0
echo ==================================================================
echo       			Starting REINIT ON FRMTPDWH01 FOR %database%....
echo		 		Author:  Emmanuel Pellegrin
echo 				Copyright ORCHESTRA 2015
echo ==================================================================		
echo

SET  server=FRMTPDWH01
SET  login=sa
SET  password=P@ssw0rd

:: parameters for DWH_OP
SET  dataDwhFilepath=L:\SQLData
SET  logDwhFilePath=M:\SQLLog
SET indexDwhFilepath=M:\SQLIndex


echo ==================================================================
echo starting to drop DB %database% ........
echo ==================================================================

REM sqlcmd -S %server% -U %login% -P %password%  -Q "ALTER DATABASE %database% SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE %database%;"
REM  if not errorlevel 1 goto next1
REM echo == An error occurred  errorlevel 
REM goto exit

:next1
echo ==================================================================
echo starting  to create DB %database% ........
echo ==================================================================
%mypath%\script_create_Database.bat %database% %server% %login% %password% %dataDwhFilepath% %indexDwhFilepath% %logDwhFilePath%
if not errorlevel 1 goto next2
echo == An error occurred  %errorlevel% 
goto exit
echo
echo ==================================================================
echo 						End of  %database% Creation
echo ==================================================================

:next2




:exit
