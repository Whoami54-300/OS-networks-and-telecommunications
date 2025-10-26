@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem All messages are English-only to avoid codepage issues.

echo Enter integers one per line. Type '-' to finish.

set "haveAny="
:readLoop
set "x="
set /p x=Number: 
if "%x%"=="-" goto done

rem validate integer: optional leading minus and at least one digit
echo.%x%| findstr /r "^-*[0-9][0-9]*$" >nul || (echo Invalid input. Try again.& goto readLoop)

if not defined haveAny (
  set "min=%x%"
  set "max=%x%"
  set "haveAny=1"
) else (
  set /a _tmp=%x%+0
  if !_tmp! lss !min! set "min=!_tmp!"
  if !_tmp! gtr !max! set "max=!_tmp!"
)
goto readLoop

:done
if not defined haveAny (
  echo No numbers entered.
) else (
  echo MIN=!min!  MAX=!max!
)
