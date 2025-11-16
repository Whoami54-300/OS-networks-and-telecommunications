@echo off
cls

rem --- Check if parameter is provided ---
if "%~1"=="" (
    echo Error: no number provided.
    echo Usage: factorial.bat ^<number^>
    exit /b
)

rem --- Check that the parameter is a number ---
echo %1| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo Error: the parameter must be a non-negative integer.
    exit /b
)

set n=%1

rem --- Check for negative value (already filtered, but included per assignment) ---
if %n% LSS 0 (
    echo Error: the number cannot be negative.
    exit /b
)

rem --- Check for maximum allowed value ---
rem Limit to 12 (12! fits in 32-bit range; 13! does not)
if %n% GTR 12 (
    echo Error: value is too large. Maximum allowed: 12
    exit /b
)

rem --- Factorial calculation loop ---
set result=1
set i=1

:cycle
if %i% GTR %n% goto done
set /a result=result*i
set /a i=i+1
goto cycle

:done
echo Factorial of %n% is %result%
exit /b