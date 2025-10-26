@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem All messages are English-only to avoid codepage issues.

setlocal EnableDelayedExpansion
set "root=%~1"
if "%root%"=="" set "root=."
set /a count=0

rem FOR /D /R walks directories recursively; pattern (*) required syntactically
for /d /r "%root%" %%D in (*) do set /a count+=1

echo !count!
