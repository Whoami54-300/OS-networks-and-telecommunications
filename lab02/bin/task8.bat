@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem All messages are English-only to avoid codepage issues.

setlocal EnableDelayedExpansion

if "%~1"=="" (echo Usage: fact.bat ^<n^>& exit /b 1)

set "n=%~1"
echo.%n%| findstr /r "^[0-9][0-9]*$" >nul || (
  echo ERROR: n must be a non-negative integer.
  exit /b 2
)

rem 32-bit signed limit: 12! = 479001600 fits; 13! overflows
for /f %%v in ('cmd /c echo 479001600') do set "lim=%%v"
for /f %%v in ('cmd /c echo 12') do set "maxn=%%v"

set /a n+=0
if %n% gtr %maxn% (
  echo ERROR: n too large for 32-bit arithmetic (max is %maxn%).
  exit /b 3
)

set /a f=1
for /l %%i in (2,1,%n%) do set /a f*=%%i

echo %n%! = !f!