:: 7.bat — common files in two directories (single FOR)
@echo off

:: 1) Get paths from command-line parameters
set "d1=%~1"
set "d2=%~2"

:: 2) Check if parameters are given and directories exist
if "%d1%"=="" goto :usage
if "%d2%"=="" goto :usage
if not exist "%d1%\" (echo First directory not found: "%d1%" & exit /b 2)
if not exist "%d2%\" (echo Second directory not found: "%d2%" & exit /b 2)

:: 3) Single loop: iterate over all items in d1, skip folders,
::    and print the name if the same file exists in d2
for %%F in ("%d1%\*") do (
    if not exist "%%~fF\NUL" if exist "%d2%\%%~nxF" echo %%~nxF
)

exit /b 0

:usage
echo Usage: %~n0 "Folder1" "Folder2"
exit /b 1