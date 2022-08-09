@echo off

setlocal enableDelayedExpansion

fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)




:: ====================
:: Scheduled Tasks
:: ====================

echo(&echo   # Scheduled Tasks

>nul 2>&1 (
	rem Collects program telemtry information...
	schtasks /end /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
	schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable

	schtasks /end /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater"
	schtasks /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable

	schtasks /end /TN "Microsoft\Windows\Autochk\Proxy"
	schtasks /change /TN "Microsoft\Windows\Autochk\Proxy" /disable

	schtasks /end /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
	schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable

	schtasks /end /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
	schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable

	schtasks /end /TN "Microsoft\Windows\DiskDiagnosticMicrosoft-Windows-DiskDiagnosticDataCollector"
	schtasks /change /TN "Microsoft\Windows\DiskDiagnosticMicrosoft-Windows-DiskDiagnosticDataCollector" /disable

	schtasks /end /TN "Microsoft\Windows\Feedback\Siuf\DmClient"
	schtasks /change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /disable

	schtasks /end /TN "Microsoft\Windows\Shell\FamilySafetyMonitor"
	schtasks /change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /disable

	schtasks /end /TN "Microsoft\Windows\Maintenance\WinSAT"
	schtasks /change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable
	
	schtasks /end /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting"
	schtasks /change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable

	schtasks /end /TN "Microsoft\Windows\Device Information\Device"
	schtasks /change /TN "Microsoft\Windows\Device Information\Device" /disable
)

:: ====================




:: ====================
:: Services
:: ====================

echo(&echo   # Services

>nul 2>&1 (
	sc stop "DusmSvc" & sc config "DusmSvc" start= disabled rem Network data usage, data limit, restrict background data, metered networks.
	sc stop "diagnosticshub.standardcollector.service" & sc config "diagnosticshub.standardcollector.service" start= disabled rem Diagnostics Hub Standard Collector Service. When running, this service collects real time ETW events and processes them.
	sc stop "NVDisplay.ContainerLocalSystem" & sc config "NVDisplay.ContainerLocalSystem" start= disabled rem Annoying auto NVIDIA popup.

	sc stop "edgeupdate" & sc config "edgeupdate" start= disabled rem Keeps your Microsoft software up to date. If this service is disabled or stopped, your Microsoft software will not be kept up to date, meaning security vulnerabilities that may arise cannot be fixed and features may not work. This service uninstalls itself when there is no Microsoft software using it.
	sc stop "edgeupdatem" & sc config "edgeupdatem" start= disabled rem Keeps your Microsoft software up to date. If this service is disabled or stopped, your Microsoft software will not be kept up to date, meaning security vulnerabilities that may arise cannot be fixed and features may not work. This service uninstalls itself when there is no Microsoft software using it.

	sc stop "xbgm" & sc config "xbgm" start= disabled
	sc stop "XboxGipSvc" & sc config "XboxGipSvc" start= disabled rem This service manages connected Xbox Accessories.
	sc stop "XblAuthManager" & sc config "XblAuthManager" start= disabled rem Provides authentication and authorization services for interacting with Xbox Live.
	sc stop "XblGameSave" & sc config "XblGameSave" start= disabled rem This service syncs save data for Xbox Live save enabled games.
	sc stop "XboxNetApiSvc" & sc config "XboxNetApiSvc" start= disabled rem This service supports the Windows.Networking.XboxLive application programming interface.
)

:: ====================




:: ====================
:: Apps
:: ====================

echo(&echo   # Apps

>nul 2>&1 (
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage '3DBuilder' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage '9E2F88E3.Twitter' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage '46928bounde.EclipseManager' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ActiproSoftwareLLC' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ActiproSoftwareLLC.562882FEEB491' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'AdobeSystemIncorporated.AdobePhotoshop' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'AdobeSystemsIncorporated.AdobePhotoshopExpress' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'AV1VideoExtension' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'bing' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'BingNews' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'BingWeather' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'CandyCrush' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ClearChannelRadioDigital.iHeartRadio' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'CommsPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ConnectivityStore' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'D5EA27B7.Duolingo-LearnLanguagesforFree' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Drawboard PDF' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Duolingo' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'EclipseManager' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Facebook' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Flipboard' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Flipboard.Flipboard' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'GetHelp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Getstarted' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'HEIFImageExtension' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'HiddenCityMysteryofShadows' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'HuluLLC.HuluPlus' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'king.com.CandyCrushSaga' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'king.com.CandyCrushSodaSaga' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'king.com.FarmHeroesSaga' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.3DBuilder' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.549981C3F5F10' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Advertising.Xaml' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Appconnector' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingFinance' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingNews' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingSports' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingWeather' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.CommsPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.DesktopAppInstaller' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.GetHelp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Getstarted' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.GroupMe10' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.HEIFImageExtension' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Messaging' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Microsoft3DViewer' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftEdge.Stable' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftOfficeHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftSolitaireCollection' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftStickyNotes' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MinecraftUWP' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MixedReality.Portal' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MSPaint' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.NetworkSpeedTest' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Office.OneNote' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Office.Sway' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.OneConnect' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.People' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Print3D' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.RemoteDesktop' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ScreenSketch' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.SkypeApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.StorePurchaseApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Todos' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.VCLibs.140.00' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.VP9VideoExtensions' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Wallet' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WebMediaExtensions' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WebpImageExtension' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windows.Phone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windows.Photos' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsAlarms' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCalculator' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCamera' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windowscommunicationsapps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsFeedbackHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsMaps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsSoundRecorder' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsStore' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.YourPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneMusic' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneVideo' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftEdge' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftOfficeHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftSolitaireCollection' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftStickyNotes' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Netflix' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'NVIDIACorp.NVIDIAControlPanel' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'OneDriveSync' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'OneNote' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Paint' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Pandora' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'PandoraMediaInc.29680B314EFC2' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'people' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'photos' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Plex' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'PowerAutomateDesktop' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ROBLOXCORPORATION.ROBLOX' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ShazamEntertainmentLtd.Shazam' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'SkypeApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'solit' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Spotify' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'SpotifyAB.SpotifyMusic' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Sway' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Teams' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Todos' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Twitter' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WebpImageExtension' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Windows.Photos' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsAlarms' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsCalculator' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsCamera' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'windowscommunicationsapps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsFeedbackHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsMaps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsNotepad' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'WindowsSoundRecorder' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Wunderlist' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'YourPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'zune' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ZuneMusic' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ZuneVideo' | Remove-AppxPackage"
)

:: ====================




:: ====================
:: Registry Tweaks
:: ====================

echo(&echo   # Registry Tweaks

>nul 2>&1 (
	rem CONTEXT MENU

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




	rem Sounds
	reg add "HKCU\AppEvents\Schemes" /ve /t REG_SZ /d ".None" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\SystemAsterisk\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\SystemAsterisk\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Reminder\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Reminder\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\CriticalBatteryAlarm\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\CriticalBatteryAlarm\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\SystemHand\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\SystemHand\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\.Default\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\.Default\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\MailBeep\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\MailBeep\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\DeviceFail\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\DeviceFail\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\SystemExclamation\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\SystemExclamation\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.IM\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.IM\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\LowBatteryAlarm\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\LowBatteryAlarm\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\MessageNudge\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\MessageNudge\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\FaxBeep\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\FaxBeep\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Mail\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Mail\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.SMS\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.SMS\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Proximity\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Proximity\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\ProximityConnection\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\ProximityConnection\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Default\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\Notification.Default\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\SystemNotification\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\SystemNotification\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\.Default\WindowsUAC\.Current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\.Default\WindowsUAC\.Current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\DisNumbersSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\DisNumbersSound\.current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\PanelSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\PanelSound\.current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\MisrecoSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\MisrecoSound\.current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\HubOffSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\HubOffSound\.current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\HubOnSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\HubOnSound\.current" /f
	reg delete "HKCU\AppEvents\Schemes\Apps\sapisvr\HubSleepSound\.current" /ve /f
	reg add "HKCU\AppEvents\Schemes\Apps\sapisvr\HubSleepSound\.current" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v "DisableStartupSound" /t REG_DWORD /d "1" /f
	rem Playback/Recording
	reg add "HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl" /v "ShowDisconnectedDevices" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl" /v "ShowHiddenDevices" /t REG_DWORD /d "0" /f
	rem Communications
	reg add "HKCU\SOFTWARE\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f




	rem Safe Random Tweaks
	reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
	reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
	reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "2000" /f
	reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
	reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
	reg add "HKCU\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "prompt $E[38;5;220m$S$S_$_$E[38;5;208m$G$E[38;5;220m$C$E[0m.$E[38;5;220m$F__$_$S$C___/$S$E[0m$P$G" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /d "0" /t "REG_DWORD" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StoreAppsOnTaskbar" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAutoHideInTabletMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "Notepad++_file" /t REG_NONE /d "" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f

	rem HKCU: ContentDeliveryManager
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353697Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-88000326Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f

	rem HKCU: ConsentStore
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect" /v "Value" /t REG_SZ /d "Allow" /f

	rem HKLM: ConsentStore
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect" /v "Value" /t REG_SZ /d "Allow" /f

	rem Local Group Policy Editor - Administrative Templates/Windows Componets/Data Collection and Preview Builds
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.AllowTelemetry" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowUpdateComplianceProcessing" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowWUfBCloudProcessing" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.CommercialId" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.ConfigureMicrosoft365UploadEndpoint" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.DisableTelemetryOptInChangeNotification" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.DisableTelemetryOptInSettingsUx" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableDeviceDelete" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableDiagnosticDataViewer" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.DisableEnterpriseAuthProxy" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "EnableOneSettingsAuditing" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "**del.TelemetryProxyServer" /t REG_SZ /d " " /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{4CBD50F6-AA9A-44DD-9051-A01BADE0646C}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "**del.MicrosoftEdgeDataOptIn" /t REG_SZ /d " " /f

	rem Local Group Policy Editor - Administrative Templates/Windows Componets/App Privacy
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v "DisableCustomerImprovementProgram" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}Machine\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillAddressEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillCreditCardEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{B9073FBC-0133-47BE-9969-A2926AD56E80}User\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
	gpupdate /force >nul

	rem Telemetry / Data Collection / Advertising / Tracking
	reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "DetailedFeedback" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\MailSettings" /v "InlineTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /v "EnableTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "RomeSdkChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-88000326Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{6ac27878-a6fa-4155-ba85-f98f491d4f33}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-155514346-2573954481-755741238-1654018636-1233331829-3075935687-2861478708\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-1227535392-783678415-19788749-859698564-2515149781-2716591593-3518111838\{6ac27878-a6fa-4155-ba85-f98f491d4f33}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2679466428-2257802901-1755839644-3032159574-3452485508-990264208-3332697187\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3445883232-1224167743-206467785-1580939083-2750001491-3097792036-3019341970\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-4153522205-3718366397-1353898457-1332184198-1210887116-3116787857-2103916698\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "3" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartPage" /v "StartMenu_Start_Time" /t REG_BINARY /d "C3166B83A98BD801" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaMUID" /t REG_SZ /d "MUID=5c47d9dce817417d9cb7fc5cbfbf899d" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaMUID" /t REG_SZ /d "MUID=11f7e009d28343a79e76dd90812f046c" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaMUID" /t REG_SZ /d "MUID=b2fab8ec63a74400b5daabfbe95d7d1e" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "CheckTrialOffer" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "HelpImproveCCleaner" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "Monitoring" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "SystemMonitoring" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "UpdateAuto" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Piriform\CCleaner" /v "UpdateCheck" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "LinkedIn" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "UpdateReliabilityData" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback" /v "IncludeEmail" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback" /v "SurveyEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy" /v "ControllerConnectedServicesEnabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DisconnectedState" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DownloadContentDisabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy" /v "UserContentDisabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\AMD\CN" /t REG_DWORD /v "CollectGIData" /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\DusmSvc\Settings" /v "DisableSystemBucket" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\DusmSvc\Settings" /v "DisableSystemBucket" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ConnectedSearch" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\BrokerUp" /t REG_DWORD /v "WWAJSE" /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)GetIpmForTrial" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)HealthCheck" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)QuickClean" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)QuickCleanIpm" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)SoftwareUpdater" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Piriform\CCleaner" /v "(Cfg)SoftwareUpdaterIpm" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "SyncDisabled" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableDefaultBrowserAgent" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\Storage\EnabledDenyGP" /v "DenyAllGPState" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryDeviceHealthEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryErrorDataEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryPerformanceEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\CDPUserSvc" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\UnistoreSvc" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\UserDataSvc" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\WpnUserService" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f
)

:: ====================




:: ====================
:: Sophisicated Tweaks
:: ====================

echo(&echo   # Sophisicated Tweaks

>nul 2>&1 (
	powercfg -h off

	rem Prefetch / Superfetch
	sc stop “SysMain” & sc config “SysMain” start=disabled
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
	del /F /Q "C:\Windows\Prefetch\*"
	
	rem Uninstall NVIDIA telemetry tasks
	if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
		rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer
		rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetry
	)
	
	rem Delete NVIDIA residual telemetry files
	del /s %SystemRoot%\System32\DriverStore\FileRepository\NvTelemetry*.dll
	rmdir /s /q "%ProgramFiles(x86)%\NVIDIA Corporation\NvTelemetry"
	
	rem Opt out from NVIDIA telemetry
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d 0 /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d 0 /f 
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d 0 /f
	
	rem Disable Nvidia Telemetry Container service
	PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'NvTelemetryContainer'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"

	rem Disable NVIDIA telemetry services
	schtasks /change /tn NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	schtasks /change /tn NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	schtasks /change /tn NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	
	setx DOTNET_CLI_TELEMETRY_OPTOUT 1
	setx POWERSHELL_TELEMETRY_OPTOUT 1
	
	w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
	SC queryex "w32time"|Find "STATE"|Find /v "RUNNING">Nul||(
		net stop w32time
	)
	net start w32time
	w32tm /config /update
	w32tm /resync
	
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	if not %PROCESSOR_ARCHITECTURE%==x86 ( REM is 64 bit?
		reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	)
	
	if %PROCESSOR_ARCHITECTURE%==x86 ( REM is 32 bit?
    		reg add "HKLM\SOFTWARE\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    		reg add "HKLM\SOFTWARE\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    		reg add "HKLM\SOFTWARE\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
	) else (
    		reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    		reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
    		reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
	)
	
	icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:r /deny "*S-1-1-0:(OI)(CI)(F)" "*S-1-5-7:(OI)(CI)(F)"
	cacls "%localappdata%\Google\Chrome\User Data\SwReporter" /e /c /d %username%
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "software_reporter_tool.exe" /f
	
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f
	wmic cpu get name | findstr "Intel" >nul && (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 0 /f
	)
	wmic cpu get name | findstr "AMD" >nul && (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 64 /f
	)
	
	dism /online /Disable-Feature /FeatureName:"SMB1Protocol" /NoRestart
	dism /Online /Disable-Feature /FeatureName:"SMB1Protocol-Client" /NoRestart
	dism /Online /Disable-Feature /FeatureName:"SMB1Protocol-Server" /NoRestart
	dism /online /Disable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2Root" /NoRestart
	dism /online /Disable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2" /NoRestart
	
	for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F
	
	taskkill /f /im OneDrive.exe
	if %PROCESSOR_ARCHITECTURE%==x86 (
		%SystemRoot%\System32\OneDriveSetup.exe /uninstall 2>nul
	) else (
		%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall 2>nul
	)
	rd "%UserProfile%\OneDrive" /q /s
	rd "%LocalAppData%\Microsoft\OneDrive" /q /s
	rd "%ProgramData%\Microsoft OneDrive" /q /s
	rd "%SystemDrive%\OneDriveTemp" /q /s
	del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk" /s /f /q
	del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
	del "%USERPROFILE%\Links\OneDrive.lnk" /s /f /q
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSyncNGSC" /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSync" /d 1 /f
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
	reg load "HKU\Default" "%SystemDrive%\Users\Default\NTUSER.DAT" 
	reg delete "HKU\Default\software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
	reg unload "HKU\Default"
	reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
	reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
	reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f
	reg add "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f
	for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F
	reg delete "HKCU\Environment" /v "OneDrive" /f
)

:: ====================




:: ====================
:: Host File Config
:: ====================

echo(&echo   # Host File Config



:: ====================




:: ====================
:: DNS Config
:: ====================

echo(&echo   # DNS Config

>nul 2>&1 (
	for /f "tokens=4 delims= " %%a in ('netsh interface show interface ^| find "Connected"') do (
	   set MainAdapter=%%a
	)
	netsh interface ipv4 add dns "!MainAdapter!" 1.1.1.1
	netsh interface ipv4 add dns "!MainAdapter!" 1.0.0.1 index=2
	netsh interface ipv6 add dns "!MainAdapter!" 2606:4700:4700::1111
	netsh interface ipv6 add dns "!MainAdapter!" 2606:4700:4700::1001 index=2
	ipconfig/flushdns
)

:: ====================




:: ====================
:: Clean
:: ====================

echo(&echo   # Clean

arp -d *

del /f/s/q/a %systemdrive%\Windows\Temp\*
del /f/s/q/a %userprofile%\AppData\Local\Temp\*
del /f/s/q/a %systemdrive%\*.log,*.LOG,*.etl,*.tmp,*.hta

powershell Clear-RecycleBin -Force -ErrorAction SilentlyContinue

taskkill /f /im explorer.exe & explorer.exe

:: ====================

pause