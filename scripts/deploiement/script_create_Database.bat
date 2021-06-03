@echo OFF
set mypath=%~dp0
echo ==================================================================
echo       			Starting %database% Creation....
echo		 		Author:  Emmanuel Pellegrin
echo 				Copyright ORCHESTRA 2019
echo ==================================================================		

set "database=%~1"
goto :databaseCheck
:databasePrompt
set /p "database=Enter database name : "
:databaseCheck
if "%database%"=="" goto :databasePrompt

:: Fetch server
set "server=%~1"
goto :serverCheck
:serverPrompt
SET /P server=[Enter the database instance ( server name)]
:serverCheck
if "%server%"=="" goto :serverPrompt

:: Fetch login    
set "login=%~2"
goto :loginCheck
:loginPrompt
SET /P login=[enter the database login]
:loginCheck
if "%login%"=="" goto :loginPrompt


:: Fetch password
set "password=%~3"
goto :passwordCheck
:passwordPrompt
SET /P password=[enter the database password]
:passwordCheck
if "%password%"=="" goto :passwordPrompt


:: Fetch dataFilepath
set "dataFilepath=%~4"
goto :dataFilepathCheck
:dataFilepathPrompt
SET /P dataFilepath=[enter the database file repository]
:dataFilepathCheck
if "%dataFilepath%"=="" goto :dataFilepathPrompt

:: Fetch indexFilepath
set "indexFilepath=%~5"
goto :indexFilepathCheck
:indexFilepathPrompt
SET /P indexFilepath=[enter the index file repository]
:indexFilepathCheck
if "%indexFilepath%"=="" goto :indexFilepathPrompt

:: Fetch logFilePath
set "logFilePath=%~6"
goto :logFilePathCheck
:logFilePathPrompt
SET /P logFilePath=[enter the Log file repository]
:logFilePathCheck
if "%logFilePath%"=="" goto :logFilePathPrompt




::SET /P server=[Enter the database instance ( server name)]
::SET /P login=[enter the database login]
::SET /P password=[enter the database password]
::SET /P dataFilepath=[enter the database file repository]
::SET /P indexFilepath=[enter the index file repository]
::SET /P logFilePath=[enter the Log file repository]

echo
echo ==================================================================
echo Runnig database creation script for %database%  ONTO %server% ........
echo ==================================================================

SET PROCESS="DB creation step"
sqlcmd -S %server% -U %login% -P %password% -i  %mypath%\create_db_%database%.sql -b -o out_%server%_%database%.log -v dataFilepath="%dataFilepath%" logFilePath="%logFilePath%" indexFilepath="%indexFilepath%"
if not errorlevel 1 goto next1
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo == An error occurred  errorlevel onto %PROCESS%
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
goto exit
echo
echo ==================================================================
echo End of database creation script for %database%  ONTO %server%
echo ==================================================================

:next1
echo
echo ==================================================================
echo Running tables creation script for %database%  ONTO %server%
echo ==================================================================
SET PROCESS="schema creation step"
sqlcmd -S %server% -U %login% -P %password%  -i  %mypath%\create_schema_%database%.sql -b -o schema_%server%_%database%_out.log 
if not errorlevel 1 goto next2
echo
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo == An error occurred  errorlevel onto %PROCESS%
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
goto exit
echo
echo ==================================================================
echo End of tables creation script for %database%  ONTO %server%
echo ==================================================================





echo ==================================================================
echo End of views creation script for %database%  ONTO %server%
echo ==================================================================
echo
echo ==================================================================
echo 						End of  %database% Creation  ONTO %server%
echo ==================================================================
:exit
