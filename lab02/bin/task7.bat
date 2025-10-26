@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem All messages are English-only to avoid codepage issues.

if "%~2"=="" (echo Usage: task7.bat ^<dir1^> ^<dir2^>& exit /b 1)

for %%F in ("%~1\*") do (
  rem skip directories in dir1
  if not exist "%~1\%%~nxF\" (
    if exist "%~2\%%~nxF" echo %%~nxF
  )
)
