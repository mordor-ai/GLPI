@echo off
REM set curr_dir=%cd%
set mypath=%~dp0
set pentaho_dir="C:\Users\epellegrin\Desktop\PENTAHO\PDI\pdi-ce-8.0.0.0-28\data-integration"
ECHO ========================================================================
ECHO  BIENVENUE DANS LE PPROG d'alimentation des GLPI
ECHO 
ECHO AUTHOR Emmanuel PELLEGRIN
ECHO copyrights ORCHESTRA 2019
ECHO ========================================================================
if exist error.log del error.log



REM setlocal enabledelayedexpansion
REM pushd %~dp0

ECHO ****************************************************
ECHO * Starting executing transformations - !time! *
ECHO ****************************************************
CALL %pentaho_dir%/Kitchen.bat  -file:"%mypath%jb_alim_glpi.kjb"  -level:Basic -log="%mypath%error_glpi.log"
IF %ERRORLEVEL% == 0 GOTO NoError
IF NOT %ERRORLEVEL% == 0 GOTO ERROR
goto End

:ERROR
echo "Somme Errors has been happened. Check the error.log file"
goto End

:NoError
echo "Process successfully ended"
goto End

:End
pause 

ECHO *************************************************
ECHO Finished executing transformations - !time! *
ECHO *************************************************
popd

