:: 6.bat — count the number of subdirectories
@echo off
cls
:: Check if the folder path is given as a parameter
if "%~1"=="" (
    set "folder=%cd%"
) else (
    set "folder=%~1"
)

:: Check if the specified folder exists
if not exist "%folder%\" (
    echo The specified folder was not found.
    exit /b
)

:: Count the number of directories (including nested ones)
for /f %%a in ('dir "%folder%" /ad /s /b ^| find /v /c ""') do set count=%%a

:: Display the result
echo %count%