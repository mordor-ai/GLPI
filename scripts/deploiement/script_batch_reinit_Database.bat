@echo off

echo ==================================================================
echo       			generic script batch reinit for ODS database
echo		 		Author:  Emmanuel Pellegrin
echo 				Copyright ORCHESTRA 2016
echo ==================================================================		
echo

set mypath=%~dp0

:: Fetch database
::http://stackoverflow.com/questions/5883500/call-batch-file-from-another-passing-parameters
set "database=%~1"
goto :databaseCheck
:databasePrompt
set /p "database=Enter database name : "
:databaseCheck
if "%database%"=="" goto :databasePrompt


:: Fetch server
set "server=%~2"
goto :serverCheck
:serverPrompt
SET /P server=[Enter the database instance ( server name)]
:serverCheck
if "%server%"=="" goto :serverPrompt

:: Fetch login    
set "login=%~3"
goto :loginCheck
:loginPrompt
SET /P login=[enter the database login]
:loginCheck
if "%login%"=="" goto :loginPrompt


:: Fetch password
set "password=%~4"
goto :passwordCheck
:passwordPrompt
SET /P password=[enter the database password]
:passwordCheck
if "%password%"=="" goto :passwordPrompt


:: Fetch dataDwhFilepath
set "dataDwhFilepath=%~5"
goto :dataDwhFilepathCheck
:dataDwhFilepathPrompt
SET /P dataDwhFilepath=[enter the database file repository]
:dataDwhFilepathCheck
if "%dataDwhFilepath%"=="" goto :dataDwhFilepathPrompt



:: Fetch indexDwhFilepath
set "indexDwhFilepath=%~6"
goto :indexDwhFilepathCheck
:indexDwhFilepathPrompt
SET /P indexDwhFilepath=[enter the Log file repository]
:indexDwhFilepathCheck
if "%indexDwhFilepath%"=="" goto :indexDwhFilepathPrompt


:: Fetch logDwhFilePath
set "logDwhFilePath=%~7"
goto :logDwhFilePathCheck
:logDwhFilePathPrompt
SET /P logDwhFilePath=[enter the Log file repository]
:logDwhFilePathCheck
if "%logDwhFilePath%"=="" goto :logDwhFilePathPrompt

echo ==================================================================
echo starting to drop DB %database% ONTO %server% ........
echo ==================================================================

:: sqlcmd -S %server% -U %login% -P %password%  -Q "ALTER DATABASE %database% SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE %database%;"
sqlcmd -S %server% -U %login% -P %password% -i  %mypath%\drop_DB.sql -b -o out_drop_DB_%server%_%database%.log -v dbName="%database%"
if not errorlevel 1 goto next1
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo == An error occurred   %errorlevel% ==
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
goto exit

:next1
echo ==================================================================
echo starting  to create DB %database%  ONTO %server%........
echo ==================================================================
%mypath%\script_create_Database.bat %database% %server% %login% %password% %dataDwhFilepath% %indexDwhFilepath% %logDwhFilePath%
if not errorlevel 1 goto next2
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo == An error occurred  %errorlevel% 
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
goto exit
:next2
echo
echo ==================================================================
echo 						End of  %database% ONTO %server% Creation
echo ==================================================================
:exit
