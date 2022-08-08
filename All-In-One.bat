@echo off

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

echo(&echo Scheduled Tasks


:: ====================




:: ====================
:: Services
:: ====================

echo(&echo Services

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

:: ====================




:: ====================
:: Apps
:: ====================

echo(&echo Apps


:: ====================




:: ====================
:: Registry Tweaks
:: ====================

echo(&echo Registry Tweaks

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
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithProgids" /v "Notepad++_file" /t REG_NONE /d "" /f
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
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" /v "Value" /t REG_SZ /d "Allow" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" /v "Value" /t REG_SZ /d "Deny" /f
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
gpupdate /force >nul

rem Local Group Policy Editor - Administrative Templates/Windows Componets/App Privacy


rem Telemetry / Data Collection / Advertising / Tracking
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "0" /f
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
reg add "HKCU\SOFTWARE\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "3" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartPage" /v "StartMenu_Start_Time" /t REG_BINARY /d "C3166B83A98BD801" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
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
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ConnectedSearch" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
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
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowCommercialDataPipeline" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDesktopAnalyticsProcessing" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitDiagnosticLogCollection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableDefaultBrowserAgent" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryDeviceHealthEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryErrorDataEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\StorPort" /v "TelemetryPerformanceEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f

:: ====================




:: ====================
:: Sophisicated Tweaks
:: ====================

echo(&echo Sophisicated Tweaks


:: ====================




:: ====================
:: Host File Config
:: ====================

echo(&echo Host File Config


:: ====================




:: ====================
:: Clean
:: ====================

echo(&echo Clean


:: ====================
