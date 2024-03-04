:: ==================================================
::  Windows-Tweaking v10.0
:: ==================================================
::  Dev  - Scut1ny
::  Help - 
::  Link - https://github.com/Scrut1ny/Windows-Debloating-Script
:: ==================================================


@echo off
setlocal enableDelayedExpansion
mode con:cols=65 lines=21


fltmc >nul 2>&1 || (
    echo( && echo   [33m# Administrator privileges are required. && echo([0m
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo   [33m# Right-click on the script and select "Run as administrator".[0m
        >nul pause && exit 1
    )
    exit 0
)


:: ====================

:MENU
@chcp 65001>nul
mode con:cols=28 lines=11
cls && title https://github.com/Scrut1ny/Windows-Debloating-Script && echo(
echo   ╔══════════════════════╗
echo   ║ Windows • Multi-Tool ║
echo   ╚══════════════════════╝ && echo(
echo   [1] - Activate Windows
echo   [2] - Optimize Windows
echo   [3] - Update all Apps && echo(
set /p "c=.  ► "
if '%c%'=='1' goto :choice1
if '%c%'=='2' goto :choice2
if '%c%'=='3' goto :choice3
cls && echo( && echo   [31m• "%c%" is invalid.[0m && >nul timeout /t 2
goto :MENU
exit /b

:choice1
powershell irm https://massgrave.dev/get ^| iex
goto :MENU
exit /b

:choice3
cls && echo( && echo   [92m• Receiving Latest Updates[0m && echo(
mode con:cols=120 lines=40
winget upgrade -h --all
goto :MENU
exit /b

:choice2
:: ====================
:: Scheduled Tasks
:: ====================
mode con:cols=38 lines=20
cls && echo( && echo   • Disabling: Bloat Scheduled Tasks

>nul 2>&1 (
	rem Component: Telemtry Client
	schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
	schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
	schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Device Information\Device User"
	schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable

	schtasks /end /tn "\Microsoft\Windows\Device Information\Device"
	schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\InputSettingsRestoreDataAvailable"
	schtasks /change /tn "\Microsoft\Windows\Input\InputSettingsRestoreDataAvailable" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\LocalUserSyncDataAvailable"
	schtasks /change /tn "\Microsoft\Windows\Input\LocalUserSyncDataAvailable" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\MouseSyncDataAvailable"
	schtasks /change /tn "\Microsoft\Windows\Input\MouseSyncDataAvailable" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\PenSyncDataAvailable"
	schtasks /change /tn "\Microsoft\Windows\Input\PenSyncDataAvailable" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\syncpensettings"
	schtasks /change /tn "\Microsoft\Windows\Input\syncpensettings" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Input\TouchpadSyncDataAvailable"
	schtasks /change /tn "\Microsoft\Windows\Input\TouchpadSyncDataAvailable" /disable
	
	rem Component: CEIP (SQM)
	schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy"
	schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
	
	rem Component: Disk failure diagnostics
	schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
	schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
	
	schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
	schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
	
	rem Component: Data Usage service
	schtasks /end /tn "\Microsoft\Windows\DUSM\dusmtask"
	schtasks /change /tn "\Microsoft\Windows\DUSM\dusmtask" /disable
	
	rem Component: Windows Error Reporting
	schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClient"
	schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
	schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
	schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
	
	rem Component: Location Service
	schtasks /end /tn "\Microsoft\Windows\Location\WindowsActionDialog"
	schtasks /change /tn "\Microsoft\Windows\Location\WindowsActionDialog" /disable
	
	rem Component: Windows System Assessment Tool (winSAT)
	schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT"
	schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable
	
	rem Component: Diagnostics and Troubleshooting
	schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
	schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
	schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
	
	rem Component: Microsoft family featurers
	schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
	schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
	
	schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask"
	schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable
	
	rem Component: Windows Search
	schtasks /end /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
	schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable
	
	rem Component: Location Service
	rem Component: Location Notifications
	schtasks /end /tn "\Microsoft\Windows\Location\Notifications"
	schtasks /change /tn "\Microsoft\Windows\Location\Notifications" /disable

	rem Component: Speech Recognition
	schtasks /end /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask"
	schtasks /change /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /disable

	rem Misc.:
	schtasks /end /tn "\Microsoft\Windows\International\Synchronize Language Settings"
	schtasks /change /tn "\Microsoft\Windows\International\Synchronize Language Settings" /disable
)

:: ====================


:: ====================
:: Services
:: ====================

echo( && echo   • Disabling: Bloat Services

>nul 2>&1 (
	rem Random Useless Services
	sc stop "CDPUserSvc" & sc config "CDPUserSvc" start= disabled
	sc stop "Connected User Experiences and Telemetry" & sc config "Connected User Experiences and Telemetry" start= disabled
	sc stop "Diagnostic Policy Service" & sc config "Diagnostic Policy Service" start= disabled
	sc stop "diagnosticshub.standardcollector.service" & sc config "diagnosticshub.standardcollector.service" start= disabled
	sc stop "diagsvc" & sc config "diagsvc" start= disabled
	sc stop "DiagTrack" & sc config "DiagTrack" start= disabled
	sc stop "dmwappushservice" & sc config "dmwappushservice" start= disabled
	sc stop "Downloaded Maps Manager" & sc config "Downloaded Maps Manager" start= disabled
	sc stop "DusmSvc" & sc config "DusmSvc" start= disabled & del /F/S/Q "%windir%\System32\sru\*"
	sc stop "edgeupdate" & sc config "edgeupdate" start= disabled
	sc stop "edgeupdatem" & sc config "edgeupdatem" start= disabled
	sc stop "Geolocation Service" & sc config "Geolocation Service" start= disabled
	sc stop "MapsBroker" & sc config "MapsBroker" start= disabled
	sc stop "MessagingService" & sc config "MessagingService" start= disabled
	sc stop "MicrosoftEdgeElevationService" & sc config "MicrosoftEdgeElevationService" start= disabled
	sc stop "NahimicService" & sc config "NahimicService" start= disabled
	sc stop "NvTelemetryContainer" & sc config "NvTelemetryContainer" start= disabled
	sc stop "OneSyncSvc_*" & sc config "OneSyncSvc_*" start= disabled
	sc stop "PcaSvc" & sc config "PcaSvc" start= disabled
	sc stop "PhoneSvc" & sc config "PhoneSvc" start= disabled
	sc stop "PimIndexMaintenanceSvc" & sc config "PimIndexMaintenanceSvc" start= disabled
	sc stop "Remote Registry" & sc config "Remote Registry" start= disabled
	sc stop "RemoteRegistry" & sc config "RemoteRegistry" start= disabled
	sc stop "RetailDemo" & sc config "RetailDemo" start= disabled
	sc stop "TabletInputService" & sc config "TabletInputService" start= disabled
	sc stop "UnistoreSvc" & sc config "UnistoreSvc" start= disabled
	sc stop "UserDataSvc" & sc config "UserDataSvc" start= disabled
	sc stop "wercplsupport" & sc config "wercplsupport" start= disabled
	sc stop "WerSvc" & sc config "WerSvc" start= disabled
	sc stop "Windows Biometric Service" & sc config "Windows Biometric Service" start= disabled
	sc stop "WpnUserService" & sc config "WpnUserService" start= disabled

	rem ==========================
	rem ===== Core Services ======
	rem ==========================
	
	rem ==========================
	rem ===== Windows Update =====
	rem ==========================
	rem Background Intelligent Transfer Service
	sc config "BITS" start= demand & sc start "BITS"
	rem Cryptographic Services
	sc config "CryptSvc" start= auto & sc start "CryptSvc"
	rem Windows Update Orchestrator Service
	sc config "UsoSvc" start= demand & sc start "UsoSvc"
	rem Windows Update
	sc config "wuauserv" start= demand & sc start "wuauserv"
	rem Windows Modules Installer
	sc config "TrustedInstaller" start= demand & sc start "TrustedInstaller"
	
	rem ==========================
	rem ===== Windows Audio ======
	rem ==========================
	rem Windows Audio Endpoint Builder
	sc config "AudioEndpointBuilder" start= demand & sc start "AudioEndpointBuilder"
	rem Windows Audio
	sc config "Audiosrv" start= auto & sc start "Audiosrv"
	
	rem ==========================
	rem ==== Windows Network =====
	rem ==========================
	rem DHCP Client
	sc config "Dhcp" start= auto & sc start "Dhcp"
	rem DNS Client
	sc config "Dnscache" start= auto & sc start "Dnscache"
	rem TCP/IP NetBIOS Helper
	sc config "lmhosts" start= demand & sc start "lmhosts"
	rem Network Connections
	sc config "Netman" start= demand & sc start "Netman"
	rem Network List Service
	sc config "Netprofm" start= demand & sc start "Netprofm"
	rem Network Location Awareness
	sc config "NlaSvc" start= auto & sc start "NlaSvc"
	rem Network Store Interface Service
	sc config "nsi" start= auto & sc start "nsi"
	rem Remote Access Connection Manager
	sc config "RasMan" start= demand & sc start "RasMan"
	rem WLAN AutoConfig
	sc config "Wlansvc" start= auto & sc start "Wlansvc"
)

:xbox_services
cls && echo( && echo   Xbox Services: && echo(
echo   1 ^> [32mEnable[0m
echo   2 ^> [31mDisable[0m
echo   3 ^> Skip && echo(
set /p "c=.  ► "
if '%c%'=='1' goto :c_1
if '%c%'=='2' goto :c_2
if '%c%'=='3' goto :c_3
cls && echo( && echo   [31m# "%c%" isn't a valid option, please try again.[0m && >nul timeout /t 3
goto :xbox_services
exit /b

:c_1
>nul 2>&1 (
	rem Enable Xbox Services
	sc start "XblAuthManager" & sc config "XblAuthManager" start= demand
	sc start "XblGameSave" & sc config "XblGameSave" start= demand
	sc start "XboxGipSvc" & sc config "XboxGipSvc" start= demand
	sc start "XboxNetApiSvc" & sc config "XboxNetApiSvc" start= demand
)
goto :continue_1
exit /b

:c_2
>nul 2>&1 (
	rem Disable Xbox Services
	sc stop "XblAuthManager" & sc config "XblAuthManager" start= disabled
	sc stop "XblGameSave" & sc config "XblGameSave" start= disabled
	sc stop "XboxGipSvc" & sc config "XboxGipSvc" start= disabled
	sc stop "XboxNetApiSvc" & sc config "XboxNetApiSvc" start= disabled
)
goto :continue_1
exit /b

:c_3
rem Skip
goto :continue_1
exit /b

:continue_1

:: ====================


:: ====================
:: Apps
:: 
:: Get-AppxPackage | ft Name, PackageFullName -AutoSize
:: Get-AppxPackage -AllUsers | ft Name, PackageFullName -AutoSize
::
:: All System Apps:
:: Get-AppxPackage -PackageTypeFilter Main | ? { $_.SignatureKind -eq "System" } | Sort Name | Format-Table Name, InstallLocation
:: ====================

cls && echo( && echo   • Removing: Bloat Microsoft Apps

>nul 2>&1 (
	rem Microsoft Apps
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.549981C3F5F10*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Advertising.Xaml*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.BingNews*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.BingWeather*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.GamingApp*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.GetHelp*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Getstarted*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.HEIFImageExtension*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Microsoft3DViewer*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MicrosoftEdge.Stable*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MicrosoftOfficeHub*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MicrosoftSolitaireCollection*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MicrosoftStickyNotes*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MixedReality.Portal*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.MSPaint*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Office.OneNote*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.OneDrive*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Paint*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.People*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.PowerAutomateDesktop*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.ScreenSketch*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Services.Store.Engagement*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.SkypeApp*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Todos*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.VP9VideoExtensions*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Wallet*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WebMediaExtensions*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WebpImageExtension*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Windows.Photos*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Windows.Search*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Windows.SecHealthUI*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsAlarms*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.windowscommunicationsapps*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsMaps*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsSoundRecorder*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.YourPhone*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.ZuneMusic*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.ZuneVideo*' | Remove-AppxPackage"
	
	rem Misc. Apps
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft Edge Update' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.EdgeWebView2Runtime' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'MicrosoftCorporationII.QuickAssist*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'MicrosoftTeams*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'MicrosoftWindows.Client.WebExperience*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'NVIDIACorp.NVIDIAControlPanel*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers '{43D501A5-E5E3-46EC-8F33-9E15D2A2CBD5}' | Remove-AppxPackage"
	
	rem Third Party Apps
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers '9E2F88E3.Twitter*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers '46928bounde.EclipseManager*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'ActiproSoftwareLLC.562882FEEB491*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'AdobeSystemIncorporated.AdobePhotoshop*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'BytedancePte.Ltd.TikTok*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'ClearChannelRadioDigital.iHeartRadio*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Clipchamp.Clipchamp*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'D5EA27B7.Duolingo-LearnLanguagesforFree*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Disney.37853FC22B2CE*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Flipboard.Flipboard*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'king.com.CandyCrushSaga*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'king.com.CandyCrushSodaSaga*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'NVIDIACorp.NVIDIAControlPanel*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'PandoraMediaInc.29680B314EFC2*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'ShazamEntertainmentLtd.Shazam*' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'SpotifyAB.SpotifyMusic*' | Remove-AppxPackage"
	
	rem Main Recommended Microsoft Windows Apps
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.StorePurchaseApp' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsCalculator' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsCamera' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.WindowsStore' | Remove-AppxPackage"
)

:xbox_apps
cls && echo( && echo   Xbox Apps: && echo(
echo   1 ^> [32mInstall[0m
echo   2 ^> [31mRemove[0m
echo   3 ^> Skip && echo(
set /p "c=.  ► "
if '%c%'=='1' goto :c1
if '%c%'=='2' goto :c2
if '%c%'=='3' goto :c3
cls && echo( && echo   [31m# "%c%" isn't a valid option, please try again.[0m && >nul timeout /t 3
goto :xbox_apps
exit /b

:c1
>nul 2>&1 (
	rem Install Xbox Apps
	winget install -h --id 'Microsoft.Xbox.TCUI'
	winget install -h --id 'Microsoft.XboxApp'
	winget install -h --id 'Microsoft.XboxGameOverlay'
	winget install -h --id 'Microsoft.XboxGamingOverlay'
	winget install -h --id 'Microsoft.XboxIdentityProvider'
	winget install -h --id 'Microsoft.XboxSpeechToTextOverlay'
)
goto :continue_2
exit /b

:c2
>nul 2>&1 (
	rem Remove Xbox Apps
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.XboxApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage -allusers 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage"
)
goto :continue_2
exit /b

:c3
rem Skip
goto :continue_2
exit /b

:continue_2

:: ====================


:: ====================
:: Registry Tweaks
:: ====================

cls && echo( && echo   • Applying: Registry Tweaks

>nul 2>&1 (
	rem Safe Random Tweaks
	reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
	reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
	reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
	reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
	reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
	reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
	reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "0" /f
	reg add "HKCU\Software\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "prompt $E[38;5;220m$S$S_$_$E[38;5;208m$G$E[38;5;220m$C$E[0m.$E[38;5;220m$F__$_$S$C___/$S$E[0m$P$G" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /d "0" /t "REG_DWORD" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StoreAppsOnTaskbar" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAutoHideInTabletMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "yes" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "AutoSuggest" /t REG_SZ /d "yes" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /ve /t REG_SZ /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}" /f
	reg add "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "8" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "4" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d "3" /f
	reg add "HKLM\SYSTEM\ControlSet001\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
	
	rem Restore Windows 10 Context Menu
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
	
	rem Choose which folders appear on Start (File Explorer, Settings, Downloads)
	rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$de${7c766bfc-5110-4f2f-8fb1-146c95476c68}$$windows.data.unifiedtile.startglobalproperties\Current" /v "Data" /t REG_BINARY /d "0200000097808B89CBAED8010000000043420100C20A01CB320A03058691CC930524AAA30144C38401669FF79DB187CBD1ACD4010005AFE69E9B0E24DE930244D5860166BF9D879BBF8FC6D4370005BCC9A8A401248CAC034489850166A081BACBBDD7A8A4820100C23C01C24601C55A0100" /f

	rem Show recently installed apps
	rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$de${5e9e7a6f-428f-4cae-b72c-e10764ab30c6}$$windows.data.unifiedtile.startglobalproperties\Current" /v "Data" /t REG_BINARY /d "0200000020DD657DC7A6D9010000000043420100C21401C23C01C55A0200" /f
	rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$de${2779c8e4-e601-4bad-aff5-287d62a38262}$$windows.data.unifiedtile.startglobalproperties\Current" /v "Data" /t REG_BINARY /d "02000000330B77FEA6A7D9010000000043420100C21401C23C01C55A0200" /f
	
	rem ===== CONTEXT MENU =====
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
	rem ========================
	
	rem Playback/Recording
	reg add "HKCU\Software\Microsoft\Multimedia\Audio\DeviceCpl" /v "ShowDisconnectedDevices" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Multimedia\Audio\DeviceCpl" /v "ShowHiddenDevices" /t REG_DWORD /d "0" /f
	
	rem Sounds
	reg add "HKCU\AppEvents\Schemes" /ve /t REG_SZ /d ".None" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v "DisableStartupSound" /t REG_DWORD /d "1" /f
	
	rem Communications
	reg add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f
	
	rem Mouse Configuration
	reg add "HKCU\Software\Microsoft\Accessibility" /v "CursorColor" /t REG_DWORD /d "fafa" /f
	reg add "HKCU\Software\Microsoft\Accessibility" /v "CursorSize" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Accessibility" /v "CursorType" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Accessibility\CursorIndicator" /v "IndicatorColor" /t REG_DWORD /d "ff00bf" /f
	reg add "HKCU\Software\Microsoft\Accessibility\CursorIndicator" /v "IndicatorType" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /t REG_SZ /d "" /f
	
	rem Color filters
	reg add "HKCU\Software\Microsoft\ColorFiltering" /v "Active" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility\ATConfig\colorfiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\Session1\ATConfig\colorfiltering" /v "Active" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\Session1\ATConfig\colorfiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /t REG_SZ /d "" /f

	rem HKCU: ContentDeliveryManager
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353697Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-88000326Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f

	rem HKCU: ConsentStore
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect" /v "Value" /t REG_SZ /d "Allow" /f

	rem HKLM: ConsentStore
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" /v "Value" /t REG_SZ /d "Allow" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f
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
	gpupdate

	rem Telemetry / Data Collection / Advertising / Tracking
	reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" /v "FPEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "OptimizeWindowsSearchResultsForScreenReaders" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "ShowSearchSuggestionsGlobal" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "Use FormSuggest" /t REG_SZ /d "no" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Privacy" /v "EnableEncryptedMediaExtensions" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI" /v "EnableCortana" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI\ShowSearchHistory" /ve /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "DetailedFeedback" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Common\MailSettings" /v "InlineTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationLastUsed" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableTextPrediction" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /v "RomeSdkChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{6ac27878-a6fa-4155-ba85-f98f491d4f33}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9D9E0118-1807-4F2E-96E4-2CE57142E196}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{B19F89AF-E3EB-444B-8DEA-202575A71599}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E83AF229-8640-4D18-A213-E22675EBB2C3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-155514346-2573954481-755741238-1654018636-1233331829-3075935687-2861478708\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-1227535392-783678415-19788749-859698564-2515149781-2716591593-3518111838\{6ac27878-a6fa-4155-ba85-f98f491d4f33}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2679466428-2257802901-1755839644-3032159574-3452485508-990264208-3332697187\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3445883232-1224167743-206467785-1580939083-2750001491-3097792036-3019341970\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-4153522205-3718366397-1353898457-1332184198-1210887116-3116787857-2103916698\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "4" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage" /v "StartMenu_Start_Time" /t REG_BINARY /d "C3166B83A98BD801" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaMUID" /t REG_SZ /d "MUID=5c47d9dce817417d9cb7fc5cbfbf899d" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "AutofillAddressEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "AutofillCreditCardEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d "2" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "PasswordManagerEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "PaymentMethodQueryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "SiteSafetyServicesEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /v "LinkedIn" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /v "UpdateReliabilityData" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "IncludeEmail" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v "SurveyEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "ControllerConnectedServicesEnabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DisconnectedState" /t REG_DWORD /d "2" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "DownloadContentDisabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v "UserContentDisabled" /t REG_DWORD /d "2" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
	reg add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKCU\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
	reg add "HKLM\SOFTWARE\AMD\CN" /t REG_DWORD /v "CollectGIData" /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\DusmSvc\Settings" /v "DisableSystemBucket" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\DusmSvc\Settings" /v "DisableSystemBucket" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
	reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\OneDrive" /v "PreventNetworkTrafficPreUserSignIn" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\PCHC" /v "PreviousUninstall" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\NoExecuteState" /v "LastNoExecuteRadioButtonState" /t REG_DWORD /d "14012" /f
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
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\BrokerUp" /t REG_DWORD /v "WWAJSE" /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "SyncDisabled" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d 0 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePcaRecording" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableScriptedDiagnosticLogging" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Customer Experience Improvement Program" /v "CEIPEnable" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Diagnostic" /v "DisableResourceUsage" /t REG_DWORD /d "1" /f
	reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownload" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "DownloadAllowed" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
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
	reg add "HKLM\SYSTEM\ControlSet001\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "4" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f
)

:: ====================


:: ====================
:: Sophisicated Tweaks
:: ====================

echo( && echo   • Applying: Sophisicated Tweaks

>nul 2>&1 (
	rem Turns off hibernation mode
	powercfg -h off
	
	rem BCDEDIT
	bcdedit /set TESTSIGNING OFF
	bcdedit /set nx optout
	bcdedit /set disabledynamictick no
	bcdedit /set useplatformclock no
	
	rem Clear the Windows update cache
	net stop wuauserv
	del /F/S/Q "%windir%\SoftwareDistribution\Download\*"
	net start wuauserv

	rem Prefetch / Superfetch (meant for HDD NOT a SSD)
	sc stop “SysMain” & sc config “SysMain” start=disabled
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
	del /F/S/Q "%SYSTEMROOT%\Prefetch\*"
	
	rem Uninstall NVIDIA telemetry tasks
	if exist "%ProgramFiles%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL" (
		rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer
		rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetry
	)
	
	rem Delete NVIDIA residual telemetry files
	del /s %SystemRoot%\System32\DriverStore\FileRepository\NvTelemetry*.dll
	rmdir /s /q "%ProgramFiles(x86)%\NVIDIA Corporation\NvTelemetry"
	
	rem Opt out from NVIDIA telemetry
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f 
	reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f 
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f
	
	rem Disable Nvidia Telemetry Container service
	powershell -ExecutionPolicy Unrestricted -Command "$serviceName = 'NvTelemetryContainer'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try {; Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq 'Disabled') {; Write-Host "^""$serviceName is already disabled, no further action is needed"^""; }; <# -- 4. Disable service #>; try {; Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"

	rem Disable NVIDIA Telemetry services
	schtasks /change /tn NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	schtasks /change /tn NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	schtasks /change /tn NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /DISABLE
	
	rem Annoying auto NVIDIA Control Panel can't be found prompt popup.
	sc stop "NVDisplay.ContainerLocalSystem" & sc config "NVDisplay.ContainerLocalSystem" start= disabled
	
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
		reg add "HKLM\SOFTWARE\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
    	reg add "HKLM\SOFTWARE\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
    	reg add "HKLM\SOFTWARE\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
	) else (
    	reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
    	reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
    	reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
	)
	
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe" /v "Debugger" /t REG_SZ /d "%%windir%%\System32\taskkill.exe" /f
	reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DeviceMetricsReportingEnabled" /t REG_DWORD /d "0" /f
	
	icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:r /deny "*S-1-1-0:(OI)(CI)(F)" "*S-1-5-7:(OI)(CI)(F)"
	cacls "%localappdata%\Google\Chrome\User Data\SwReporter" /e /c /d %username%
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "software_reporter_tool.exe" /f
	
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
	wmic cpu get name | findstr "Intel" >nul && (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "0" /f
	)
	wmic cpu get name | findstr "AMD" >nul && (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 64 /f
	)
	
	dism /online /Disable-Feature /FeatureName:"SMB1Protocol" /NoRestart
	dism /online /Disable-Feature /FeatureName:"SMB1Protocol-Client" /NoRestart
	dism /online /Disable-Feature /FeatureName:"SMB1Protocol-Server" /NoRestart
	dism /online /Disable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2Root" /NoRestart
	dism /online /Disable-Feature /FeatureName:"MicrosoftWindowsPowerShellV2" /NoRestart
	
	rem Do not show recently used files in Quick Access
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t "REG_DWORD" /d "0" /f
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	if not %PROCESSOR_ARCHITECTURE%==x86 ( REM is 64 bit?
		reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	)
	
	rem ================================================================================
	rem OneDrive Removal
	rem ================================================================================
	
	rem Kill OneDrive process
	taskkill /f /im OneDrive.exe

	rem Delete all OneDrive related Services
	for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F

	rem Prevent automatic OneDrive install for current user
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
	 
	rem Prevent automatic OneDrive install for new users
	reg load "HKU\Default" "%SystemDrive%\Users\Default\NTUSER.DAT" 
	reg delete "HKU\Default\software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
	reg unload "HKU\Default"

	rem Disable usage of OneDrive
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSyncNGSC" /d 1 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSync" /d 1 /f

	rem Delete OneDrive shortcuts
	del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk" /s /f /q
	del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
	del "%USERPROFILE%\Links\OneDrive.lnk" /s /f /q

	rem Remove OneDrive from explorer menu
	reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
	reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
	reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f
	reg add "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f

	rem Uninstall OneDrive
	if %PROCESSOR_ARCHITECTURE%==x86 (
		%SystemRoot%\System32\OneDriveSetup.exe /uninstall
	) else (
		%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
	)

	rem Delete OneDrive path from registry
	reg delete "HKCU\Environment" /v "OneDrive" /f

	rem Remove OneDrive leftovers
	rd "%UserProfile%\OneDrive" /q /s
	rd "%LocalAppData%\Microsoft\OneDrive" /q /s
	rd "%ProgramData%\Microsoft OneDrive" /q /s
	rd "%SystemDrive%\OneDriveTemp" /q /s
	
	rem rem ================================================================================
	
	rem Use ultimate performance powercfg
	
	rem Balanced
	powercfg /D 381b4222-f694-41f0-9685-ff5bb260df2e
	rem High performance
	powercfg /D 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
	rem Applying Ultimate Performance
	powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
	for /f "tokens=4 delims= " %%a in ('powercfg /L ^| find "Ultimate"') do (
		powercfg /D %%a && powercfg /S %%a
	)
	
	rem Make wallpaper solid black
	rem Picture | 1 -> Solid color | 2 -> Slideshow
	rem "X X X" is a RGB Value.
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundType" /t REG_DWORD /d "1" /f
	reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f
	reg add "HKCU\Control Panel\Desktop" /v "WallPaper" /t REG_SZ /d " " /f
	rem Apply changes
	RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
	
	rem Setting time format to 24h+seconds
	reg add "HKCU\Control Panel\International" /v "sShortTime" /d "HH:mm:ss" /f
	
	rem Remove all pinned taskbar apps
	del /f/q "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
	
	rem Delete controversial default0 user
	net user defaultuser0 /delete
	
	rem Delete annoying "wlrmdr.exe" (Windows Logon Reminder; changing password)
	takeown /f "%SYSTEMROOT%\System32\wlrmdr.exe"
	icacls "%SYSTEMROOT%\System32\wlrmdr.exe" /grant %username%:(F^)
	del /f "%SYSTEMROOT%\System32\wlrmdr.exe"
)

:: ====================


:: ====================
:: Host File Config
:: ====================

echo( && echo   • Applying: Custom Host File Config

>nul 2>&1 (
	rem Check if Windows Defender executable exists
	dir "C:\Program Files\Windows Defender\MpCmdRun.exe"
	if %errorlevel% equ 0 (
		rem Adding Windows Defender Exclusion for hosts file.
		powershell -Command "Add-MpPreference -ExclusionPath '%WINDIR%\System32\drivers\etc\hosts'"
		rem Removing & adding custom hosts file.
		del /f/q "%WINDIR%\System32\drivers\etc\hosts"
		cd "%WINDIR%\System32\drivers\etc" && type nul > hosts
	) else (
		rem Removing & adding custom hosts file.
		del /f/q "%WINDIR%\System32\drivers\etc\hosts"
		cd "%WINDIR%\System32\drivers\etc" && type nul > hosts
	)
)

(
	echo ###################################
	echo # Custom Host Config by: Scrut1ny #
	echo ###################################
	echo(
	echo # Microsoft Store
	echo # 0.0.0.0 bat.bing.com
	echo # 0.0.0.0 store-images.microsoft.com
	echo # 0.0.0.0 store-images.s-microsoft.com
	echo # 0.0.0.0 storeedgefd.dsx.mp.microsoft.com
	echo(
	echo(
	echo Microsoft Store: Xbox
	echo # 0.0.0.0 da.xboxservices.com
	echo # 0.0.0.0 images-eds-ssl.xboxlive.com
	echo # 0.0.0.0 musicart.xboxlive.com
	echo # 0.0.0.0 musicimage.xboxlive.com
	echo(
	echo(
	echo Microsoft Store: Library - Updating Apps
	echo # 0.0.0.0 displaycatalog.mp.microsoft.com
	echo # 0.0.0.0 fe3cr.delivery.mp.microsoft.com
	echo(
	echo(
	echo # Activating Windows
	echo # 0.0.0.0 licensing.mp.microsoft.com
	echo(
	echo(
	echo # Minecraft: Microsoft Login
	echo # 0.0.0.0 device.auth.xboxlive.com
	echo # 0.0.0.0 sisu.xboxlive.com
	echo # 0.0.0.0 login.live.com
	echo(
	echo(
	echo # Windows Telemtry
	echo 0.0.0.0 1oavsblobprodcus350.blob.core.windows.net
	echo 0.0.0.0 37bvsblobprodcus311.blob.core.windows.net
	echo 0.0.0.0 a-0001.a-msedge.net
	echo 0.0.0.0 a-0001.dc-msedge.net
	echo 0.0.0.0 a-0002.a-msedge.net
	echo 0.0.0.0 a-0003.a-msedge.net
	echo 0.0.0.0 a-0004.a-msedge.net
	echo 0.0.0.0 a-0005.a-msedge.net
	echo 0.0.0.0 a-0006.a-msedge.net
	echo 0.0.0.0 a-0007.a-msedge.net
	echo 0.0.0.0 a-0008.a-msedge.net
	echo 0.0.0.0 a-0009.a-msedge.net
	echo 0.0.0.0 a-0010.a-msedge.net
	echo 0.0.0.0 a-0011.a-msedge.net
	echo 0.0.0.0 a-0012.a-msedge.net
	echo 0.0.0.0 a-msedge.net
	echo 0.0.0.0 a.ads1.msn.com
	echo 0.0.0.0 a.ads2.msads.net
	echo 0.0.0.0 a.ads2.msn.com
	echo 0.0.0.0 a.rad.msn.com
	echo 0.0.0.0 ac3.msn.com
	echo 0.0.0.0 activity.windows.com
	echo 0.0.0.0 ad.doubleclick.net
	echo 0.0.0.0 adnexus.net
	echo 0.0.0.0 adnxs.com
	echo 0.0.0.0 ads1.msads.net
	echo 0.0.0.0 ads1.msn.com
	echo 0.0.0.0 ads.msn.com
	echo 0.0.0.0 aidps.atdmt.com
	echo 0.0.0.0 aka-cdn-ns.adtech.de
	echo 0.0.0.0 alpha.telemetry.microsoft.com
	echo 0.0.0.0 api.cortana.ai
	echo 0.0.0.0 api.edgeoffer.microsoft.com
	echo 0.0.0.0 array101-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array102-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array103-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array104-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array201-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array202-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array203-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array204-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array401-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array402-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array403-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array404-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array405-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array406-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array407-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 array408-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 ars.smartscreen.microsoft.com
	echo 0.0.0.0 asimov-win.settings.data.microsoft.com.akadns.net
	echo 0.0.0.0 assets.msn.com
	echo 0.0.0.0 az361816.vo.msecnd.net
	echo 0.0.0.0 az512334.vo.msecnd.net
	echo 0.0.0.0 azureedge.net
	echo 0.0.0.0 azwancan.trafficmanager.net
	echo 0.0.0.0 b.ads1.msn.com
	echo 0.0.0.0 b.ads2.msads.net
	echo 0.0.0.0 b.rad.msn.com
	echo 0.0.0.0 bingads.microsoft.com
	echo 0.0.0.0 bingapis.com
	echo 0.0.0.0 bl3301-a.1drv.com
	echo 0.0.0.0 bl3301-c.1drv.com
	echo 0.0.0.0 bl3301-g.1drv.com
	echo 0.0.0.0 blob.weather.microsoft.com
	echo 0.0.0.0 blobcollector.events.data.trafficmanager.net
	echo 0.0.0.0 bn2-ris-ap-prod-atm.trafficmanager.net
	echo 0.0.0.0 bn2-ris-prod-atm.trafficmanager.net
	echo 0.0.0.0 bn2b-cor001.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor002.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor003.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor004.api.p001.1drv.com
	echo 0.0.0.0 bn2wns1.wns.windows.com
	echo 0.0.0.0 bn3p-cor001.api.p001.1drv.com
	echo 0.0.0.0 bn3sch020010558.wns.windows.com
	echo 0.0.0.0 bn3sch020010560.wns.windows.com
	echo 0.0.0.0 bn3sch020010618.wns.windows.com
	echo 0.0.0.0 bn3sch020010629.wns.windows.com
	echo 0.0.0.0 bn3sch020010631.wns.windows.com
	echo 0.0.0.0 bn3sch020010635.wns.windows.com
	echo 0.0.0.0 bn3sch020010636.wns.windows.com
	echo 0.0.0.0 bn3sch020010650.wns.windows.com
	echo 0.0.0.0 bn3sch020011727.wns.windows.com
	echo 0.0.0.0 bn3sch020012850.wns.windows.com
	echo 0.0.0.0 bn3sch020020322.wns.windows.com
	echo 0.0.0.0 bn3sch020020749.wns.windows.com
	echo 0.0.0.0 bn3sch020022328.wns.windows.com
	echo 0.0.0.0 bn3sch020022335.wns.windows.com
	echo 0.0.0.0 bn3sch020022361.wns.windows.com
	echo 0.0.0.0 bn4sch101120814.wns.windows.com
	echo 0.0.0.0 bn4sch101120818.wns.windows.com
	echo 0.0.0.0 bn4sch101120911.wns.windows.com
	echo 0.0.0.0 bn4sch101120913.wns.windows.com
	echo 0.0.0.0 bn4sch101121019.wns.windows.com
	echo 0.0.0.0 bn4sch101121109.wns.windows.com
	echo 0.0.0.0 bn4sch101121118.wns.windows.com
	echo 0.0.0.0 bn4sch101121223.wns.windows.com
	echo 0.0.0.0 bn4sch101121407.wns.windows.com
	echo 0.0.0.0 bn4sch101121618.wns.windows.com
	echo 0.0.0.0 bn4sch101121704.wns.windows.com
	echo 0.0.0.0 bn4sch101121709.wns.windows.com
	echo 0.0.0.0 bn4sch101121714.wns.windows.com
	echo 0.0.0.0 bn4sch101121908.wns.windows.com
	echo 0.0.0.0 bn4sch101122117.wns.windows.com
	echo 0.0.0.0 bn4sch101122310.wns.windows.com
	echo 0.0.0.0 bn4sch101122312.wns.windows.com
	echo 0.0.0.0 bn4sch101122421.wns.windows.com
	echo 0.0.0.0 bn4sch101123108.wns.windows.com
	echo 0.0.0.0 bn4sch101123110.wns.windows.com
	echo 0.0.0.0 bn4sch101123202.wns.windows.com
	echo 0.0.0.0 bn4sch102110124.wns.windows.com
	echo 0.0.0.0 bn1304-e.1drv.com
	echo 0.0.0.0 bn1306-a.1drv.com
	echo 0.0.0.0 bn1306-e.1drv.com
	echo 0.0.0.0 bn1306-g.1drv.com
	echo 0.0.0.0 browser.pipe.aria.microsoft.com
	echo 0.0.0.0 bs.serving-sys.com
	echo 0.0.0.0 by3301-a.1drv.com
	echo 0.0.0.0 by3301-c.1drv.com
	echo 0.0.0.0 by3301-e.1drv.com
	echo 0.0.0.0 c-0001.dc-msedge.net
	echo 0.0.0.0 c.atdmt.com
	echo 0.0.0.0 c.msn.com
	echo 0.0.0.0 ca.telemetry.microsoft.com
	echo 0.0.0.0 cache.datamart.windows.com
	echo 0.0.0.0 candycrushsoda.king.com
	echo 0.0.0.0 cdn.atdmt.com
	echo 0.0.0.0 cdn.content.prod.cms.msn.com
	echo 0.0.0.0 cdn.onenote.net
	echo 0.0.0.0 cds1.stn.llnw.net
	echo 0.0.0.0 cds10.stn.llnw.net
	echo 0.0.0.0 cds26.ams9.msecn.net
	echo 0.0.0.0 cds27.ory.llnw.net
	echo 0.0.0.0 cds38.ory.llnw.net
	echo 0.0.0.0 cds46.ory.llnw.net
	echo 0.0.0.0 cds54.ory.llnw.net
	echo 0.0.0.0 cds177.dus.llnw.net
	echo 0.0.0.0 cds299.lcy.llnw.net
	echo 0.0.0.0 cds308.lcy.llnw.net
	echo 0.0.0.0 cds310.lcy.llnw.net
	echo 0.0.0.0 cds405.lcy.llnw.net
	echo 0.0.0.0 cds406.lcy.llnw.net
	echo 0.0.0.0 cds407.fra.llnw.net
	echo 0.0.0.0 cds416.lcy.llnw.net
	echo 0.0.0.0 cds421.lcy.llnw.net
	echo 0.0.0.0 cds422.lcy.llnw.net
	echo 0.0.0.0 cds425.lcy.llnw.net
	echo 0.0.0.0 cds426.lcy.llnw.net
	echo 0.0.0.0 cds447.lcy.llnw.net
	echo 0.0.0.0 cds458.lcy.llnw.net
	echo 0.0.0.0 cds459.lcy.llnw.net
	echo 0.0.0.0 cds461.lcy.llnw.net
	echo 0.0.0.0 cds468.lcy.llnw.net
	echo 0.0.0.0 cds469.lcy.llnw.net
	echo 0.0.0.0 cds471.lcy.llnw.net
	echo 0.0.0.0 cds483.lcy.llnw.net
	echo 0.0.0.0 cds484.lcy.llnw.net
	echo 0.0.0.0 cds489.lcy.llnw.net
	echo 0.0.0.0 cds493.lcy.llnw.net
	echo 0.0.0.0 cds494.lcy.llnw.net
	echo 0.0.0.0 cds812.lon.llnw.net
	echo 0.0.0.0 cds815.lon.llnw.net
	echo 0.0.0.0 cds818.lon.llnw.net
	echo 0.0.0.0 cds832.lon.llnw.net
	echo 0.0.0.0 cds836.lon.llnw.net
	echo 0.0.0.0 cds840.lon.llnw.net
	echo 0.0.0.0 cds843.lon.llnw.net
	echo 0.0.0.0 cds857.lon.llnw.net
	echo 0.0.0.0 cds868.lon.llnw.net
	echo 0.0.0.0 cds869.lon.llnw.net
	echo 0.0.0.0 cds965.lon.llnw.net
	echo 0.0.0.0 cds1203.lon.llnw.net
	echo 0.0.0.0 cds1204.lon.llnw.net
	echo 0.0.0.0 cds1209.lon.llnw.net
	echo 0.0.0.0 cds1219.lon.llnw.net
	echo 0.0.0.0 cds1228.lon.llnw.net
	echo 0.0.0.0 cds1244.lon.llnw.net
	echo 0.0.0.0 cds1257.lon.llnw.net
	echo 0.0.0.0 cds1265.lon.llnw.net
	echo 0.0.0.0 cds1269.lon.llnw.net
	echo 0.0.0.0 cds1273.lon.llnw.net
	echo 0.0.0.0 cds1285.lon.llnw.net
	echo 0.0.0.0 cds1287.lon.llnw.net
	echo 0.0.0.0 cds1289.lon.llnw.net
	echo 0.0.0.0 cds1293.lon.llnw.net
	echo 0.0.0.0 cds1307.lon.llnw.net
	echo 0.0.0.0 cds1310.lon.llnw.net
	echo 0.0.0.0 cds1325.lon.llnw.net
	echo 0.0.0.0 cds1327.lon.llnw.net
	echo 0.0.0.0 cds20005.stn.llnw.net
	echo 0.0.0.0 cds20404.lcy.llnw.net
	echo 0.0.0.0 cds20411.lcy.llnw.net
	echo 0.0.0.0 cds20415.lcy.llnw.net
	echo 0.0.0.0 cds20416.lcy.llnw.net
	echo 0.0.0.0 cds20417.lcy.llnw.net
	echo 0.0.0.0 cds20424.lcy.llnw.net
	echo 0.0.0.0 cds20425.lcy.llnw.net
	echo 0.0.0.0 cds20431.lcy.llnw.net
	echo 0.0.0.0 cds20435.lcy.llnw.net
	echo 0.0.0.0 cds20440.lcy.llnw.net
	echo 0.0.0.0 cds20443.lcy.llnw.net
	echo 0.0.0.0 cds20445.lcy.llnw.net
	echo 0.0.0.0 cds20450.lcy.llnw.net
	echo 0.0.0.0 cds20452.lcy.llnw.net
	echo 0.0.0.0 cds20457.lcy.llnw.net
	echo 0.0.0.0 cds20461.lcy.llnw.net
	echo 0.0.0.0 cds20469.lcy.llnw.net
	echo 0.0.0.0 cds20475.lcy.llnw.net
	echo 0.0.0.0 cds20482.lcy.llnw.net
	echo 0.0.0.0 cds20485.lcy.llnw.net
	echo 0.0.0.0 cds20495.lcy.llnw.net
	echo 0.0.0.0 cds21205.lon.llnw.net
	echo 0.0.0.0 cds21207.lon.llnw.net
	echo 0.0.0.0 cds21225.lon.llnw.net
	echo 0.0.0.0 cds21229.lon.llnw.net
	echo 0.0.0.0 cds21233.lon.llnw.net
	echo 0.0.0.0 cds21238.lon.llnw.net
	echo 0.0.0.0 cds21244.lon.llnw.net
	echo 0.0.0.0 cds21249.lon.llnw.net
	echo 0.0.0.0 cds21256.lon.llnw.net
	echo 0.0.0.0 cds21257.lon.llnw.net
	echo 0.0.0.0 cds21258.lon.llnw.net
	echo 0.0.0.0 cds21261.lon.llnw.net
	echo 0.0.0.0 cds21267.lon.llnw.net
	echo 0.0.0.0 cds21278.lon.llnw.net
	echo 0.0.0.0 cds21281.lon.llnw.net
	echo 0.0.0.0 cds21293.lon.llnw.net
	echo 0.0.0.0 cds21309.lon.llnw.net
	echo 0.0.0.0 cds21313.lon.llnw.net
	echo 0.0.0.0 cds21321.lon.llnw.net
	echo 0.0.0.0 cds30027.stn.llnw.net
	echo 0.0.0.0 ceuswatcab01.blob.core.windows.net
	echo 0.0.0.0 ceuswatcab02.blob.core.windows.net
	echo 0.0.0.0 ch1-cor001.api.p001.1drv.com
	echo 0.0.0.0 ch1-cor002.api.p001.1drv.com
	echo 0.0.0.0 ch3301-c.1drv.com
	echo 0.0.0.0 ch3301-e.1drv.com
	echo 0.0.0.0 ch3301-g.1drv.com
	echo 0.0.0.0 ch3302-c.1drv.com
	echo 0.0.0.0 ch3302-e.1drv.com
	echo 0.0.0.0 choice.microsoft.com
	echo 0.0.0.0 choice.microsoft.com.nsatc.net
	echo 0.0.0.0 choice.microsoft.com.nstac.net
	echo 0.0.0.0 client.wns.windows.com
	echo 0.0.0.0 clientconfig.passport.net
	echo 0.0.0.0 compatexchange1.trafficmanager.net
	echo 0.0.0.0 compatexchange.cloudapp.net
	echo 0.0.0.0 continuum.dds.microsoft.com
	echo 0.0.0.0 corp.sts.microsoft.com
	echo 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com
	echo 0.0.0.0 cp101-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 cp201-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 cp401-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 cs1.wpc.v0cdn.net
	echo 0.0.0.0 cy2.vortex.data.microsoft.com.akadns.net
	echo 0.0.0.0 data.microsoft.com
	echo 0.0.0.0 data.msn.com
	echo 0.0.0.0 db3aqu.atdmt.com
	echo 0.0.0.0 db3wns2011111.wns.windows.com
	echo 0.0.0.0 db5-eap.settings-win.data.microsoft.com.akadns.net
	echo 0.0.0.0 db5.settings-win.data.microsoft.com.akadns.net
	echo 0.0.0.0 db5.settings.data.microsoft.com.akadns.net
	echo 0.0.0.0 db5.vortex.data.microsoft.com.akadns.net
	echo 0.0.0.0 db5.wns.windows.com
	echo 0.0.0.0 db5sch101100122.wns.windows.com
	echo 0.0.0.0 db5sch101100127.wns.windows.com
	echo 0.0.0.0 db5sch101100831.wns.windows.com
	echo 0.0.0.0 db5sch101100835.wns.windows.com
	echo 0.0.0.0 db5sch101100917.wns.windows.com
	echo 0.0.0.0 db5sch101100925.wns.windows.com
	echo 0.0.0.0 db5sch101100928.wns.windows.com
	echo 0.0.0.0 db5sch101100938.wns.windows.com
	echo 0.0.0.0 db5sch101101001.wns.windows.com
	echo 0.0.0.0 db5sch101101022.wns.windows.com
	echo 0.0.0.0 db5sch101101024.wns.windows.com
	echo 0.0.0.0 db5sch101101031.wns.windows.com
	echo 0.0.0.0 db5sch101101034.wns.windows.com
	echo 0.0.0.0 db5sch101101042.wns.windows.com
	echo 0.0.0.0 db5sch101101044.wns.windows.com
	echo 0.0.0.0 db5sch101101122.wns.windows.com
	echo 0.0.0.0 db5sch101101123.wns.windows.com
	echo 0.0.0.0 db5sch101101125.wns.windows.com
	echo 0.0.0.0 db5sch101101128.wns.windows.com
	echo 0.0.0.0 db5sch101101129.wns.windows.com
	echo 0.0.0.0 db5sch101101133.wns.windows.com
	echo 0.0.0.0 db5sch101101145.wns.windows.com
	echo 0.0.0.0 db5sch101101209.wns.windows.com
	echo 0.0.0.0 db5sch101101221.wns.windows.com
	echo 0.0.0.0 db5sch101101228.wns.windows.com
	echo 0.0.0.0 db5sch101101231.wns.windows.com
	echo 0.0.0.0 db5sch101101237.wns.windows.com
	echo 0.0.0.0 db5sch101101317.wns.windows.com
	echo 0.0.0.0 db5sch101101324.wns.windows.com
	echo 0.0.0.0 db5sch101101329.wns.windows.com
	echo 0.0.0.0 db5sch101101333.wns.windows.com
	echo 0.0.0.0 db5sch101101334.wns.windows.com
	echo 0.0.0.0 db5sch101101338.wns.windows.com
	echo 0.0.0.0 db5sch101101419.wns.windows.com
	echo 0.0.0.0 db5sch101101424.wns.windows.com
	echo 0.0.0.0 db5sch101101426.wns.windows.com
	echo 0.0.0.0 db5sch101101427.wns.windows.com
	echo 0.0.0.0 db5sch101101430.wns.windows.com
	echo 0.0.0.0 db5sch101101445.wns.windows.com
	echo 0.0.0.0 db5sch101101511.wns.windows.com
	echo 0.0.0.0 db5sch101101519.wns.windows.com
	echo 0.0.0.0 db5sch101101529.wns.windows.com
	echo 0.0.0.0 db5sch101101535.wns.windows.com
	echo 0.0.0.0 db5sch101101541.wns.windows.com
	echo 0.0.0.0 db5sch101101543.wns.windows.com
	echo 0.0.0.0 db5sch101101608.wns.windows.com
	echo 0.0.0.0 db5sch101101618.wns.windows.com
	echo 0.0.0.0 db5sch101101629.wns.windows.com
	echo 0.0.0.0 db5sch101101631.wns.windows.com
	echo 0.0.0.0 db5sch101101633.wns.windows.com
	echo 0.0.0.0 db5sch101101640.wns.windows.com
	echo 0.0.0.0 db5sch101101711.wns.windows.com
	echo 0.0.0.0 db5sch101101722.wns.windows.com
	echo 0.0.0.0 db5sch101101739.wns.windows.com
	echo 0.0.0.0 db5sch101101745.wns.windows.com
	echo 0.0.0.0 db5sch101101813.wns.windows.com
	echo 0.0.0.0 db5sch101101820.wns.windows.com
	echo 0.0.0.0 db5sch101101826.wns.windows.com
	echo 0.0.0.0 db5sch101101835.wns.windows.com
	echo 0.0.0.0 db5sch101101837.wns.windows.com
	echo 0.0.0.0 db5sch101101844.wns.windows.com
	echo 0.0.0.0 db5sch101101907.wns.windows.com
	echo 0.0.0.0 db5sch101101914.wns.windows.com
	echo 0.0.0.0 db5sch101101929.wns.windows.com
	echo 0.0.0.0 db5sch101101939.wns.windows.com
	echo 0.0.0.0 db5sch101101941.wns.windows.com
	echo 0.0.0.0 db5sch101102015.wns.windows.com
	echo 0.0.0.0 db5sch101102017.wns.windows.com
	echo 0.0.0.0 db5sch101102019.wns.windows.com
	echo 0.0.0.0 db5sch101102023.wns.windows.com
	echo 0.0.0.0 db5sch101102025.wns.windows.com
	echo 0.0.0.0 db5sch101102032.wns.windows.com
	echo 0.0.0.0 db5sch101102033.wns.windows.com
	echo 0.0.0.0 db5sch101110108.wns.windows.com
	echo 0.0.0.0 db5sch101110109.wns.windows.com
	echo 0.0.0.0 db5sch101110114.wns.windows.com
	echo 0.0.0.0 db5sch101110135.wns.windows.com
	echo 0.0.0.0 db5sch101110142.wns.windows.com
	echo 0.0.0.0 db5sch101110204.wns.windows.com
	echo 0.0.0.0 db5sch101110206.wns.windows.com
	echo 0.0.0.0 db5sch101110214.wns.windows.com
	echo 0.0.0.0 db5sch101110225.wns.windows.com
	echo 0.0.0.0 db5sch101110232.wns.windows.com
	echo 0.0.0.0 db5sch101110245.wns.windows.com
	echo 0.0.0.0 db5sch101110315.wns.windows.com
	echo 0.0.0.0 db5sch101110323.wns.windows.com
	echo 0.0.0.0 db5sch101110325.wns.windows.com
	echo 0.0.0.0 db5sch101110328.wns.windows.com
	echo 0.0.0.0 db5sch101110331.wns.windows.com
	echo 0.0.0.0 db5sch101110341.wns.windows.com
	echo 0.0.0.0 db5sch101110343.wns.windows.com
	echo 0.0.0.0 db5sch101110345.wns.windows.com
	echo 0.0.0.0 db5sch101110403.wns.windows.com
	echo 0.0.0.0 db5sch101110419.wns.windows.com
	echo 0.0.0.0 db5sch101110438.wns.windows.com
	echo 0.0.0.0 db5sch101110442.wns.windows.com
	echo 0.0.0.0 db5sch101110501.wns.windows.com
	echo 0.0.0.0 db5sch101110527.wns.windows.com
	echo 0.0.0.0 db5sch101110533.wns.windows.com
	echo 0.0.0.0 db5sch101110618.wns.windows.com
	echo 0.0.0.0 db5sch101110622.wns.windows.com
	echo 0.0.0.0 db5sch101110624.wns.windows.com
	echo 0.0.0.0 db5sch101110626.wns.windows.com
	echo 0.0.0.0 db5sch101110634.wns.windows.com
	echo 0.0.0.0 db5sch101110705.wns.windows.com
	echo 0.0.0.0 db5sch101110724.wns.windows.com
	echo 0.0.0.0 db5sch101110740.wns.windows.com
	echo 0.0.0.0 db5sch101110810.wns.windows.com
	echo 0.0.0.0 db5sch101110816.wns.windows.com
	echo 0.0.0.0 db5sch101110821.wns.windows.com
	echo 0.0.0.0 db5sch101110822.wns.windows.com
	echo 0.0.0.0 db5sch101110825.wns.windows.com
	echo 0.0.0.0 db5sch101110828.wns.windows.com
	echo 0.0.0.0 db5sch101110835.wns.windows.com
	echo 0.0.0.0 db5sch101110919.wns.windows.com
	echo 0.0.0.0 db5sch101110921.wns.windows.com
	echo 0.0.0.0 db5sch101110923.wns.windows.com
	echo 0.0.0.0 db5sch101110929.wns.windows.com
	echo 0.0.0.0 db5sch103081814.wns.windows.com
	echo 0.0.0.0 db5sch103082011.wns.windows.com
	echo 0.0.0.0 db5sch103082111.wns.windows.com
	echo 0.0.0.0 db5sch103082308.wns.windows.com
	echo 0.0.0.0 db5sch103082406.wns.windows.com
	echo 0.0.0.0 db5sch103082409.wns.windows.com
	echo 0.0.0.0 db5sch103082609.wns.windows.com
	echo 0.0.0.0 db5sch103082611.wns.windows.com
	echo 0.0.0.0 db5sch103082709.wns.windows.com
	echo 0.0.0.0 db5sch103082712.wns.windows.com
	echo 0.0.0.0 db5sch103082806.wns.windows.com
	echo 0.0.0.0 db5sch103090115.wns.windows.com
	echo 0.0.0.0 db5sch103090415.wns.windows.com
	echo 0.0.0.0 db5sch103090513.wns.windows.com
	echo 0.0.0.0 db5sch103090515.wns.windows.com
	echo 0.0.0.0 db5sch103090608.wns.windows.com
	echo 0.0.0.0 db5sch103090806.wns.windows.com
	echo 0.0.0.0 db5sch103090814.wns.windows.com
	echo 0.0.0.0 db5sch103090906.wns.windows.com
	echo 0.0.0.0 db5sch103091011.wns.windows.com
	echo 0.0.0.0 db5sch103091012.wns.windows.com
	echo 0.0.0.0 db5sch103091106.wns.windows.com
	echo 0.0.0.0 db5sch103091108.wns.windows.com
	echo 0.0.0.0 db5sch103091212.wns.windows.com
	echo 0.0.0.0 db5sch103091311.wns.windows.com
	echo 0.0.0.0 db5sch103091414.wns.windows.com
	echo 0.0.0.0 db5sch103091511.wns.windows.com
	echo 0.0.0.0 db5sch103091617.wns.windows.com
	echo 0.0.0.0 db5sch103091715.wns.windows.com
	echo 0.0.0.0 db5sch103091817.wns.windows.com
	echo 0.0.0.0 db5sch103091908.wns.windows.com
	echo 0.0.0.0 db5sch103091911.wns.windows.com
	echo 0.0.0.0 db5sch103092010.wns.windows.com
	echo 0.0.0.0 db5sch103092108.wns.windows.com
	echo 0.0.0.0 db5sch103092109.wns.windows.com
	echo 0.0.0.0 db5sch103092209.wns.windows.com
	echo 0.0.0.0 db5sch103092210.wns.windows.com
	echo 0.0.0.0 db5sch103092509.wns.windows.com
	echo 0.0.0.0 db5sch103100117.wns.windows.com
	echo 0.0.0.0 db5sch103100121.wns.windows.com
	echo 0.0.0.0 db5sch103100221.wns.windows.com
	echo 0.0.0.0 db5sch103100313.wns.windows.com
	echo 0.0.0.0 db5sch103100314.wns.windows.com
	echo 0.0.0.0 db5sch103100510.wns.windows.com
	echo 0.0.0.0 db5sch103100511.wns.windows.com
	echo 0.0.0.0 db5sch103100611.wns.windows.com
	echo 0.0.0.0 db5sch103100712.wns.windows.com
	echo 0.0.0.0 db5sch103101105.wns.windows.com
	echo 0.0.0.0 db5sch103101208.wns.windows.com
	echo 0.0.0.0 db5sch103101212.wns.windows.com
	echo 0.0.0.0 db5sch103101314.wns.windows.com
	echo 0.0.0.0 db5sch103101411.wns.windows.com
	echo 0.0.0.0 db5sch103101413.wns.windows.com
	echo 0.0.0.0 db5sch103101513.wns.windows.com
	echo 0.0.0.0 db5sch103101610.wns.windows.com
	echo 0.0.0.0 db5sch103101611.wns.windows.com
	echo 0.0.0.0 db5sch103101705.wns.windows.com
	echo 0.0.0.0 db5sch103101711.wns.windows.com
	echo 0.0.0.0 db5sch103101909.wns.windows.com
	echo 0.0.0.0 db5sch103101914.wns.windows.com
	echo 0.0.0.0 db5sch103102009.wns.windows.com
	echo 0.0.0.0 db5sch103102112.wns.windows.com
	echo 0.0.0.0 db5sch103102203.wns.windows.com
	echo 0.0.0.0 db5sch103102209.wns.windows.com
	echo 0.0.0.0 db5sch103102310.wns.windows.com
	echo 0.0.0.0 db5sch103102404.wns.windows.com
	echo 0.0.0.0 db5sch103102609.wns.windows.com
	echo 0.0.0.0 db5sch103102610.wns.windows.com
	echo 0.0.0.0 db5sch103102805.wns.windows.com
	echo 0.0.0.0 db5wns1d.wns.windows.com
	echo 0.0.0.0 db6sch102090104.wns.windows.com
	echo 0.0.0.0 db6sch102090112.wns.windows.com
	echo 0.0.0.0 db6sch102090116.wns.windows.com
	echo 0.0.0.0 db6sch102090122.wns.windows.com
	echo 0.0.0.0 db6sch102090203.wns.windows.com
	echo 0.0.0.0 db6sch102090206.wns.windows.com
	echo 0.0.0.0 db6sch102090208.wns.windows.com
	echo 0.0.0.0 db6sch102090209.wns.windows.com
	echo 0.0.0.0 db6sch102090211.wns.windows.com
	echo 0.0.0.0 db6sch102090305.wns.windows.com
	echo 0.0.0.0 db6sch102090306.wns.windows.com
	echo 0.0.0.0 db6sch102090308.wns.windows.com
	echo 0.0.0.0 db6sch102090311.wns.windows.com
	echo 0.0.0.0 db6sch102090313.wns.windows.com
	echo 0.0.0.0 db6sch102090410.wns.windows.com
	echo 0.0.0.0 db6sch102090412.wns.windows.com
	echo 0.0.0.0 db6sch102090504.wns.windows.com
	echo 0.0.0.0 db6sch102090510.wns.windows.com
	echo 0.0.0.0 db6sch102090512.wns.windows.com
	echo 0.0.0.0 db6sch102090513.wns.windows.com
	echo 0.0.0.0 db6sch102090514.wns.windows.com
	echo 0.0.0.0 db6sch102090519.wns.windows.com
	echo 0.0.0.0 db6sch102090613.wns.windows.com
	echo 0.0.0.0 db6sch102090619.wns.windows.com
	echo 0.0.0.0 db6sch102090810.wns.windows.com
	echo 0.0.0.0 db6sch102090811.wns.windows.com
	echo 0.0.0.0 db6sch102090902.wns.windows.com
	echo 0.0.0.0 db6sch102090905.wns.windows.com
	echo 0.0.0.0 db6sch102090907.wns.windows.com
	echo 0.0.0.0 db6sch102090908.wns.windows.com
	echo 0.0.0.0 db6sch102090910.wns.windows.com
	echo 0.0.0.0 db6sch102090911.wns.windows.com
	echo 0.0.0.0 db6sch102091003.wns.windows.com
	echo 0.0.0.0 db6sch102091007.wns.windows.com
	echo 0.0.0.0 db6sch102091008.wns.windows.com
	echo 0.0.0.0 db6sch102091009.wns.windows.com
	echo 0.0.0.0 db6sch102091011.wns.windows.com
	echo 0.0.0.0 db6sch102091103.wns.windows.com
	echo 0.0.0.0 db6sch102091105.wns.windows.com
	echo 0.0.0.0 db6sch102091204.wns.windows.com
	echo 0.0.0.0 db6sch102091209.wns.windows.com
	echo 0.0.0.0 db6sch102091305.wns.windows.com
	echo 0.0.0.0 db6sch102091307.wns.windows.com
	echo 0.0.0.0 db6sch102091308.wns.windows.com
	echo 0.0.0.0 db6sch102091309.wns.windows.com
	echo 0.0.0.0 db6sch102091314.wns.windows.com
	echo 0.0.0.0 db6sch102091412.wns.windows.com
	echo 0.0.0.0 db6sch102091503.wns.windows.com
	echo 0.0.0.0 db6sch102091507.wns.windows.com
	echo 0.0.0.0 db6sch102091602.wns.windows.com
	echo 0.0.0.0 db6sch102091603.wns.windows.com
	echo 0.0.0.0 db6sch102091606.wns.windows.com
	echo 0.0.0.0 db6sch102091607.wns.windows.com
	echo 0.0.0.0 deploy.static.akamaitechnologies.com
	echo 0.0.0.0 dev.virtualearth.net
	echo 0.0.0.0 df.telemetry.microsoft.com
	echo 0.0.0.0 diagnostics.support.microsoft.com
	echo 0.0.0.0 disc101-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 disc201-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 disc401-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 dmd.metaservices.microsoft.com
	echo 0.0.0.0 eaus2watcab01.blob.core.windows.net
	echo 0.0.0.0 eaus2watcab02.blob.core.windows.net
	echo 0.0.0.0 ec.atdmt.com
	echo 0.0.0.0 ecn.dev.virtualearth.net
	echo 0.0.0.0 edge.microsoft.com
	echo 0.0.0.0 eu.vortex-win.data.microsft.com
	echo 0.0.0.0 eu.vortex.data.microsoft.com
	echo 0.0.0.0 fe2.update.microsoft.com.akadns.net
	echo 0.0.0.0 fe3.delivery.dsp.mp.microsoft.com.nsatc.net
	echo 0.0.0.0 feedback.microsoft-hohm.com
	echo 0.0.0.0 feedback.search.microsoft.com
	echo 0.0.0.0 feedback.windows.com
	echo 0.0.0.0 flex.msn.com
	echo 0.0.0.0 fs.microsoft.com
	echo 0.0.0.0 g.msn.com
	echo 0.0.0.0 geo-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 geo.settings-win.data.microsoft.com.akadns.net
	echo 0.0.0.0 geo.settings.data.microsoft.com.akadns.net
	echo 0.0.0.0 geo.vortex.data.microsoft.com.akadns.net
	echo 0.0.0.0 geover-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 h1.msn.com
	echo 0.0.0.0 h2.msn.com
	echo 0.0.0.0 hk2.settings.data.microsoft.com.akadns.net
	echo 0.0.0.0 hk2.wns.windows.com
	echo 0.0.0.0 hk2sch130020721.wns.windows.com
	echo 0.0.0.0 hk2sch130020723.wns.windows.com
	echo 0.0.0.0 hk2sch130020726.wns.windows.com
	echo 0.0.0.0 hk2sch130020729.wns.windows.com
	echo 0.0.0.0 hk2sch130020732.wns.windows.com
	echo 0.0.0.0 hk2sch130020824.wns.windows.com
	echo 0.0.0.0 hk2sch130020843.wns.windows.com
	echo 0.0.0.0 hk2sch130020851.wns.windows.com
	echo 0.0.0.0 hk2sch130020854.wns.windows.com
	echo 0.0.0.0 hk2sch130020855.wns.windows.com
	echo 0.0.0.0 hk2sch130020924.wns.windows.com
	echo 0.0.0.0 hk2sch130020936.wns.windows.com
	echo 0.0.0.0 hk2sch130020940.wns.windows.com
	echo 0.0.0.0 hk2sch130020956.wns.windows.com
	echo 0.0.0.0 hk2sch130020958.wns.windows.com
	echo 0.0.0.0 hk2sch130020961.wns.windows.com
	echo 0.0.0.0 hk2sch130021017.wns.windows.com
	echo 0.0.0.0 hk2sch130021029.wns.windows.com
	echo 0.0.0.0 hk2sch130021035.wns.windows.com
	echo 0.0.0.0 hk2sch130021137.wns.windows.com
	echo 0.0.0.0 hk2sch130021142.wns.windows.com
	echo 0.0.0.0 hk2sch130021153.wns.windows.com
	echo 0.0.0.0 hk2sch130021217.wns.windows.com
	echo 0.0.0.0 hk2sch130021246.wns.windows.com
	echo 0.0.0.0 hk2sch130021249.wns.windows.com
	echo 0.0.0.0 hk2sch130021260.wns.windows.com
	echo 0.0.0.0 hk2sch130021264.wns.windows.com
	echo 0.0.0.0 hk2sch130021322.wns.windows.com
	echo 0.0.0.0 hk2sch130021323.wns.windows.com
	echo 0.0.0.0 hk2sch130021329.wns.windows.com
	echo 0.0.0.0 hk2sch130021334.wns.windows.com
	echo 0.0.0.0 hk2sch130021360.wns.windows.com
	echo 0.0.0.0 hk2sch130021432.wns.windows.com
	echo 0.0.0.0 hk2sch130021433.wns.windows.com
	echo 0.0.0.0 hk2sch130021435.wns.windows.com
	echo 0.0.0.0 hk2sch130021437.wns.windows.com
	echo 0.0.0.0 hk2sch130021440.wns.windows.com
	echo 0.0.0.0 hk2sch130021450.wns.windows.com
	echo 0.0.0.0 hk2sch130021518.wns.windows.com
	echo 0.0.0.0 hk2sch130021523.wns.windows.com
	echo 0.0.0.0 hk2sch130021526.wns.windows.com
	echo 0.0.0.0 hk2sch130021527.wns.windows.com
	echo 0.0.0.0 hk2sch130021544.wns.windows.com
	echo 0.0.0.0 hk2sch130021554.wns.windows.com
	echo 0.0.0.0 hk2sch130021618.wns.windows.com
	echo 0.0.0.0 hk2sch130021634.wns.windows.com
	echo 0.0.0.0 hk2sch130021638.wns.windows.com
	echo 0.0.0.0 hk2sch130021646.wns.windows.com
	echo 0.0.0.0 hk2sch130021652.wns.windows.com
	echo 0.0.0.0 hk2sch130021654.wns.windows.com
	echo 0.0.0.0 hk2sch130021657.wns.windows.com
	echo 0.0.0.0 hk2sch130021723.wns.windows.com
	echo 0.0.0.0 hk2sch130021726.wns.windows.com
	echo 0.0.0.0 hk2sch130021727.wns.windows.com
	echo 0.0.0.0 hk2sch130021730.wns.windows.com
	echo 0.0.0.0 hk2sch130021731.wns.windows.com
	echo 0.0.0.0 hk2sch130021754.wns.windows.com
	echo 0.0.0.0 hk2sch130021829.wns.windows.com
	echo 0.0.0.0 hk2sch130021830.wns.windows.com
	echo 0.0.0.0 hk2sch130021833.wns.windows.com
	echo 0.0.0.0 hk2sch130021840.wns.windows.com
	echo 0.0.0.0 hk2sch130021842.wns.windows.com
	echo 0.0.0.0 hk2sch130021851.wns.windows.com
	echo 0.0.0.0 hk2sch130021852.wns.windows.com
	echo 0.0.0.0 hk2sch130021927.wns.windows.com
	echo 0.0.0.0 hk2sch130021928.wns.windows.com
	echo 0.0.0.0 hk2sch130021929.wns.windows.com
	echo 0.0.0.0 hk2sch130021958.wns.windows.com
	echo 0.0.0.0 hk2sch130022035.wns.windows.com
	echo 0.0.0.0 hk2sch130022041.wns.windows.com
	echo 0.0.0.0 hk2sch130022049.wns.windows.com
	echo 0.0.0.0 hk2sch130022135.wns.windows.com
	echo 0.0.0.0 hk2wns1.wns.windows.com
	echo 0.0.0.0 hk2wns1b.wns.windows.com
	echo 0.0.0.0 i1.services.social.microsoft.com
	echo 0.0.0.0 i1.services.social.microsoft.com.nsatc.net
	echo 0.0.0.0 i-bl6p-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-by3p-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-by3p-cor002.api.p001.1drv.com
	echo 0.0.0.0 i-ch1-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-ch1-cor002.api.p001.1drv.com
	echo 0.0.0.0 i-sn2-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-sn2-cor002.api.p001.1drv.com
	echo 0.0.0.0 ieonlinews.microsoft.com
	echo 0.0.0.0 ieonlinews.trafficmanager.net
	echo 0.0.0.0 img-s-msn-com.akamaized.net
	echo 0.0.0.0 inference.location.live.net
	echo 0.0.0.0 insiderppe.cloudapp.net
	echo 0.0.0.0 insideruser.trafficmanager.net
	echo 0.0.0.0 kmwatson.events.data.microsoft.com
	echo 0.0.0.0 kmwatsonc.events.data.microsoft.com
	echo 0.0.0.0 kv101-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 kv201-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 kv401-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 lb1.www.ms.akadns.net
	echo 0.0.0.0 live.rads.msn.com
	echo 0.0.0.0 ls2web.redmond.corp.microsoft.com
	echo 0.0.0.0 m.adnxs.com
	echo 0.0.0.0 m.hotmail.com
	echo 0.0.0.0 mediaredirect.microsoft.com
	echo 0.0.0.0 mobile.pipe.aria.microsoft.com
	echo 0.0.0.0 modern.watson.data.microsoft.com.akadns.net
	echo 0.0.0.0 msedge.net
	echo 0.0.0.0 msftconnecttest.com
	echo 0.0.0.0 msftncsi.com
	echo 0.0.0.0 msnbot-65-55-108-23.search.msn.com
	echo 0.0.0.0 msnbot-207-46-194-33.search.msn.com
	echo 0.0.0.0 msntest.serving-sys.com
	echo 0.0.0.0 nexus.officeapps.live.com
	echo 0.0.0.0 nexusrules.officeapps.live.com
	echo 0.0.0.0 nw-umwatson.events.data.microsoft.com
	echo 0.0.0.0 oca.telemetry.microsoft.com
	echo 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 oca.telemetry.microsoft.us
	echo 0.0.0.0 officeclient.microsoft.com
	echo 0.0.0.0 oneclient.sfx.ms
	echo 0.0.0.0 onecollector.cloudapp.aria.akadns.net
	echo 0.0.0.0 par02p.wns.windows.com
	echo 0.0.0.0 pre.footprintpredict.com
	echo 0.0.0.0 presence.teams.live.com
	echo 0.0.0.0 preview.msn.com
	echo 0.0.0.0 pricelist.skype.com
	echo 0.0.0.0 pti.store.microsoft.com
	echo 0.0.0.0 query.prod.cms.rt.microsoft.com
	echo 0.0.0.0 rad.live.com
	echo 0.0.0.0 rad.msn.com
	echo 0.0.0.0 redir.metaservices.microsoft.com
	echo 0.0.0.0 register.cdpcs.microsoft.com
	echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com
	echo 0.0.0.0 romeccs.microsoft.com
	echo 0.0.0.0 s0.2mdn.net
	echo 0.0.0.0 s.gateway.messenger.live.com
	echo 0.0.0.0 schemas.microsoft.akadns.net
	echo 0.0.0.0 scorecardresearch.com
	echo 0.0.0.0 secure.adnxs.com
	echo 0.0.0.0 secure.flashtalking.com
	echo 0.0.0.0 services.wes.df.telemetry.microsoft.com
	echo 0.0.0.0 settings-sandbox.data.microsoft.com
	echo 0.0.0.0 settings-ssl.xboxlive.com
	echo 0.0.0.0 settings-win-ppe.data.microsoft.com
	echo 0.0.0.0 settings-win.data.microsoft.com
	echo 0.0.0.0 settings.data.glbdns2.microsoft.com
	echo 0.0.0.0 settings.data.microsof.com
	echo 0.0.0.0 settingsfd-geo.trafficmanager.net
	echo 0.0.0.0 sg2p.wns.windows.com
	echo 0.0.0.0 sls.update.microsoft.com.akadns.net
	echo 0.0.0.0 sn3301-c.1drv.com
	echo 0.0.0.0 sn3301-e.1drv.com
	echo 0.0.0.0 sn3301-g.1drv.com
	echo 0.0.0.0 sO.2mdn.net
	echo 0.0.0.0 so.2mdn.net
	echo 0.0.0.0 spynet2.microsoft.com
	echo 0.0.0.0 spynetalt.microsoft.com
	echo 0.0.0.0 spyneteurope.microsoft.akadns.net
	echo 0.0.0.0 sqm.df.telemetry.microsoft.com
	echo 0.0.0.0 sqm.telemetry.microsoft.com
	echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 ssw.live.com
	echo 0.0.0.0 static.2mdn.net
	echo 0.0.0.0 stats-microsoft.com
	echo 0.0.0.0 statsfe1.ws.microsoft.com
	echo 0.0.0.0 statsfe2.update.microsoft.com.akadns.net
	echo 0.0.0.0 statsfe2.ws.microsoft.com
	echo 0.0.0.0 storecatalogrevocation.storequality.microsoft.com
	echo 0.0.0.0 survey.watson.microsoft.com
	echo 0.0.0.0 t0.ssl.ak.dynamic.tiles.virtualearth.net
	echo 0.0.0.0 t0.ssl.ak.tiles.virtualearth.net
	echo 0.0.0.0 tele.trafficmanager.net
	echo 0.0.0.0 telecommand.telemetry.microsoft.com
	echo 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 telemetry.appex.bing.com
	echo 0.0.0.0 telemetry.appex.bing.net
	echo 0.0.0.0 telemetry.microsoft.com
	echo 0.0.0.0 telemetry.microsoft.comecho
	echo 0.0.0.0 telemetry.remoteapp.windowsazure.com
	echo 0.0.0.0 telemetry.urs.microsoft.com
	echo 0.0.0.0 teredo.ipv6.microsoft.com
	echo 0.0.0.0 test.activity.windows.com
	echo 0.0.0.0 tile-service.weather.microsoft.com
	echo 0.0.0.0 time.windows.com
	echo 0.0.0.0 tk2.plt.msn.com
	echo 0.0.0.0 tsfe.trafficshaping.dsp.mp.microsoft.com
	echo 0.0.0.0 ui.skype.com
	echo 0.0.0.0 uks.b.prd.ags.trafficmanager.net
	echo 0.0.0.0 umwatson.events.data.microsoft.com
	echo 0.0.0.0 umwatsonc.events.data.microsoft.com
	echo 0.0.0.0 umwatsonc.telemetry.microsoft.us
	echo 0.0.0.0 urs.microsoft.com.nsatc.net
	echo 0.0.0.0 urs.smartscreen.microsoft.com
	echo 0.0.0.0 us-v10.events.data.microsoft.com
	echo 0.0.0.0 us.vortex-win.data.microsft.com
	echo 0.0.0.0 us.vortex-win.data.microsoft.com
	echo 0.0.0.0 v10.events.data.microsoft.com
	echo 0.0.0.0 v10-win.vortex.data.microsft.com.akadns.net
	echo 0.0.0.0 v10-win.vortex.data.microsoft.com.akadns.net
	echo 0.0.0.0 v10.vortex-win.data.metron.live.com.nsatc.net
	echo 0.0.0.0 v10.vortex-win.data.microsft.com
	echo 0.0.0.0 v10.vortex-win.data.microsoft.com
	echo 0.0.0.0 v20.vortex-win.data.microsoft.com
	echo 0.0.0.0 version.hybrid.api.here.com
	echo 0.0.0.0 view.atdmt.com
	echo 0.0.0.0 vortex-bn2.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex-cy2.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex-db5.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex-hk2.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex-sandbox.data.microsoft.com
	echo 0.0.0.0 vortex-win-sandbox.data.microsoft.com
	echo 0.0.0.0 vortex-win.data.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex-win.data.microsoft.com
	echo 0.0.0.0 vortex.data.glbdns2.microsoft.com
	echo 0.0.0.0 vortex.data.metron.live.com.nsatc.net
	echo 0.0.0.0 vortex.data.microsoft.com
	echo 0.0.0.0 vsgallery.com
	echo 0.0.0.0 watson.live.com
	echo 0.0.0.0 watson.microsoft.com
	echo 0.0.0.0 watson.ppe.telemetry.microsoft.com
	echo 0.0.0.0 watson.telemetry.microsoft.com
	echo 0.0.0.0 watson.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 wdcp.microsoft.com
	echo 0.0.0.0 wdcpalt.microsoft.com
	echo 0.0.0.0 web.vortex.data.microsoft.com
	echo 0.0.0.0 wes.df.telemetry.microsoft.com
	echo 0.0.0.0 weus2watcab01.blob.core.windows.net
	echo 0.0.0.0 weus2watcab02.blob.core.windows.net
	echo 0.0.0.0 win8.ipv6.microsoft.com
	echo 0.0.0.0 win10-trt.msedge.net
	echo 0.0.0.0 win10.ipv6.microsoft.com
	echo 0.0.0.0 win1710.ipv6.microsoft.com
	echo 0.0.0.0 wns.notify.windows.com.akadns.net
	echo 0.0.0.0 wscont.apps.microsoft.com
	echo 0.0.0.0 www.msedge.net
	echo 0.0.0.0 www.msftncsi.com
	echo 0.0.0.0 xblgdvrassets3010.blob.core.windows.net
	echo 0.0.0.0 ztd.dds.microsoft.com
) >"%WINDIR%\System32\drivers\etc\hosts"

:: ====================


:: ====================
:: Networking Config
:: ====================

echo( && echo   • Configurating: Network Settings

>nul 2>&1 (
	nbtstat -R
	nbtstat -RR
	netsh branchcache reset
	netsh dhcpclient trace disable
	netsh http flush
	netsh nap reset
	netsh routing reset
	netsh rpc reset
	netsh trace stop
	netsh winhttp reset
	netsh winsock reset
	netsh winsock set autotuning off
	netsh interface reset all
)

:dns
cls && echo( && echo   Select a DNS provider: && echo(
echo   1 ^> [93mCloudflare[0m [1.1.1.1]
echo   2 ^> [94mGoogle[0m [8.8.8.8]
echo   3 ^> [91mQuad9[0m [9.9.9.9] && echo(
set /p "c=.  ► "
if '%c%'=='1' goto :choice_1
if '%c%'=='2' goto :choice_2
if '%c%'=='3' goto :choice_3
cls && echo( && echo   [31m# "%c%" isn't a valid option, please try again.[0m && >nul timeout /t 3
goto :dns
exit /b

:choice_1
set primary_dns=1.1.1.1
set secondary_dns=1.0.0.1
set ipv6_primary_dns=2606:4700:4700::1111
set ipv6_secondary_dns=2606:4700:4700::1001
goto :continue
exit /b

:choice_2
set primary_dns=8.8.8.8
set secondary_dns=8.8.4.4
set ipv6_primary_dns=2001:4860:4860::8888
set ipv6_secondary_dns=2001:4860:4860::8844
goto :continue
exit /b

:choice_3
set primary_dns=9.9.9.9
set secondary_dns=149.112.112.112
set ipv6_primary_dns=2620:fe::fe
set ipv6_secondary_dns=2620:fe::9
goto :continue
exit /b

:continue

>nul 2>&1 (
	rem Setting DNS servers
	for /f "skip=2 tokens=2 delims=," %%A in ('wmic nic where NetEnabled^=True get NetConnectionID /format:csv') do (
		for /f "delims=" %%B in ("%%A") do (
			netsh interface ipv4 set dnsservers "%%B" static "!primary_dns!" primary
			netsh interface ipv4 add dnsservers "%%B" "!secondary_dns!" index=2
			netsh interface ipv6 set dnsservers "%%B" static "!ipv6_primary_dns!" primary
			netsh interface ipv6 add dnsservers "%%B" "!ipv6_secondary_dns!" index=2
		)
	)
	ipconfig /flushdns
)

cls && echo( && echo   • Applying: Custom DNS servers

:: ====================


:: ====================
:: Software
:: ====================

set "packages=7zip.7zip"

ping -n 1 9.9.9.9 >nul 2>&1
if %errorlevel% 0 (
	for %%p in (%packages%) do (
		if exist "winget list | findstr %%p" (
			echo Installing package: %%p
			winget install -h --id "%%p"
		)
	)
	rem Launching program so the user can set it up.
	if exist "%PROGRAMFILES(X86)%\EverythingToolbar\EverythingToolbar.Launcher.exe" (
		"%PROGRAMFILES(X86)%\EverythingToolbar\EverythingToolbar.Launcher.exe"
	)
) else (
	echo( && echo   • Software Download: FAILED (No Internet)
)

:: ====================


:: ====================
:: Personalization
:: ====================

"SystemPropertiesPerformance.exe"
"ncpa.cpl"

:: ====================


:: ====================
:: Clean
:: ====================

echo( && echo   • Cleaning: System leftovers

>nul 2>&1 (
	arp -d *
	certutil -URLCache * delete

	del /f/s/q "%WINDIR%\Prefetch\*"
	del /f/s/q "%SystemDrive%\*.log"
	del /f/s/q "%SystemDrive%\Windows\Temp\*"
	del /f/s/q "%tmp%\*"

	powershell Clear-RecycleBin -Force -ErrorAction SilentlyContinue
	taskkill /f /im explorer.exe && explorer.exe
)

:: ====================


:: ====================

cls && echo( && echo   [92m• Windows Optimization Completed.[0m && timeout /t 3 >nul && goto :MENU

:: ====================
