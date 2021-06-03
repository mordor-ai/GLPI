@echo off
SET database=GLPI
SET server=DWH-TEST01
SET login=sa
SET password=P@ssw0rd
:: parameters for DWH_OP
SET dataDwhFilepath=H:\SQLData
SET logDwhFilePath=H:\SQLLog
SET indexDwhFilepath=H:\SQLIndex

set mypath=%~dp0
echo ==================================================================
echo       			Starting REINIT ON %server% FOR %database%....
echo		 		Author:  Emmanuel Pellegrin
echo 				Copyright ORCHESTRA 2016
echo ==================================================================		
echo

echo ==================================================================
echo starting to drop DB %database% ........
echo ==================================================================

REM REM  if not errorlevel 1 goto next1
REM echo == An error occurred  errorlevel 
REM goto exit

:next1
%mypath%\..\script_batch_reinit_Database.bat  %database% %server% %login% %password% %dataDwhFilepath% %indexDwhFilepath% %logDwhFilePath%
if not errorlevel 1 goto next2
echo
echo 
echo == An error occurred  %errorlevel% =========
goto exit
:next2
echo
echo ==================================================================
echo 						End of REINIT of  %database% ON %server%
echo ==================================================================
:exit