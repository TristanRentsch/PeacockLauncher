@echo off
setlocal enabledelayedexpansion

set patcher=PeacockPatcher.exe
set server=StartServer.cmd
set launcher=Launcher.exe
set serverPort=80
set peacockLocation=%1
set hitmanLocation=%~dp0

cd %peacockLocation%
call :reLaunch %patcher%
call :relaunch %server% -s %serverPort%
cd %hitmanLocation%
start %launcher%

endlocal
EXIT /B

:reLaunch
    if "%2"=="-s" (
        if "%3"=="" (
            echo "ERR: Use -s tag with the following syntax:"
            echo ":relaunch [EXE] -s [PORT]"
            EXIT /B 0
        )
        REM Find the PID of the process using port %3 and kill
        for /f "tokens=2,5" %%a in ('netstat -ano ^| findstr :%3') do (
            if "%%a"=="0.0.0.0:%3" (
                echo "Process found on port %3 (PID: %%b)..."
                taskkill /PID %%b /F
            )
        )

    ) else (
        REM Check if process is already running
        echo "Checking for process: %1"
        tasklist /FI "IMAGENAME eq %1" 2>NUL | find /I /N "%1">NUL
        
        REM Kill the process
        if "!ERRORLEVEL!"=="0" (
            echo "Process found, attempting to kill: %1"
            taskkill /F /IM %1
        ) else (
            echo "Process not found: %1"
        )
    )
    echo "Launching %1..."
    start "" "%1"
EXIT /B 0
