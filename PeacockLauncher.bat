@echo off
setlocal

set patcher=PeacockPatcher.exe
set server=StartServer.cmd
set cmdPrompt=cmd.exe
set launcher=Launcher.exe
set peacockLocation="[Peacock Folder location]"
set hitmanLocation="C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3\"

cd %peacockLocation%
rem call :reLaunch %patcher%
call :relaunch %server% %cmdPrompt%
cd %hitmanLocation%
rem start %launcher%

endlocal
EXIT /B

:reLaunch
    set killTask=%2
    if "%killTask%"=="" (
        set killTask=%1
    )
    echo Checking for process: %killTask%
    tasklist /FI "IMAGENAME eq %killTask%" 2>NUL | find /I /N "%killTask%">NUL
    echo ERRORLEVEL after tasklist: %ERRORLEVEL%
    if "%ERRORLEVEL%"=="0" (
        echo Process found, attempting to kill: %killTask%
        taskkill /F /IM %killTask%
    ) else (
        echo Process not found: %killTask%
    )
    echo Launching %1...
    start "" "%1"
EXIT /B 0
