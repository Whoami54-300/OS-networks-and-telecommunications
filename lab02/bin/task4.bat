@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem All messages are English-only to avoid codepage issues.

if "%~1"==""  (echo Usage: task4.bat ^<dir^> ^<ext^>& exit /b 1)
if "%~2"==""  (echo Usage: task4.bat ^<dir^> ^<ext^>& exit /b 1)

dir /b /a:-d "%~1\*.%~2"
