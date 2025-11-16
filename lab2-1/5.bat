@echo off
cls
echo Finding the largest and smallest number
echo (to finish entering, enter "-")
echo.

set /p num=Enter the number: 
if "%num%"=="-" goto end
set /a max=%num%
set /a min=%num%

:next
set /p num=Enter the number: 
if "%num%"=="-" goto end

if %num% GTR %max% set /a max=%num%
if %num% LSS %min% set /a min=%num%
goto next

:end
echo.
echo The greatest number: %max%
echo The smallest number: %min%
pause