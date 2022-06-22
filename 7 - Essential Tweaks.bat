@echo off

fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

:: Essential Windows Registry Tweaks - By: Scrut1ny

rem Directory
reg add "HKCR\Directory\shell\OpenCmdHereAsAdmin" /ve /t REG_SZ /d "CMD (Admin)" /f
reg delete "HKCR\Directory\shell\OpenCmdHereAsAdmin" /v "Extended" /f
reg add "HKCR\Directory\shell\OpenCmdHereAsAdmin" /v "Icon" /t REG_SZ /d "imageres.dll,-5324" /f
reg add "HKCR\Directory\shell\OpenCmdHereAsAdmin\command" /ve /t REG_SZ /d "cmd /c echo|set/p=\"%L\"|powershell -NoP -W 1 -NonI -NoL \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\"" /f
rem Directory\Background
reg add "HKCR\Directory\Background\shell\OpenCmdHereAsAdmin" /ve /t REG_SZ /d "CMD (Admin)" /f
reg delete "HKCR\Directory\Background\shell\OpenCmdHereAsAdmin" /v "Extended" /f
reg add "HKCR\Directory\Background\shell\OpenCmdHereAsAdmin" /v "Icon" /t REG_SZ /d "imageres.dll,-5324" /f
reg add "HKCR\Directory\Background\shell\OpenCmdHereAsAdmin\command" /ve /t REG_SZ /d "cmd /c echo|set/p=\"%V\"|powershell -NoP -W 1 -NonI -NoL \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\"" /f
rem Drive
reg add "HKCR\Drive\shell\OpenCmdHereAsAdmin" /ve /t REG_SZ /d "CMD (Admin)" /f
reg delete "HKCR\Drive\shell\OpenCmdHereAsAdmin" /v "Extended" /f
reg add "HKCR\Drive\shell\OpenCmdHereAsAdmin" /v "Icon" /t REG_SZ /d "imageres.dll,-5324" /f
reg add "HKCR\Drive\shell\OpenCmdHereAsAdmin\command" /ve /t REG_SZ /d "cmd /c echo|set/p=\"%L\"|powershell -NoP -W 1 -NonI -NoL \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\"" /f
rem Extra
reg delete "HKCR\LibraryFolder\background\shell\OpenCmdHereAsAdmin" /f
rem To allow mapped drives to be available in command prompt
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d "1" /f

rem Restart Explorer.exe
reg add "HKCR\Directory\Background\shell\REX" /ve /t REG_SZ /d "Restart Explorer" /f
reg delete "HKCR\Directory\Background\shell\REX" /v "Extended" /f
reg add "HKCR\Directory\Background\shell\REX" /v "Icon" /t REG_SZ /d "imageres.dll,0" /f
reg add "HKCR\Directory\Background\shell\REX\command" /ve /t REG_SZ /d "cmd /c taskkill /F /IM explorer.exe & start explorer" /f

rem Create .bat
reg add "HKCR\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "" /f

rem Random
reg add "HKCU\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "prompt $E[38;5;220m$S$S_$_$E[38;5;208m$G$E[38;5;220m$C$E[0m.$E[38;5;220m$F__$_$S$C___/$S$E[0m$P$G" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
