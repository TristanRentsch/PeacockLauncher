@echo off
setlocal

set patcher=PeacockPatcher.exe
set server=StartServer.cmd
set cmdPrompt=cmd.exe
set launcher=Launcher.exe
set peacockLocation="[Paste path to Peacock Folder here]"

cd "[Peacock Folder location]"
rem call :reLaunch %patcher%
call :relaunch %server% %cmdPrompt%
cd "C:\Program Files (x86)\Steam\steamapps\common\HITMAN 3\ "
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
    start "" "%1"
EXIT /B 0
