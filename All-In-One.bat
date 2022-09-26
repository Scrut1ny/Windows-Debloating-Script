@echo off
setlocal enableDelayedExpansion
mode con:cols=65 lines=21

fltmc >nul 2>&1 || (
    echo(&echo   [33m# Administrator privileges are required.[0m
    PowerShell Start -Verb RunAs '%0' 2> nul || (
		title ERROR: Administrator Privileges Declined
        echo(&echo   [33m# Right-click on the script and select "Run as administrator[0m".
        pause & exit 1
    )
    exit 0
)




:: ====================

title S.U.W.T
mode con:cols=43 lines=21

echo(&echo    -------------------------------------
echo   ^| Scrut1ny's Ultimate Windows Tweaker ^|
echo    -------------------------------------

:: ====================




:: ====================
:: Scheduled Tasks
:: ====================

echo(&echo   # Disabling Scheduled Tasks

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
	
	schtasks /end /TN "Mozilla\Firefox Default Browser Agent *"
	schtasks /change /TN "Mozilla\Firefox Default Browser Agent *" /disable
)

:: ====================




:: ====================
:: Services
:: ====================

echo(&echo   # Disabling Services

>nul 2>&1 (
	sc stop "DusmSvc" & sc config "DusmSvc" start= disabled & del /F/S/Q "%windir%\System32\sru\*" rem Network data usage, data limit, restrict background data, metered networks.
	sc stop "diagnosticshub.standardcollector.service" & sc config "diagnosticshub.standardcollector.service" start= disabled rem Diagnostics Hub Standard Collector Service. When running, this service collects real time ETW events and processes them.
	sc stop "RemoteRegistry" & sc config "RemoteRegistry" start= disabled rem Enables remote users to modify registry settings on this computer. If this service is stopped, the registry can be modified only by users on this computer. If this service is disabled, any services that explicitly depend on it will fail to start.
	sc stop "TabletInputService" & sc config "TabletInputService" start= disabled rem Enables Touch Keyboard and Handwriting Panel pen and ink functionality
	sc stop "MapsBroker" & sc config "MapsBroker" start= disabled
	sc stop "OneSyncSvc" & sc config "OneSyncSvc" start= disabled
	sc stop "MicrosoftEdgeElevationService" & sc config "MicrosoftEdgeElevationService" start= disabled
	sc stop "edgeupdate" & sc config "edgeupdate" start= disabled rem Keeps your Microsoft software up to date. If this service is disabled or stopped, your Microsoft software will not be kept up to date, meaning security vulnerabilities that may arise cannot be fixed and features may not work. This service uninstalls itself when there is no Microsoft software using it.
	sc stop "edgeupdatem" & sc config "edgeupdatem" start= disabled rem Keeps your Microsoft software up to date. If this service is disabled or stopped, your Microsoft software will not be kept up to date, meaning security vulnerabilities that may arise cannot be fixed and features may not work. This service uninstalls itself when there is no Microsoft software using it.
	sc stop "XboxGipSvc" & sc config "XboxGipSvc" start= disabled rem This service manages connected Xbox Accessories.
	sc stop "XblAuthManager" & sc config "XblAuthManager" start= disabled rem Provides authentication and authorization services for interacting with Xbox Live.
	sc stop "XblGameSave" & sc config "XblGameSave" start= disabled rem This service syncs save data for Xbox Live save enabled games.
	sc stop "XboxNetApiSvc" & sc config "XboxNetApiSvc" start= disabled rem This service supports the Windows.Networking.XboxLive application programming interface.
	rem = Enable xbox services.
	rem sc config "XboxGipSvc" start= demand & sc start "XboxGipSvc"
	rem sc config "XblAuthManager" start= demand & sc start "XblAuthManager"
	rem sc config "XblGameSave" start= demand & sc start "XblGameSave"
	rem sc config "XboxNetApiSvc" start= demand & sc start "XboxNetApiSvc"
)

:: ====================




:: ====================
:: Apps
:: ====================

echo(&echo   # Deleting Bloat Microsoft Apps

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
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsAlarms' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windowscommunicationsapps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsFeedbackHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsMaps' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsSoundRecorder' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxApp' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.YourPhone' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftEdge' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftOfficeHub' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftSolitaireCollection' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftStickyNotes' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Netflix' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'NVIDIACorp.NVIDIAControlPanel' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'OneDriveSync' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Pandora' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Plex' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'PowerAutomateDesktop' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ROBLOXCORPORATION.ROBLOX' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ShazamEntertainmentLtd.Shazam' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Spotify' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'SpotifyAB.SpotifyMusic' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Sway' | Remove-AppxPackage"
	PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Teams' | Remove-AppxPackage"
	rem MAIN WINDOWS APPS
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windows.Photos' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCalculator' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCamera' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsStore' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneMusic' | Remove-AppxPackage"
	rem PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneVideo' | Remove-AppxPackage"
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.Windows.Photos*\appxmanifest.xml" -DisableDevelopmentMode
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.WindowsCalculator*\appxmanifest.xml" -DisableDevelopmentMode
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.WindowsCamera*\appxmanifest.xml" -DisableDevelopmentMode
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.WindowsStore*\appxmanifest.xml" -DisableDevelopmentMode
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.ZuneMusic*\appxmanifest.xml" -DisableDevelopmentMode
	Add-AppxPackage -register "C:\Program Files\WindowsApps\*Microsoft.ZuneVideo*\appxmanifest.xml" -DisableDevelopmentMode
)

:: ====================




:: ====================
:: Registry Tweaks
:: ====================

echo(&echo   # Applying Registry Tweaks

>nul 2>&1 (
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
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StoreAppsOnTaskbar" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAutoHideInTabletMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "Notepad++_file" /t REG_NONE /d "" /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
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
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f

	rem Choose which folders appear on Start (File Explorer, Settings, Downloads)
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$de${7c766bfc-5110-4f2f-8fb1-146c95476c68}$$windows.data.unifiedtile.startglobalproperties\Current" /v "Data" /t REG_BINARY /d "0200000097808B89CBAED8010000000043420100C20A01CB320A03058691CC930524AAA30144C38401669FF79DB187CBD1ACD4010005AFE69E9B0E24DE930244D5860166BF9D879BBF8FC6D4370005BCC9A8A401248CAC034489850166A081BACBBDD7A8A4820100C23C01C24601C55A0100" /f

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
	
	rem Mouse Configuration
	reg add "HKCU\SOFTWARE\Microsoft\Accessibility" /v "CursorColor" /t REG_DWORD /d "fafa" /f
	reg add "HKCU\SOFTWARE\Microsoft\Accessibility" /v "CursorSize" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Accessibility" /v "CursorType" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Accessibility\CursorIndicator" /v "IndicatorColor" /t REG_DWORD /d "ff00bf" /f
	reg add "HKCU\SOFTWARE\Microsoft\Accessibility\CursorIndicator" /v "IndicatorType" /t REG_DWORD /d "1" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /t REG_SZ /d "" /f
	
	rem Color filters
	reg add "HKCU\SOFTWARE\Microsoft\ColorFiltering" /v "Active" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\ATConfig\colorfiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\Session1\ATConfig\colorfiltering" /v "Active" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\Session1\ATConfig\colorfiltering" /v "FilterType" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /t REG_SZ /d "" /f

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
	reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
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
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{6ac27878-a6fa-4155-ba85-f98f491d4f33}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9D9E0118-1807-4F2E-96E4-2CE57142E196}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{B19F89AF-E3EB-444B-8DEA-202575A71599}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E83AF229-8640-4D18-A213-E22675EBB2C3}" /v "Value" /t REG_SZ /d "Deny" /f
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
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f
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
	reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
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
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f
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

echo(&echo   # Applying Sophisicated Tweaks

>nul 2>&1 (
	rem Turns off hibernation mode
	powercfg -h off
	
	rem BCDEDIT
	bcdedit /set TESTSIGNING OFF
	bcdedit /set nx optout
	bcdedit /set disabledynamictick no
	bcdedit /set useplatformclock no

	rem Prefetch / Superfetch (meant for HDD not SSD)
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
	
	sc stop "NVDisplay.ContainerLocalSystem" & sc config "NVDisplay.ContainerLocalSystem" start= disabled rem Annoying auto NVIDIA popup.
	
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
	
	rem Do not show recently used files in Quick Access
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t "REG_DWORD" /d "0" /f
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	if not %PROCESSOR_ARCHITECTURE%==x86 ( REM is 64 bit?
		reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
	)
	
	rem OneDrive Removal
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

echo(&echo   # Adding Custom Host File Config

set "hostspath=%WINDIR%\System32\drivers\etc\hosts"
del /F/Q "%WINDIR%\System32\drivers\etc\hosts"
cd "%WINDIR%\System32\drivers\etc" & type nul > hosts

(
	echo ###################################
	echo # Custom Host Config by: Scrut1ny #
	echo ###################################
	echo(
	echo # Malwarebytes Telemtry
	echo 0.0.0.0 telemetry.malwarebytes.com
	echo(
	echo # Windows Telemtry 
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
	echo 0.0.0.0 alpha.telemetry.microsft.com
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
	echo 0.0.0.0 az361816.vo.msecnd.net
	echo 0.0.0.0 az512334.vo.msecnd.net
	echo 0.0.0.0 b.ads1.msn.com
	echo 0.0.0.0 b.ads2.msads.net
	echo 0.0.0.0 b.rad.msn.com
	echo 0.0.0.0 bingads.microsoft.com
	echo 0.0.0.0 bl3301-a.1drv.com
	echo 0.0.0.0 bl3301-c.1drv.com
	echo 0.0.0.0 bl3301-g.1drv.com
	echo 0.0.0.0 blob.weather.microsoft.com
	echo 0.0.0.0 bn2b-cor001.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor002.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor003.api.p001.1drv.com
	echo 0.0.0.0 bn2b-cor004.api.p001.1drv.com
	echo 0.0.0.0 bn2wns1.wns.windows.com
	echo 0.0.0.0 bn3p-cor001.api.p001.1drv.com
	echo 0.0.0.0 bn3sch020022328.wns.windows.com
	echo 0.0.0.0 bn1304-e.1drv.com
	echo 0.0.0.0 bn1306-a.1drv.com
	echo 0.0.0.0 bn1306-e.1drv.com
	echo 0.0.0.0 bn1306-g.1drv.com
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
	echo 0.0.0.0 cds26.ams9.msecn.net
	echo 0.0.0.0 cds425.lcy.llnw.net
	echo 0.0.0.0 cds459.lcy.llnw.net
	echo 0.0.0.0 cds494.lcy.llnw.net
	echo 0.0.0.0 cds965.lon.llnw.net
	echo 0.0.0.0 cds1204.lon.llnw.net
	echo 0.0.0.0 cds1293.lon.llnw.net
	echo 0.0.0.0 cds20417.lcy.llnw.net
	echo 0.0.0.0 cds20431.lcy.llnw.net
	echo 0.0.0.0 cds20450.lcy.llnw.net
	echo 0.0.0.0 cds20457.lcy.llnw.net
	echo 0.0.0.0 cds20475.lcy.llnw.net
	echo 0.0.0.0 cds21244.lon.llnw.net
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
	echo 0.0.0.0 db3aqu.atdmt.com
	echo 0.0.0.0 db3wns2011111.wns.windows.com
	echo 0.0.0.0 db5-eap.settings-win.data.microsoft.com.akadns.net
	echo 0.0.0.0 db5.settings-win.data.microsoft.com.akadns.net
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
	echo 0.0.0.0 device.auth.xboxlive.com
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
	echo 0.0.0.0 geo.vortex.data.microsoft.com.akadns.net
	echo 0.0.0.0 geover-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 h1.msn.com
	echo 0.0.0.0 h2.msn.com
	echo 0.0.0.0 i1.services.social.microsoft.com
	echo 0.0.0.0 i1.services.social.microsoft.com.nsatc.net
	echo 0.0.0.0 i-bl6p-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-by3p-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-by3p-cor002.api.p001.1drv.com
	echo 0.0.0.0 i-ch1-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-ch1-cor002.api.p001.1drv.com
	echo 0.0.0.0 i-sn2-cor001.api.p001.1drv.com
	echo 0.0.0.0 i-sn2-cor002.api.p001.1drv.com
	echo 0.0.0.0 img-s-msn-com.akamaized.net
	echo 0.0.0.0 inference.location.live.net
	echo 0.0.0.0 insiderppe.cloudapp.net
	echo 0.0.0.0 kv101-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 kv201-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 kv401-prod.do.dsp.mp.microsoft.com
	echo 0.0.0.0 lb1.www.ms.akadns.net
	echo 0.0.0.0 licensing.mp.microsoft.com
	echo 0.0.0.0 live.rads.msn.com
	echo 0.0.0.0 ls2web.redmond.corp.microsoft.com
	echo 0.0.0.0 m.adnxs.com
	echo 0.0.0.0 mediaredirect.microsoft.com
	echo 0.0.0.0 mobile.pipe.aria.microsoft.com
	echo 0.0.0.0 msnbot-207-46-194-33.search.msn.com
	echo 0.0.0.0 msntest.serving-sys.com
	echo 0.0.0.0 oca.telemetry.microsft.com
	echo 0.0.0.0 oca.telemetry.microsoft.com
	echo 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 officeclient.microsoft.com
	echo 0.0.0.0 oneclient.sfx.ms
	echo 0.0.0.0 pre.footprintpredict.com
	echo 0.0.0.0 preview.msn.com
	echo 0.0.0.0 pti.store.microsoft.com
	echo 0.0.0.0 query.prod.cms.rt.microsoft.com
	echo 0.0.0.0 rad.msn.com
	echo 0.0.0.0 redir.metaservices.microsoft.com
	echo 0.0.0.0 register.cdpcs.microsoft.com
	echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com
	echo 0.0.0.0 s0.2mdn.net
	echo 0.0.0.0 schemas.microsoft.akadns.net
	echo 0.0.0.0 secure.adnxs.com
	echo 0.0.0.0 secure.flashtalking.com
	echo 0.0.0.0 services.wes.df.telemetry.microsoft.com
	echo 0.0.0.0 settings-sandbox.data.microsoft.com
	echo 0.0.0.0 settings-ssl.xboxlive.com
	echo 0.0.0.0 settings-win-ppe.data.microsoft.com
	echo 0.0.0.0 settings-win.data.microsoft.com
	echo 0.0.0.0 settings.data.glbdns2.microsoft.com
	echo 0.0.0.0 settings.data.microsof.com
	echo 0.0.0.0 sls.update.microsoft.com.akadns.net
	echo 0.0.0.0 sn3301-c.1drv.com
	echo 0.0.0.0 sn3301-e.1drv.com
	echo 0.0.0.0 sn3301-g.1drv.com
	echo 0.0.0.0 sO.2mdn.net
	echo 0.0.0.0 spynet2.microsoft.com
	echo 0.0.0.0 spynetalt.microsoft.com
	echo 0.0.0.0 spyneteurope.microsoft.akadns.net
	echo 0.0.0.0 sqm.df.telemetry.microsoft.com
	echo 0.0.0.0 sqm.telemetry.microsoft.com
	echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 ssw.live.com
	echo 0.0.0.0 static.2mdn.net
	echo 0.0.0.0 statsfe1.ws.microsoft.com
	echo 0.0.0.0 statsfe2.update.microsoft.com.akadns.net
	echo 0.0.0.0 statsfe2.ws.microsoft.com
	echo 0.0.0.0 store-images.s-microsoft.com
	echo 0.0.0.0 storecatalogrevocation.storequality.microsoft.com
	echo 0.0.0.0 storeedgefd.dsx.mp.microsoft.com
	echo 0.0.0.0 survey.watson.microsoft.com
	echo 0.0.0.0 t0.ssl.ak.dynamic.tiles.virtualearth.net
	echo 0.0.0.0 t0.ssl.ak.tiles.virtualearth.net
	echo 0.0.0.0 telecommand.telemetry.microsoft.com
	echo 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net
	echo 0.0.0.0 telemetry.appex.bing.net
	echo 0.0.0.0 telemetry.microsoft.comecho
	echo 0.0.0.0 telemetry.urs.microsoft.com
	echo 0.0.0.0 test.activity.windows.com
	echo 0.0.0.0 tile-service.weather.microsoft.com
	echo 0.0.0.0 time.windows.com
	echo 0.0.0.0 tk2.plt.msn.com
	echo 0.0.0.0 tsfe.trafficshaping.dsp.mp.microsoft.com
	echo 0.0.0.0 urs.smartscreen.microsoft.com
	echo 0.0.0.0 us.vortex-win.data.microsft.com
	echo 0.0.0.0 v10-win.vortex.data.microsft.com.akadns.net
	echo 0.0.0.0 v10.vortex-win.data.metron.live.com.nsatc.net
	echo 0.0.0.0 v10.vortex-win.data.microsft.com
	echo 0.0.0.0 v10.vortex-win.data.microsoft.com
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
	echo 0.0.0.0 win10-trt.msedge.net
	echo 0.0.0.0 win10.ipv6.microsoft.com
	echo 0.0.0.0 win1710.ipv6.microsoft.com
	echo 0.0.0.0 wscont.apps.microsoft.com
	echo 0.0.0.0 www.msedge.net
) >"%WINDIR%\System32\drivers\etc\hosts"

:: ====================




:: ====================
:: Networking Config
:: ====================

echo(&echo   # Configurating Network Settings

>nul 2>&1 (
	rem Reset firewall
	rem netsh advfirewall reset
	rem delete http cache
	netsh nap reset
	netsh rpc reset
	netsh winhttp reset
	netsh http flush
	netsh http delete timeout timeouttype=idleconnectiontimeout
	netsh http delete timeout timeouttype=headerwaittimeout
	rem make connection direct
	netsh winhttp reset proxy
	rem disable tracing
	netsh winhttp reset tracing
	rem delete http cache
	netsh http delete cache
	rem BranchCache Optimize WAN traffic
	netsh branchcache reset
	rem Routing Lists Clear
	netsh routing reset
	rem Network-Adapter’s Software Default (Winsock Reset and Rebuild)
	netsh winsock reset
	rem Resetting both IPV's
	netsh interface ipv4 reset
	netsh interface ipv6 reset
	rem Network-Interfaces Reset
	netsh interface reset all
	netsh interface httpstunnel reset
	rem Hardcore TCP/IP Reset and Rebuild
	netsh int ip reset c:\temp\netsh_ip_reset_log.txt
	rem Purges the contents of the NetBIOS name cache and then reloads the pre-tagged entries from the Lmhosts file. Releases and then refreshes NetBIOS names for the local computer that is registered with WINS servers.
	nbtstat -R
	nbtstat -RR
	rem Random
	netsh dhcpclient trace disable
	netsh interface httpstunnel reset
	netsh interface portproxy reset
	netsh interface tcp reset
	netsh interface udp reset
	netsh trace stop
	netsh winhttp reset autoproxy
	netsh winhttp reset proxy
	netsh winhttp reset tracing
	netsh winsock reset catalog
	netsh winsock set autotuning off
	
	rem Turning off Ethernet Interface
	netsh interface set interface "Ethernet" admin=disable
	netsh interface set interface "WIFI" admin=disable
	
	rem Ethernet
	netsh interface ipv4 add dns "Ethernet" 1.1.1.1
	netsh interface ipv4 add dns "Ethernet" 1.0.0.1 index=2
	netsh interface ipv6 add dns "Ethernet" 2606:4700:4700::1111
	netsh interface ipv6 add dns "Ethernet" 2606:4700:4700::1001 index=2
	
	rem WIFI
	netsh interface ipv4 add dns "WIFI" 1.1.1.1
	netsh interface ipv4 add dns "WIFI" 1.0.0.1 index=2
	netsh interface ipv6 add dns "WIFI" 2606:4700:4700::1111
	netsh interface ipv6 add dns "WIFI" 2606:4700:4700::1001 index=2
	
	rem Turning on Ethernet Interface
	netsh interface set interface "Ethernet" admin=enable
	netsh interface set interface "WIFI" admin=enable
	
	rem Alternative NCSI (test your internet connection the Microsoft way, except without microsoft)
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveDnsProbeContent" /t REG_SZ /d "208.67.222.222" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveDnsProbeContentV6" /t REG_SZ /d "2620:119:35::35" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveDnsProbeHost" /t REG_SZ /d "resolver1.opendns.com" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveDnsProbeHostV6" /t REG_SZ /d "resolver1.opendns.com" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbeContent" /t REG_SZ /d "NetworkManager is online" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbeContentV6" /t REG_SZ /d "NetworkManager is online" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbeHost" /t REG_SZ /d "network-test.debian.org" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbeHostV6" /t REG_SZ /d "network-test.debian.org" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbePath" /t REG_SZ /d "nm" /f
	reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "ActiveWebProbePathV6" /t REG_SZ /d "nm" /f
	
	rem Disables Microsofts NCSI, but keeps connection icon working.
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "DisablePassivePolling" /t REG_DWORD /d "1" /f
	
	rem Refresh Networking
	ipconfig/flushdns
	ipconfig/release
	ipconfig/renew
)

:: ====================




:: ====================
:: Clean
:: ====================

echo(&echo   # Cleaning System

>nul 2>&1 (
	arp -d *
	certutil -URLCache * delete
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2  rem Clear Cookies
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8  rem Clear Temporary Internet Files
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16 rem Clear Form Data
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32 rem Clear Saved Passwords
	
	del /F/S/Q %LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\entries\*
	del /F/S/Q %LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.default-release\cache2\entries\*

	del /F/S/Q %tmp%\*
	del /F/S/Q %SystemDrive%\Windows\Temp\*
	del /F/S/Q %SystemDrive%\*.log,*.LOG,*.etl,*.tmp,*.hta

	PowerShell -ExecutionPolicy Unrestricted -Command "$bin = (New-Object -ComObject Shell.Application).NameSpace(10); $bin.items() | ForEach {; Write-Host "^""Deleting $($_.Name) from Recycle Bin"^""; Remove-Item $_.Path -Recurse -Force; }"
	taskkill /f /im explorer.exe & explorer.exe
)

:: ====================




:: ====================

mode con:cols=35 lines=3
cls&echo(&echo   [92m# Windows Optimization Completed![0m & timeout /t 3 >nul & del /F/Q %0 & exit

:: ====================
