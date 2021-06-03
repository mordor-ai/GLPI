@echo off
REM set curr_dir=%cd%
 
set curr_dir="C:\Users\epellegrin\Desktop\PENTAHO\PDI\pdi-ce-8.0.0.0-28\data-integration"
chdir /D %curr_dir%
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
CALL %curr_dir%/Kitchen.bat  -file:"C:\Users\epellegrin\Desktop\orchestra\GLPI\jb_alim_glpi_tickets_only.kjb"  -level:Basic > C:\Users\epellegrin\Desktop\orchestra\GLPI\error.log
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

