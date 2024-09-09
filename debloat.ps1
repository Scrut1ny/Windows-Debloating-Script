# ==================================================
#  Windows-Tweaking v2.0
# ==================================================
#  Dev  - Scut1ny
#  Help - 
#  Link - https://github.com/Scrut1ny/Windows-Debloating-Script
# ==================================================


# ==================================================
# Admin Check
# ==================================================


if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$($PWD.Path)' ; & '$($myInvocation.InvocationName)'`"" -Verb RunAs
    Exit
}


# ==================================================
# Bloat Apps
# ==================================================


function Apps {
	# Microsoft Apps
	Get-AppxPackage -AllUsers 'Microsoft Edge Update' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.549981C3F5F10*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Advertising.Xaml*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.BingNews*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.BingWeather*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.EdgeWebView2Runtime' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.GamingApp*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.GetHelp*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Getstarted*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.HEIFImageExtension*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MSPaint*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Microsoft3DViewer*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MicrosoftEdge.Stable*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MicrosoftOfficeHub*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MicrosoftSolitaireCollection*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MicrosoftStickyNotes*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.MixedReality.Portal*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Office.OneNote*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.OneDrive*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Paint*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.People*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.PowerAutomateDesktop*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.ScreenSketch*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Services.Store.Engagement*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.SkypeApp*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Todos*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.VP9VideoExtensions*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Wallet*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WebMediaExtensions*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WebpImageExtension*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.Windows.Photos*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WindowsAlarms*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WindowsFeedbackHub*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WindowsMaps*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.WindowsSoundRecorder*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.YourPhone*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.ZuneMusic*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.ZuneVideo*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Microsoft.windowscommunicationsapps*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'MicrosoftCorporationII.QuickAssist*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'MicrosoftTeams*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'MicrosoftWindows.Client.WebExperience*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers '{43D501A5-E5E3-46EC-8F33-9E15D2A2CBD5}' | Remove-AppxPackage
	
	# Third Party Apps
	Get-AppxPackage -AllUsers '46928bounde.EclipseManager*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers '9E2F88E3.Twitter*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'ActiproSoftwareLLC.562882FEEB491*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'AdobeSystemIncorporated.AdobePhotoshop*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'BytedancePte.Ltd.TikTok*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'ClearChannelRadioDigital.iHeartRadio*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Clipchamp.Clipchamp*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'D5EA27B7.Duolingo-LearnLanguagesforFree*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Disney.37853FC22B2CE*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'Flipboard.Flipboard*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'PandoraMediaInc.29680B314EFC2*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'ShazamEntertainmentLtd.Shazam*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'SpotifyAB.SpotifyMusic*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'king.com.CandyCrushSaga*' | Remove-AppxPackage
	Get-AppxPackage -AllUsers 'king.com.CandyCrushSodaSaga*' | Remove-AppxPackage
	
	# Main Recommended Microsoft Windows Apps
	# Get-AppxPackage -allusers 'Microsoft.StorePurchaseApp' | Remove-AppxPackage
	# Get-AppxPackage -allusers 'Microsoft.WindowsCalculator' | Remove-AppxPackage
	# Get-AppxPackage -allusers 'Microsoft.WindowsCamera' | Remove-AppxPackage
	# Get-AppxPackage -allusers 'Microsoft.WindowsStore' | Remove-AppxPackage
}


# ==================================================
# Registry Tweaks
# ==================================================


function Registry {
	# Important Tweaks
	Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Type 'String' -Value '506' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'AutoEndTasks' -Type 'String' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'HungAppTimeout' -Type 'String' -Value '1000' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'LowLevelHooksTimeout' -Type 'String' -Value '1000' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -Type 'String' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'WaitToKillAppTimeout' -Type 'String' -Value '2000' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name 'MouseHoverTime' -Type 'String' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Command Processor' -Name 'AutoRun' -Type 'String' -Value 'prompt $E[38;5;220m$S$S_$_$E[38;5;208m$G$E[38;5;220m$C$E[0m.$E[38;5;220m$F__$_$S$C___/$S$E[0m$P$G' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'ShowRecent' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DisallowShaking' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCortanaButton' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowInfoTip' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSecondsInSystemClock' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_AccountNotifications' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_IrisRecommendations' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackDocs' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackProgs' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'StoreAppsOnTaskbar' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAl' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAutoHideInTabletMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarDa' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarMn' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarSi' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarSmallIcons' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'Append Completion' -Type 'String' -Value 'yes' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete' -Name 'AutoSuggest' -Type 'String' -Value 'yes' -Force
 	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name 'StartMenu_Start_Time' -Type 'Binary' -Value '6411FF8CB4C8DA01' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds' -Name 'ShellFeedsTaskbarViewMode' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'ClearRecentDocsOnExit' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'LinkResolveIgnoreLinkInfo' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoInternetOpenWith' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoLowDiskSpaceChecks' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoResolveSearch' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoResolveTrack' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BingSearchEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'CanCortanaBeEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'CortanaConsent' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'CortanaEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'DeviceHistoryEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'HistoryViewEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsAADCloudSearchEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsDeviceSearchHistoryEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsDynamicSearchBoxEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'IsMSACloudSearchEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' -Name 'SafeSearchMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement' -Name 'ScoobeSystemSettingEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoTileApplicationNotification' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To' -Name '(default)' -Type 'String' -Value '{C2FBB630-2971-11D1-A18C-00C04FD75D13}' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To' -Name '(default)' -Type 'String' -Value '{C2FBB631-2971-11D1-A18C-00C04FD75D13}' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'AlwaysOn' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -Type 'DWord' -Value '4294967295' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NoLazyMode' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Type 'DWord' -Value '6' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'SFIO Priority' -Type 'String' -Value 'High' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -Type 'String' -Value 'High' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency' -Name 'GPU Priority' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency' -Name 'Priority' -Type 'DWord' -Value '8' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency' -Name 'SFIO Priority' -Type 'String' -Value 'High' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency' -Name 'Scheduling Category' -Type 'String' -Value 'Medium' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'UseOLEDTaskbarTransparency' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Type 'DWord' -Value '4' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'AllowOnlineTips' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'HideSCAMeetNow' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoInternetOpenWith' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoOnlinePrintsWizard' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoPublishingWizard' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoRecentDocsHistory' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoWebServices' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'CortanaConsent' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoUseStoreOpenWith' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched' -Name 'NonBestEffortLimit' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DisableLockScreenAppNotifications' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation' -Name 'EnableFrameServerMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\CrashControl' -Name 'CrashDumpEnabled' -Type 'DWord' -Value '3' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\Remote Assistance' -Name 'fAllowToGetHelp' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'WaitToKillServiceTimeout' -Type 'String' -Value '2000' -Force
	
	# Restore Windows 10 Context Menu
	if (([System.Environment]::OSVersion.Version).Major -ge 11) { New-Item -Path 'HKCU:\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32' -Force }

	# ===== CONTEXT MENU =====
	# To allow mapped drives to be available in command prompt
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLinkedConnections' -Type 'DWord' -Value '1' -Force
	# Restart Explorer.exe
	New-ItemProperty -Path 'REGISTRY::HKEY_CLASSES_ROOT\Directory\Background\shell\REX' -Name '(Default)' -Value 'Restart Explorer' -Force
	New-ItemProperty -Path 'REGISTRY::HKEY_CLASSES_ROOT\Directory\Background\shell\REX' -Name 'Icon' -Type 'String' -Value 'imageres.dll,0' -Force
	New-ItemProperty -Path 'REGISTRY::HKEY_CLASSES_ROOT\Directory\Background\shell\REX\command' -Name '(Default)' -Type 'String' -Value 'cmd /c taskkill -Force /IM explorer.exe & start explorer' -Force
	# Create .bat
	New-ItemProperty -Path 'REGISTRY::HKEY_CLASSES_ROOT\.bat\ShellNew' -Name 'NullFile' -Force
	# ========================
	
	# Playback/Recording
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Name 'ShowDisconnectedDevices' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Multimedia\Audio\DeviceCpl' -Name 'ShowHiddenDevices' -Type 'DWord' -Value '0' -Force
	
	# Sounds
	New-ItemProperty -Path 'HKCU:\AppEvents\Schemes' -Name '(Default)' -Value '.None' -Type 'String' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation' -Name 'DisableStartupSound' -Type 'DWord' -Value '1' -Force
	
	# Communications
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Multimedia\Audio' -Name 'UserDuckingPreference' -Type 'DWord' -Value '3' -Force

	# HKCU: ContentDeliveryManager
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'DisableTailoredExperiencesWithDiagnosticData' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'DisableWindowsSpotlightFeatures' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'FeatureManagementEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RemediationRequired' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentAppsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SlideshowEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SoftLandingEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-202914Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-280810Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-280811Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-280815Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-310093Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-314559Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-314563Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338387Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338389Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353694Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353696Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353697Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353698Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-88000326Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContentEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Type 'DWord' -Value '0' -Force

	# HKCU: ConsentStore
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData' -Name 'Value' -Type 'String' -Value 'Allow' -Force

	# HKLM: ConsentStore
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData' -Name 'Value' -Type 'String' -Value 'Allow' -Force
	gpupdate *>$null
	
	# Telemetry / Data Collection / Advertising / Tracking
	New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener' -Force
	New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener' -Name 'Start' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\Control Panel\International\User Profile' -Name 'HttpAcceptLanguageOptOut' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Clipboard' -Name 'EnableClipboardHistory' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Name 'HarvestContacts' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name 'EnableHwkbTextPrediction' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name 'InsightsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\Settings' -Name 'MultilingualEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Input\TIPC' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Name 'UsageTracking' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Narrator\NoRoam' -Name 'DetailedFeedback' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\15.0\Common' -Name 'QMEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\15.0\Common\Feedback' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar' -Name 'EnableCalendarLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\15.0\Word\Options' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common' -Name 'QMEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry' -Name 'DisableTelemetry' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry' -Name 'VerboseLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Feedback' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\MailSettings' -Name 'InlineTextPrediction' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar' -Name 'EnableCalendarLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Word\Options' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\Common\ClientTelemetry' -Name 'DisableTelemetry' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\Common\ClientTelemetry' -Name 'VerboseLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Name 'HasAccepted' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps' -Name 'AgentActivationLastUsed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps' -Name 'AgentActivationOnLockScreenEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\TabletTip\1.7' -Name 'EnableTextPrediction' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\VisualStudio\Telemetry' -Name 'TurnOffSwitch' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost' -Name 'EnableWebContentEvaluation' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP' -Name 'CdpSessionUserAuthzPolicy' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP' -Name 'RomeSdkChannelUserAuthzPolicy' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization' -Name 'SystemSettingsDownloadMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{6ac27878-a6fa-4155-ba85-f98f491d4f33}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9D9E0118-1807-4F2E-96E4-2CE57142E196}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{B19F89AF-E3EB-444B-8DEA-202575A71599}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E83AF229-8640-4D18-A213-E22675EBB2C3}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-1227535392-783678415-19788749-859698564-2515149781-2716591593-3518111838\{6ac27878-a6fa-4155-ba85-f98f491d4f33}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-155514346-2573954481-755741238-1654018636-1233331829-3075935687-2861478708\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2551677095-2355568638-4209445997-2436930744-3692183382-387691378-1866284433\{D89823BA-7180-4B81-B50C-7E471E6121A3}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-2679466428-2257802901-1755839644-3032159574-3452485508-990264208-3332697187\{2EEF81BE-33FA-4800-9670-1CD474972C3F}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{D89823BA-7180-4B81-B50C-7E471E6121A3}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3232211935-909325347-210818523-1333736584-3758124246-283266685-1557978965\{E5323777-F976-4f5b-9B55-B94699C46E44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3445883232-1224167743-206467785-1580939083-2750001491-3097792036-3019341970\{E5323777-F976-4f5b-9B55-B94699C46E44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{2EEF81BE-33FA-4800-9670-1CD474972C3F}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-3624051433-2125758914-1423191267-1740899205-1073925389-3782572162-737981194\{E5323777-F976-4f5b-9B55-B94699C46E44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\S-1-15-2-4153522205-3718366397-1353898457-1332184198-1210887116-3116787857-2103916698\{2EEF81BE-33FA-4800-9670-1CD474972C3F}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -Type 'DWord' -Value '4' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AudioCaptureEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'CursorCaptureEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'MicrophoneCaptureEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name 'NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings' -Name 'NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace' -Name 'PenWorkspaceAppSuggestionsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'LockScreenToastEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'ToastEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'CortanaMUID' -Type 'String' -Value 'MUID=5c47d9dce817417d9cb7fc5cbfbf899d' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'SyncPolicy' -Type 'DWord' -Value '5' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Windows Search' -Name 'CortanaConsent' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'AddressBarMicrosoftSearchInBingProviderEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'AlternateErrorPagesEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'AutofillAddressEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'AutofillCreditCardEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'ConfigureDoNotTrack' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'EdgeShoppingAssistantEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'HubsSidebarEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'LocalProvidersEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'NetworkPredictionOptions' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'PasswordManagerEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'PaymentMethodQueryEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'PersonalizationReportingEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'ResolveNavigationErrorsUseWebService' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'SearchSuggestEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'SiteSafetyServicesEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'SmartScreenEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'TyposquattingCheckerEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'UserFeedbackAllowed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -Name 'WebWidgetAllowed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\15.0\OSM' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\15.0\OSM' -Name 'EnableUpload' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common' -Name 'LinkedIn' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common' -Name 'QMEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common' -Name 'UpdateReliabilityData' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback' -Name 'IncludeEmail' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback' -Name 'SurveyEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy' -Name 'ControllerConnectedServicesEnabled' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy' -Name 'DisconnectedState' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy' -Name 'DownloadContentDisabled' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Privacy' -Name 'UserContentDisabled' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' -Name 'EnableFileObfuscation' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' -Name 'EnableLogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' -Name 'EnableUpload' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' -Name 'Enablelogging' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Office\Common\ClientTelemetry' -Name 'SendTelemetry' -Type 'DWord' -Value '3' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Name 'PreventHandwritingErrorReports' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Name 'PreventHandwritingDataSharing' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\AMD\CN' -Name 'CollectGIData' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\DusmSvc\Settings' -Name 'DisableSystemBucket' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\DusmSvc\Settings' -Name 'DisableSystemBucket' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Input\TIPC' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Input\TIPC' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\OneDrive' -Name 'PreventNetworkTrafficPreUserSignIn' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PCHC' -Name 'PreviousUninstall' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth' -Name 'AllowAdvertising' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\System' -Name 'AllowExperimentation' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowAutoConnectToWiFiSenseHotspots' -Name 'value' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowWiFiHotSpotReporting' -Name 'value' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' -Name 'AutoConnectAllowedOEM' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\NoExecuteState' -Name 'LastNoExecuteRadioButtonState' -Type 'DWord' -Value '14012' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost' -Name 'EnableWebContentEvaluation' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing' -Name 'EnableLog' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338389Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config' -Name 'DODownloadMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}' -Name 'Value' -Type 'String' -Value 'Deny' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Name 'SearchOrderConfig' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\BrokerUp' -Type 'DWord' -Name 'WWAJSE' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics' -Name 'Enabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'ConfigureDoNotTrack' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'PromotionalTabsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'SpotlightExperiencesAndRecommendationsEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'StartupBoostEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name 'AlternateErrorPagesEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name 'EdgeShoppingAssistantEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name 'SearchSuggestEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended' -Name 'SyncDisabled' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'AllowInputPersonalization' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MRT' -Name 'DontOfferThroughWUAU' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MRT' -Name 'DontReportInfectionInformation' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting' -Name 'DoReport' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall' -Name 'DisablePushToInstall' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows' -Name 'CEIPEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' -Name 'DisableEmailInput' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' -Name 'DisableFeedbackDialog' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback' -Name 'DisableScreenshotCapture' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\VisualStudio\SQM' -Name 'OptIn' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WMDRM' -Name 'DisableOnline' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SpyNetReporting' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SubmitSamplesConsent' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Name 'NoGenTicket' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'AITEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableInventory' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisablePCA' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisablePcaRecording' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableScriptedDiagnosticLogging' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableUAR' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableCloudOptimizedContent' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableTailoredExperiencesWithDiagnosticData' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableThirdPartySuggestions' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsSpotlightFeatures' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI' -Name 'DisablePasswordReveal' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config' -Name 'DODownloadMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Customer Experience Improvement Program' -Name 'CEIPEnable' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowCommercialDataPipeline' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowDesktopAnalyticsProcessing' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DisableOneSettingsDownloads' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitDiagnosticLogCollection' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitEnhancedDiagnosticDataWindowsAnalytics' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata' -Name 'PreventDeviceMetadataFromNetwork' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Diagnostic' -Name 'DisableResourceUsage' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Name 'PreventHandwritingErrorReports' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableLocation' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableSensors' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableWindowsLocationProvider' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps' -Name 'AutoDownload' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps' -Name 'AutoDownloadAndUpdateMapData' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps' -Name 'DownloadAllowed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Name 'AllowMessageSync' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name 'NoLockScreenCamera' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Search' -Name 'AllowCortana' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync' -Name 'DisableSettingSync' -Type 'DWord' -Value '2' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableActivityFeed' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Name 'PreventHandwritingDataSharing' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Name 'EnableFeeds' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchUseWeb' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'DisableDefaultBrowserAgent' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'DisableTelemetry' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\WcmSvc\wifinetworkmanager\config' -Name 'AutoConnectAllowedOEM' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config' -Name 'DODownloadMode' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\DriverSearching' -Name 'SearchOrderConfig' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\StorPort' -Name 'TelemetryDeviceHealthEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\StorPort' -Name 'TelemetryErrorDataEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\StorPort' -Name 'TelemetryPerformanceEnabled' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Control\Storage\EnabledDenyGP' -Name 'DenyAllGPState' -Type 'DWord' -Value '1' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Services\lfsvc\Service\Configuration' -Name 'Status' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger' -Name 'Start' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger' -Name 'Start' -Type 'DWord' -Value '0' -Force
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger' -Name 'Start' -Type 'DWord' -Value '0' -Force
}


# ==================================================
# Scheduled Tasks
# ==================================================


function Scheduled-Tasks {
	# Component: Telemtry Client
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

	# Component: CEIP (SQM)
	schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy"
	schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable

	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable

	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable

	schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
	schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable

	# Component: Disk failure diagnostics
	schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
	schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable

	schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
	schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable

	# Component: Data Usage service
	schtasks /end /tn "\Microsoft\Windows\DUSM\dusmtask"
	schtasks /change /tn "\Microsoft\Windows\DUSM\dusmtask" /disable

	# Component: Windows Error Reporting
	schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClient"
	schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable

	schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
	schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable

	schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
	schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable

	# Component: Location Service
	schtasks /end /tn "\Microsoft\Windows\Location\WindowsActionDialog"
	schtasks /change /tn "\Microsoft\Windows\Location\WindowsActionDialog" /disable

	# Component: Windows System Assessment Tool (winSAT)
	schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT"
	schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable

	# Component: Diagnostics and Troubleshooting
	schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
	schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable

	schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
	schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable

	# Component: Microsoft family featurers
	schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
	schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable

	schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask"
	schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable

	# Component: Windows Search
	schtasks /end /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
	schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable

	# Component: Location Service
	# Component: Location Notifications
	schtasks /end /tn "\Microsoft\Windows\Location\Notifications"
	schtasks /change /tn "\Microsoft\Windows\Location\Notifications" /disable

	# Component: Speech Recognition
	schtasks /end /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask"
	schtasks /change /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /disable

	# Misc.:
	schtasks /end /tn "\Microsoft\Windows\International\Synchronize Language Settings"
	schtasks /change /tn "\Microsoft\Windows\International\Synchronize Language Settings" /disable
}


# ==================================================
# Services
# ==================================================


function Services {
	$services = @(
		"CDPUserSvc",
		"Connected User Experiences and Telemetry",
		"Diagnostic Policy Service",
		"diagnosticshub.standardcollector.service",
		"diagsvc",
		"DiagTrack",
		"dmwappushservice",
		"Downloaded Maps Manager",
		"DusmSvc",
		"edgeupdate",
		"edgeupdatem",
		"Geolocation Service",
		"MapsBroker",
		"MessagingService",
		"MicrosoftEdgeElevationService",
		"NahimicService",
		"NvTelemetryContainer",
		"OneSyncSvc_*",
		"PcaSvc",
		"PhoneSvc",
		"PimIndexMaintenanceSvc",
		"Remote Registry",
		"RemoteRegistry",
		"RetailDemo",
		"TabletInputService",
		"UnistoreSvc",
		"UserDataSvc",
		"wercplsupport",
		"WerSvc",
		"Windows Biometric Service",
		"WpnUserService"
	)

	foreach ($service in $services) {
		Stop-Service -Name $service; Set-Service -Name $service -StartupType Disabled
	}
	
	Remove-Item -Path "$env:windir\System32\sru\*" -Recurse -Force -ErrorAction SilentlyContinue

	function Set-ServicesToManual {
		Get-Service | ForEach-Object { Set-Service $_.Name -StartupType Manual }
	}
}


# ==================================================
# Hosts File
# ==================================================


function Hosts {
    $defenderPath = "C:\Program Files\Windows Defender\MpCmdRun.exe"
    if (Test-Path $defenderPath) {
        Add-MpPreference -ExclusionPath "$env:WINDIR\System32\drivers\etc\hosts" -Force -ErrorAction Stop
    }
    Remove-Item -Path "$env:WINDIR\System32\drivers\etc\hosts" -Force -ErrorAction SilentlyContinue
    Set-Location "$env:WINDIR\System32\drivers\etc"
    $null > hosts
    @"
###################################
# Custom Host Config by: Scrut1ny #
###################################

# Microsoft Store
# 0.0.0.0 bat.bing.com
# 0.0.0.0 store-images.microsoft.com
# 0.0.0.0 store-images.s-microsoft.com
# 0.0.0.0 storeedgefd.dsx.mp.microsoft.com

# Microsoft Store: Xbox
# 0.0.0.0 da.xboxservices.com
# 0.0.0.0 images-eds-ssl.xboxlive.com
# 0.0.0.0 musicart.xboxlive.com
# 0.0.0.0 musicimage.xboxlive.com

# Microsoft Store: Library - Updating Apps
# 0.0.0.0 displaycatalog.mp.microsoft.com
# 0.0.0.0 fe3cr.delivery.mp.microsoft.com

# Activating Windows
# 0.0.0.0 licensing.mp.microsoft.com

# Minecraft: Microsoft Login
# 0.0.0.0 device.auth.xboxlive.com
# 0.0.0.0 sisu.xboxlive.com
# 0.0.0.0 login.live.com

# Windows Telemetry
0.0.0.0 1oavsblobprodcus350.blob.core.windows.net
0.0.0.0 37bvsblobprodcus311.blob.core.windows.net
0.0.0.0 a-0001.a-msedge.net
0.0.0.0 a-0001.dc-msedge.net
0.0.0.0 a-0002.a-msedge.net
0.0.0.0 a-0003.a-msedge.net
0.0.0.0 a-0004.a-msedge.net
0.0.0.0 a-0005.a-msedge.net
0.0.0.0 a-0006.a-msedge.net
0.0.0.0 a-0007.a-msedge.net
0.0.0.0 a-0008.a-msedge.net
0.0.0.0 a-0009.a-msedge.net
0.0.0.0 a-0010.a-msedge.net
0.0.0.0 a-0011.a-msedge.net
0.0.0.0 a-0012.a-msedge.net
0.0.0.0 a-msedge.net
0.0.0.0 a.ads1.msn.com
0.0.0.0 a.ads2.msads.net
0.0.0.0 a.ads2.msn.com
0.0.0.0 a.rad.msn.com
0.0.0.0 ac3.msn.com
0.0.0.0 activity.windows.com
0.0.0.0 ad.doubleclick.net
0.0.0.0 adnexus.net
0.0.0.0 adnxs.com
0.0.0.0 ads.msn.com
0.0.0.0 ads1.msads.net
0.0.0.0 ads1.msn.com
0.0.0.0 aidps.atdmt.com
0.0.0.0 aka-cdn-ns.adtech.de
0.0.0.0 alpha.telemetry.microsoft.com
0.0.0.0 api.cortana.ai
0.0.0.0 api.edgeoffer.microsoft.com
0.0.0.0 array101-prod.do.dsp.mp.microsoft.com
0.0.0.0 array102-prod.do.dsp.mp.microsoft.com
0.0.0.0 array103-prod.do.dsp.mp.microsoft.com
0.0.0.0 array104-prod.do.dsp.mp.microsoft.com
0.0.0.0 array201-prod.do.dsp.mp.microsoft.com
0.0.0.0 array202-prod.do.dsp.mp.microsoft.com
0.0.0.0 array203-prod.do.dsp.mp.microsoft.com
0.0.0.0 array204-prod.do.dsp.mp.microsoft.com
0.0.0.0 array401-prod.do.dsp.mp.microsoft.com
0.0.0.0 array402-prod.do.dsp.mp.microsoft.com
0.0.0.0 array403-prod.do.dsp.mp.microsoft.com
0.0.0.0 array404-prod.do.dsp.mp.microsoft.com
0.0.0.0 array405-prod.do.dsp.mp.microsoft.com
0.0.0.0 array406-prod.do.dsp.mp.microsoft.com
0.0.0.0 array407-prod.do.dsp.mp.microsoft.com
0.0.0.0 array408-prod.do.dsp.mp.microsoft.com
0.0.0.0 ars.smartscreen.microsoft.com
0.0.0.0 asimov-win.settings.data.microsoft.com.akadns.net
0.0.0.0 assets.msn.com
0.0.0.0 az361816.vo.msecnd.net
0.0.0.0 az512334.vo.msecnd.net
0.0.0.0 azureedge.net
0.0.0.0 azwancan.trafficmanager.net
0.0.0.0 b.ads1.msn.com
0.0.0.0 b.ads2.msads.net
0.0.0.0 b.rad.msn.com
0.0.0.0 bingads.microsoft.com
0.0.0.0 bingapis.com
0.0.0.0 bl3301-a.1drv.com
0.0.0.0 bl3301-c.1drv.com
0.0.0.0 bl3301-g.1drv.com
0.0.0.0 blob.weather.microsoft.com
0.0.0.0 blobcollector.events.data.trafficmanager.net
0.0.0.0 bn1304-e.1drv.com
0.0.0.0 bn1306-a.1drv.com
0.0.0.0 bn1306-e.1drv.com
0.0.0.0 bn1306-g.1drv.com
0.0.0.0 bn2-ris-ap-prod-atm.trafficmanager.net
0.0.0.0 bn2-ris-prod-atm.trafficmanager.net
0.0.0.0 bn2b-cor001.api.p001.1drv.com
0.0.0.0 bn2b-cor002.api.p001.1drv.com
0.0.0.0 bn2b-cor003.api.p001.1drv.com
0.0.0.0 bn2b-cor004.api.p001.1drv.com
0.0.0.0 bn2wns1.wns.windows.com
0.0.0.0 bn3p-cor001.api.p001.1drv.com
0.0.0.0 bn3sch020010558.wns.windows.com
0.0.0.0 bn3sch020010560.wns.windows.com
0.0.0.0 bn3sch020010618.wns.windows.com
0.0.0.0 bn3sch020010629.wns.windows.com
0.0.0.0 bn3sch020010631.wns.windows.com
0.0.0.0 bn3sch020010635.wns.windows.com
0.0.0.0 bn3sch020010636.wns.windows.com
0.0.0.0 bn3sch020010650.wns.windows.com
0.0.0.0 bn3sch020011727.wns.windows.com
0.0.0.0 bn3sch020012850.wns.windows.com
0.0.0.0 bn3sch020020322.wns.windows.com
0.0.0.0 bn3sch020020749.wns.windows.com
0.0.0.0 bn3sch020022328.wns.windows.com
0.0.0.0 bn3sch020022335.wns.windows.com
0.0.0.0 bn3sch020022361.wns.windows.com
0.0.0.0 bn4sch101120814.wns.windows.com
0.0.0.0 bn4sch101120818.wns.windows.com
0.0.0.0 bn4sch101120911.wns.windows.com
0.0.0.0 bn4sch101120913.wns.windows.com
0.0.0.0 bn4sch101121019.wns.windows.com
0.0.0.0 bn4sch101121109.wns.windows.com
0.0.0.0 bn4sch101121118.wns.windows.com
0.0.0.0 bn4sch101121223.wns.windows.com
0.0.0.0 bn4sch101121407.wns.windows.com
0.0.0.0 bn4sch101121618.wns.windows.com
0.0.0.0 bn4sch101121704.wns.windows.com
0.0.0.0 bn4sch101121709.wns.windows.com
0.0.0.0 bn4sch101121714.wns.windows.com
0.0.0.0 bn4sch101121908.wns.windows.com
0.0.0.0 bn4sch101122117.wns.windows.com
0.0.0.0 bn4sch101122310.wns.windows.com
0.0.0.0 bn4sch101122312.wns.windows.com
0.0.0.0 bn4sch101122421.wns.windows.com
0.0.0.0 bn4sch101123108.wns.windows.com
0.0.0.0 bn4sch101123110.wns.windows.com
0.0.0.0 bn4sch101123202.wns.windows.com
0.0.0.0 bn4sch102110124.wns.windows.com
0.0.0.0 browser.pipe.aria.microsoft.com
0.0.0.0 bs.serving-sys.com
0.0.0.0 by3301-a.1drv.com
0.0.0.0 by3301-c.1drv.com
0.0.0.0 by3301-e.1drv.com
0.0.0.0 c-0001.dc-msedge.net
0.0.0.0 c.atdmt.com
0.0.0.0 c.msn.com
0.0.0.0 ca.telemetry.microsoft.com
0.0.0.0 cache.datamart.windows.com
0.0.0.0 candycrushsoda.king.com
0.0.0.0 cdn.atdmt.com
0.0.0.0 cdn.content.prod.cms.msn.com
0.0.0.0 cdn.onenote.net
0.0.0.0 cds1.stn.llnw.net
0.0.0.0 cds10.stn.llnw.net
0.0.0.0 cds1203.lon.llnw.net
0.0.0.0 cds1204.lon.llnw.net
0.0.0.0 cds1209.lon.llnw.net
0.0.0.0 cds1219.lon.llnw.net
0.0.0.0 cds1228.lon.llnw.net
0.0.0.0 cds1244.lon.llnw.net
0.0.0.0 cds1257.lon.llnw.net
0.0.0.0 cds1265.lon.llnw.net
0.0.0.0 cds1269.lon.llnw.net
0.0.0.0 cds1273.lon.llnw.net
0.0.0.0 cds1285.lon.llnw.net
0.0.0.0 cds1287.lon.llnw.net
0.0.0.0 cds1289.lon.llnw.net
0.0.0.0 cds1293.lon.llnw.net
0.0.0.0 cds1307.lon.llnw.net
0.0.0.0 cds1310.lon.llnw.net
0.0.0.0 cds1325.lon.llnw.net
0.0.0.0 cds1327.lon.llnw.net
0.0.0.0 cds177.dus.llnw.net
0.0.0.0 cds20005.stn.llnw.net
0.0.0.0 cds20404.lcy.llnw.net
0.0.0.0 cds20411.lcy.llnw.net
0.0.0.0 cds20415.lcy.llnw.net
0.0.0.0 cds20416.lcy.llnw.net
0.0.0.0 cds20417.lcy.llnw.net
0.0.0.0 cds20424.lcy.llnw.net
0.0.0.0 cds20425.lcy.llnw.net
0.0.0.0 cds20431.lcy.llnw.net
0.0.0.0 cds20435.lcy.llnw.net
0.0.0.0 cds20440.lcy.llnw.net
0.0.0.0 cds20443.lcy.llnw.net
0.0.0.0 cds20445.lcy.llnw.net
0.0.0.0 cds20450.lcy.llnw.net
0.0.0.0 cds20452.lcy.llnw.net
0.0.0.0 cds20457.lcy.llnw.net
0.0.0.0 cds20461.lcy.llnw.net
0.0.0.0 cds20469.lcy.llnw.net
0.0.0.0 cds20475.lcy.llnw.net
0.0.0.0 cds20482.lcy.llnw.net
0.0.0.0 cds20485.lcy.llnw.net
0.0.0.0 cds20495.lcy.llnw.net
0.0.0.0 cds21205.lon.llnw.net
0.0.0.0 cds21207.lon.llnw.net
0.0.0.0 cds21225.lon.llnw.net
0.0.0.0 cds21229.lon.llnw.net
0.0.0.0 cds21233.lon.llnw.net
0.0.0.0 cds21238.lon.llnw.net
0.0.0.0 cds21244.lon.llnw.net
0.0.0.0 cds21249.lon.llnw.net
0.0.0.0 cds21256.lon.llnw.net
0.0.0.0 cds21257.lon.llnw.net
0.0.0.0 cds21258.lon.llnw.net
0.0.0.0 cds21261.lon.llnw.net
0.0.0.0 cds21267.lon.llnw.net
0.0.0.0 cds21278.lon.llnw.net
0.0.0.0 cds21281.lon.llnw.net
0.0.0.0 cds21293.lon.llnw.net
0.0.0.0 cds21309.lon.llnw.net
0.0.0.0 cds21313.lon.llnw.net
0.0.0.0 cds21321.lon.llnw.net
0.0.0.0 cds26.ams9.msecn.net
0.0.0.0 cds27.ory.llnw.net
0.0.0.0 cds299.lcy.llnw.net
0.0.0.0 cds30027.stn.llnw.net
0.0.0.0 cds308.lcy.llnw.net
0.0.0.0 cds310.lcy.llnw.net
0.0.0.0 cds38.ory.llnw.net
0.0.0.0 cds405.lcy.llnw.net
0.0.0.0 cds406.lcy.llnw.net
0.0.0.0 cds407.fra.llnw.net
0.0.0.0 cds416.lcy.llnw.net
0.0.0.0 cds421.lcy.llnw.net
0.0.0.0 cds422.lcy.llnw.net
0.0.0.0 cds425.lcy.llnw.net
0.0.0.0 cds426.lcy.llnw.net
0.0.0.0 cds447.lcy.llnw.net
0.0.0.0 cds458.lcy.llnw.net
0.0.0.0 cds459.lcy.llnw.net
0.0.0.0 cds46.ory.llnw.net
0.0.0.0 cds461.lcy.llnw.net
0.0.0.0 cds468.lcy.llnw.net
0.0.0.0 cds469.lcy.llnw.net
0.0.0.0 cds471.lcy.llnw.net
0.0.0.0 cds483.lcy.llnw.net
0.0.0.0 cds484.lcy.llnw.net
0.0.0.0 cds489.lcy.llnw.net
0.0.0.0 cds493.lcy.llnw.net
0.0.0.0 cds494.lcy.llnw.net
0.0.0.0 cds54.ory.llnw.net
0.0.0.0 cds812.lon.llnw.net
0.0.0.0 cds815.lon.llnw.net
0.0.0.0 cds818.lon.llnw.net
0.0.0.0 cds832.lon.llnw.net
0.0.0.0 cds836.lon.llnw.net
0.0.0.0 cds840.lon.llnw.net
0.0.0.0 cds843.lon.llnw.net
0.0.0.0 cds857.lon.llnw.net
0.0.0.0 cds868.lon.llnw.net
0.0.0.0 cds869.lon.llnw.net
0.0.0.0 cds965.lon.llnw.net
0.0.0.0 ceuswatcab01.blob.core.windows.net
0.0.0.0 ceuswatcab02.blob.core.windows.net
0.0.0.0 ch1-cor001.api.p001.1drv.com
0.0.0.0 ch1-cor002.api.p001.1drv.com
0.0.0.0 ch3301-c.1drv.com
0.0.0.0 ch3301-e.1drv.com
0.0.0.0 ch3301-g.1drv.com
0.0.0.0 ch3302-c.1drv.com
0.0.0.0 ch3302-e.1drv.com
0.0.0.0 choice.microsoft.com
0.0.0.0 choice.microsoft.com.nsatc.net
0.0.0.0 choice.microsoft.com.nstac.net
0.0.0.0 client.wns.windows.com
0.0.0.0 clientconfig.passport.net
0.0.0.0 compatexchange.cloudapp.net
0.0.0.0 compatexchange1.trafficmanager.net
0.0.0.0 continuum.dds.microsoft.com
0.0.0.0 corp.sts.microsoft.com
0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com
0.0.0.0 cp101-prod.do.dsp.mp.microsoft.com
0.0.0.0 cp201-prod.do.dsp.mp.microsoft.com
0.0.0.0 cp401-prod.do.dsp.mp.microsoft.com
0.0.0.0 cs1.wpc.v0cdn.net
0.0.0.0 cy2.vortex.data.microsoft.com.akadns.net
0.0.0.0 data.microsoft.com
0.0.0.0 data.msn.com
0.0.0.0 db3aqu.atdmt.com
0.0.0.0 db3wns2011111.wns.windows.com
0.0.0.0 db5-eap.settings-win.data.microsoft.com.akadns.net
0.0.0.0 db5.settings-win.data.microsoft.com.akadns.net
0.0.0.0 db5.settings.data.microsoft.com.akadns.net
0.0.0.0 db5.vortex.data.microsoft.com.akadns.net
0.0.0.0 db5.wns.windows.com
0.0.0.0 db5sch101100122.wns.windows.com
0.0.0.0 db5sch101100127.wns.windows.com
0.0.0.0 db5sch101100831.wns.windows.com
0.0.0.0 db5sch101100835.wns.windows.com
0.0.0.0 db5sch101100917.wns.windows.com
0.0.0.0 db5sch101100925.wns.windows.com
0.0.0.0 db5sch101100928.wns.windows.com
0.0.0.0 db5sch101100938.wns.windows.com
0.0.0.0 db5sch101101001.wns.windows.com
0.0.0.0 db5sch101101022.wns.windows.com
0.0.0.0 db5sch101101024.wns.windows.com
0.0.0.0 db5sch101101031.wns.windows.com
0.0.0.0 db5sch101101034.wns.windows.com
0.0.0.0 db5sch101101042.wns.windows.com
0.0.0.0 db5sch101101044.wns.windows.com
0.0.0.0 db5sch101101122.wns.windows.com
0.0.0.0 db5sch101101123.wns.windows.com
0.0.0.0 db5sch101101125.wns.windows.com
0.0.0.0 db5sch101101128.wns.windows.com
0.0.0.0 db5sch101101129.wns.windows.com
0.0.0.0 db5sch101101133.wns.windows.com
0.0.0.0 db5sch101101145.wns.windows.com
0.0.0.0 db5sch101101209.wns.windows.com
0.0.0.0 db5sch101101221.wns.windows.com
0.0.0.0 db5sch101101228.wns.windows.com
0.0.0.0 db5sch101101231.wns.windows.com
0.0.0.0 db5sch101101237.wns.windows.com
0.0.0.0 db5sch101101317.wns.windows.com
0.0.0.0 db5sch101101324.wns.windows.com
0.0.0.0 db5sch101101329.wns.windows.com
0.0.0.0 db5sch101101333.wns.windows.com
0.0.0.0 db5sch101101334.wns.windows.com
0.0.0.0 db5sch101101338.wns.windows.com
0.0.0.0 db5sch101101419.wns.windows.com
0.0.0.0 db5sch101101424.wns.windows.com
0.0.0.0 db5sch101101426.wns.windows.com
0.0.0.0 db5sch101101427.wns.windows.com
0.0.0.0 db5sch101101430.wns.windows.com
0.0.0.0 db5sch101101445.wns.windows.com
0.0.0.0 db5sch101101511.wns.windows.com
0.0.0.0 db5sch101101519.wns.windows.com
0.0.0.0 db5sch101101529.wns.windows.com
0.0.0.0 db5sch101101535.wns.windows.com
0.0.0.0 db5sch101101541.wns.windows.com
0.0.0.0 db5sch101101543.wns.windows.com
0.0.0.0 db5sch101101608.wns.windows.com
0.0.0.0 db5sch101101618.wns.windows.com
0.0.0.0 db5sch101101629.wns.windows.com
0.0.0.0 db5sch101101631.wns.windows.com
0.0.0.0 db5sch101101633.wns.windows.com
0.0.0.0 db5sch101101640.wns.windows.com
0.0.0.0 db5sch101101711.wns.windows.com
0.0.0.0 db5sch101101722.wns.windows.com
0.0.0.0 db5sch101101739.wns.windows.com
0.0.0.0 db5sch101101745.wns.windows.com
0.0.0.0 db5sch101101813.wns.windows.com
0.0.0.0 db5sch101101820.wns.windows.com
0.0.0.0 db5sch101101826.wns.windows.com
0.0.0.0 db5sch101101835.wns.windows.com
0.0.0.0 db5sch101101837.wns.windows.com
0.0.0.0 db5sch101101844.wns.windows.com
0.0.0.0 db5sch101101907.wns.windows.com
0.0.0.0 db5sch101101914.wns.windows.com
0.0.0.0 db5sch101101929.wns.windows.com
0.0.0.0 db5sch101101939.wns.windows.com
0.0.0.0 db5sch101101941.wns.windows.com
0.0.0.0 db5sch101102015.wns.windows.com
0.0.0.0 db5sch101102017.wns.windows.com
0.0.0.0 db5sch101102019.wns.windows.com
0.0.0.0 db5sch101102023.wns.windows.com
0.0.0.0 db5sch101102025.wns.windows.com
0.0.0.0 db5sch101102032.wns.windows.com
0.0.0.0 db5sch101102033.wns.windows.com
0.0.0.0 db5sch101110108.wns.windows.com
0.0.0.0 db5sch101110109.wns.windows.com
0.0.0.0 db5sch101110114.wns.windows.com
0.0.0.0 db5sch101110135.wns.windows.com
0.0.0.0 db5sch101110142.wns.windows.com
0.0.0.0 db5sch101110204.wns.windows.com
0.0.0.0 db5sch101110206.wns.windows.com
0.0.0.0 db5sch101110214.wns.windows.com
0.0.0.0 db5sch101110225.wns.windows.com
0.0.0.0 db5sch101110232.wns.windows.com
0.0.0.0 db5sch101110245.wns.windows.com
0.0.0.0 db5sch101110315.wns.windows.com
0.0.0.0 db5sch101110323.wns.windows.com
0.0.0.0 db5sch101110325.wns.windows.com
0.0.0.0 db5sch101110328.wns.windows.com
0.0.0.0 db5sch101110331.wns.windows.com
0.0.0.0 db5sch101110341.wns.windows.com
0.0.0.0 db5sch101110343.wns.windows.com
0.0.0.0 db5sch101110345.wns.windows.com
0.0.0.0 db5sch101110403.wns.windows.com
0.0.0.0 db5sch101110419.wns.windows.com
0.0.0.0 db5sch101110438.wns.windows.com
0.0.0.0 db5sch101110442.wns.windows.com
0.0.0.0 db5sch101110501.wns.windows.com
0.0.0.0 db5sch101110527.wns.windows.com
0.0.0.0 db5sch101110533.wns.windows.com
0.0.0.0 db5sch101110618.wns.windows.com
0.0.0.0 db5sch101110622.wns.windows.com
0.0.0.0 db5sch101110624.wns.windows.com
0.0.0.0 db5sch101110626.wns.windows.com
0.0.0.0 db5sch101110634.wns.windows.com
0.0.0.0 db5sch101110705.wns.windows.com
0.0.0.0 db5sch101110724.wns.windows.com
0.0.0.0 db5sch101110740.wns.windows.com
0.0.0.0 db5sch101110810.wns.windows.com
0.0.0.0 db5sch101110816.wns.windows.com
0.0.0.0 db5sch101110821.wns.windows.com
0.0.0.0 db5sch101110822.wns.windows.com
0.0.0.0 db5sch101110825.wns.windows.com
0.0.0.0 db5sch101110828.wns.windows.com
0.0.0.0 db5sch101110835.wns.windows.com
0.0.0.0 db5sch101110919.wns.windows.com
0.0.0.0 db5sch101110921.wns.windows.com
0.0.0.0 db5sch101110923.wns.windows.com
0.0.0.0 db5sch101110929.wns.windows.com
0.0.0.0 db5sch103081814.wns.windows.com
0.0.0.0 db5sch103082011.wns.windows.com
0.0.0.0 db5sch103082111.wns.windows.com
0.0.0.0 db5sch103082308.wns.windows.com
0.0.0.0 db5sch103082406.wns.windows.com
0.0.0.0 db5sch103082409.wns.windows.com
0.0.0.0 db5sch103082609.wns.windows.com
0.0.0.0 db5sch103082611.wns.windows.com
0.0.0.0 db5sch103082709.wns.windows.com
0.0.0.0 db5sch103082712.wns.windows.com
0.0.0.0 db5sch103082806.wns.windows.com
0.0.0.0 db5sch103090115.wns.windows.com
0.0.0.0 db5sch103090415.wns.windows.com
0.0.0.0 db5sch103090513.wns.windows.com
0.0.0.0 db5sch103090515.wns.windows.com
0.0.0.0 db5sch103090608.wns.windows.com
0.0.0.0 db5sch103090806.wns.windows.com
0.0.0.0 db5sch103090814.wns.windows.com
0.0.0.0 db5sch103090906.wns.windows.com
0.0.0.0 db5sch103091011.wns.windows.com
0.0.0.0 db5sch103091012.wns.windows.com
0.0.0.0 db5sch103091106.wns.windows.com
0.0.0.0 db5sch103091108.wns.windows.com
0.0.0.0 db5sch103091212.wns.windows.com
0.0.0.0 db5sch103091311.wns.windows.com
0.0.0.0 db5sch103091414.wns.windows.com
0.0.0.0 db5sch103091511.wns.windows.com
0.0.0.0 db5sch103091617.wns.windows.com
0.0.0.0 db5sch103091715.wns.windows.com
0.0.0.0 db5sch103091817.wns.windows.com
0.0.0.0 db5sch103091908.wns.windows.com
0.0.0.0 db5sch103091911.wns.windows.com
0.0.0.0 db5sch103092010.wns.windows.com
0.0.0.0 db5sch103092108.wns.windows.com
0.0.0.0 db5sch103092109.wns.windows.com
0.0.0.0 db5sch103092209.wns.windows.com
0.0.0.0 db5sch103092210.wns.windows.com
0.0.0.0 db5sch103092509.wns.windows.com
0.0.0.0 db5sch103100117.wns.windows.com
0.0.0.0 db5sch103100121.wns.windows.com
0.0.0.0 db5sch103100221.wns.windows.com
0.0.0.0 db5sch103100313.wns.windows.com
0.0.0.0 db5sch103100314.wns.windows.com
0.0.0.0 db5sch103100510.wns.windows.com
0.0.0.0 db5sch103100511.wns.windows.com
0.0.0.0 db5sch103100611.wns.windows.com
0.0.0.0 db5sch103100712.wns.windows.com
0.0.0.0 db5sch103101105.wns.windows.com
0.0.0.0 db5sch103101208.wns.windows.com
0.0.0.0 db5sch103101212.wns.windows.com
0.0.0.0 db5sch103101314.wns.windows.com
0.0.0.0 db5sch103101411.wns.windows.com
0.0.0.0 db5sch103101413.wns.windows.com
0.0.0.0 db5sch103101513.wns.windows.com
0.0.0.0 db5sch103101610.wns.windows.com
0.0.0.0 db5sch103101611.wns.windows.com
0.0.0.0 db5sch103101705.wns.windows.com
0.0.0.0 db5sch103101711.wns.windows.com
0.0.0.0 db5sch103101909.wns.windows.com
0.0.0.0 db5sch103101914.wns.windows.com
0.0.0.0 db5sch103102009.wns.windows.com
0.0.0.0 db5sch103102112.wns.windows.com
0.0.0.0 db5sch103102203.wns.windows.com
0.0.0.0 db5sch103102209.wns.windows.com
0.0.0.0 db5sch103102310.wns.windows.com
0.0.0.0 db5sch103102404.wns.windows.com
0.0.0.0 db5sch103102609.wns.windows.com
0.0.0.0 db5sch103102610.wns.windows.com
0.0.0.0 db5sch103102805.wns.windows.com
0.0.0.0 db5wns1d.wns.windows.com
0.0.0.0 db6sch102090104.wns.windows.com
0.0.0.0 db6sch102090112.wns.windows.com
0.0.0.0 db6sch102090116.wns.windows.com
0.0.0.0 db6sch102090122.wns.windows.com
0.0.0.0 db6sch102090203.wns.windows.com
0.0.0.0 db6sch102090206.wns.windows.com
0.0.0.0 db6sch102090208.wns.windows.com
0.0.0.0 db6sch102090209.wns.windows.com
0.0.0.0 db6sch102090211.wns.windows.com
0.0.0.0 db6sch102090305.wns.windows.com
0.0.0.0 db6sch102090306.wns.windows.com
0.0.0.0 db6sch102090308.wns.windows.com
0.0.0.0 db6sch102090311.wns.windows.com
0.0.0.0 db6sch102090313.wns.windows.com
0.0.0.0 db6sch102090410.wns.windows.com
0.0.0.0 db6sch102090412.wns.windows.com
0.0.0.0 db6sch102090504.wns.windows.com
0.0.0.0 db6sch102090510.wns.windows.com
0.0.0.0 db6sch102090512.wns.windows.com
0.0.0.0 db6sch102090513.wns.windows.com
0.0.0.0 db6sch102090514.wns.windows.com
0.0.0.0 db6sch102090519.wns.windows.com
0.0.0.0 db6sch102090613.wns.windows.com
0.0.0.0 db6sch102090619.wns.windows.com
0.0.0.0 db6sch102090810.wns.windows.com
0.0.0.0 db6sch102090811.wns.windows.com
0.0.0.0 db6sch102090902.wns.windows.com
0.0.0.0 db6sch102090905.wns.windows.com
0.0.0.0 db6sch102090907.wns.windows.com
0.0.0.0 db6sch102090908.wns.windows.com
0.0.0.0 db6sch102090910.wns.windows.com
0.0.0.0 db6sch102090911.wns.windows.com
0.0.0.0 db6sch102091003.wns.windows.com
0.0.0.0 db6sch102091007.wns.windows.com
0.0.0.0 db6sch102091008.wns.windows.com
0.0.0.0 db6sch102091009.wns.windows.com
0.0.0.0 db6sch102091011.wns.windows.com
0.0.0.0 db6sch102091103.wns.windows.com
0.0.0.0 db6sch102091105.wns.windows.com
0.0.0.0 db6sch102091204.wns.windows.com
0.0.0.0 db6sch102091209.wns.windows.com
0.0.0.0 db6sch102091305.wns.windows.com
0.0.0.0 db6sch102091307.wns.windows.com
0.0.0.0 db6sch102091308.wns.windows.com
0.0.0.0 db6sch102091309.wns.windows.com
0.0.0.0 db6sch102091314.wns.windows.com
0.0.0.0 db6sch102091412.wns.windows.com
0.0.0.0 db6sch102091503.wns.windows.com
0.0.0.0 db6sch102091507.wns.windows.com
0.0.0.0 db6sch102091602.wns.windows.com
0.0.0.0 db6sch102091603.wns.windows.com
0.0.0.0 db6sch102091606.wns.windows.com
0.0.0.0 db6sch102091607.wns.windows.com
0.0.0.0 deploy.static.akamaitechnologies.com
0.0.0.0 dev.virtualearth.net
0.0.0.0 df.telemetry.microsoft.com
0.0.0.0 diagnostics.support.microsoft.com
0.0.0.0 disc101-prod.do.dsp.mp.microsoft.com
0.0.0.0 disc201-prod.do.dsp.mp.microsoft.com
0.0.0.0 disc401-prod.do.dsp.mp.microsoft.com
0.0.0.0 dmd.metaservices.microsoft.com
0.0.0.0 eaus2watcab01.blob.core.windows.net
0.0.0.0 eaus2watcab02.blob.core.windows.net
0.0.0.0 ec.atdmt.com
0.0.0.0 ecn.dev.virtualearth.net
0.0.0.0 edge.microsoft.com
0.0.0.0 eu.vortex-win.data.microsft.com
0.0.0.0 eu.vortex.data.microsoft.com
0.0.0.0 fe2.update.microsoft.com.akadns.net
0.0.0.0 fe3.delivery.dsp.mp.microsoft.com.nsatc.net
0.0.0.0 feedback.microsoft-hohm.com
0.0.0.0 feedback.search.microsoft.com
0.0.0.0 feedback.windows.com
0.0.0.0 flex.msn.com
0.0.0.0 fs.microsoft.com
0.0.0.0 g.msn.com
0.0.0.0 geo-prod.do.dsp.mp.microsoft.com
0.0.0.0 geo.settings-win.data.microsoft.com.akadns.net
0.0.0.0 geo.settings.data.microsoft.com.akadns.net
0.0.0.0 geo.vortex.data.microsoft.com.akadns.net
0.0.0.0 geover-prod.do.dsp.mp.microsoft.com
0.0.0.0 h1.msn.com
0.0.0.0 h2.msn.com
0.0.0.0 hk2.settings.data.microsoft.com.akadns.net
0.0.0.0 hk2.wns.windows.com
0.0.0.0 hk2sch130020721.wns.windows.com
0.0.0.0 hk2sch130020723.wns.windows.com
0.0.0.0 hk2sch130020726.wns.windows.com
0.0.0.0 hk2sch130020729.wns.windows.com
0.0.0.0 hk2sch130020732.wns.windows.com
0.0.0.0 hk2sch130020824.wns.windows.com
0.0.0.0 hk2sch130020843.wns.windows.com
0.0.0.0 hk2sch130020851.wns.windows.com
0.0.0.0 hk2sch130020854.wns.windows.com
0.0.0.0 hk2sch130020855.wns.windows.com
0.0.0.0 hk2sch130020924.wns.windows.com
0.0.0.0 hk2sch130020936.wns.windows.com
0.0.0.0 hk2sch130020940.wns.windows.com
0.0.0.0 hk2sch130020956.wns.windows.com
0.0.0.0 hk2sch130020958.wns.windows.com
0.0.0.0 hk2sch130020961.wns.windows.com
0.0.0.0 hk2sch130021017.wns.windows.com
0.0.0.0 hk2sch130021029.wns.windows.com
0.0.0.0 hk2sch130021035.wns.windows.com
0.0.0.0 hk2sch130021137.wns.windows.com
0.0.0.0 hk2sch130021142.wns.windows.com
0.0.0.0 hk2sch130021153.wns.windows.com
0.0.0.0 hk2sch130021217.wns.windows.com
0.0.0.0 hk2sch130021246.wns.windows.com
0.0.0.0 hk2sch130021249.wns.windows.com
0.0.0.0 hk2sch130021260.wns.windows.com
0.0.0.0 hk2sch130021264.wns.windows.com
0.0.0.0 hk2sch130021322.wns.windows.com
0.0.0.0 hk2sch130021323.wns.windows.com
0.0.0.0 hk2sch130021329.wns.windows.com
0.0.0.0 hk2sch130021334.wns.windows.com
0.0.0.0 hk2sch130021360.wns.windows.com
0.0.0.0 hk2sch130021432.wns.windows.com
0.0.0.0 hk2sch130021433.wns.windows.com
0.0.0.0 hk2sch130021435.wns.windows.com
0.0.0.0 hk2sch130021437.wns.windows.com
0.0.0.0 hk2sch130021440.wns.windows.com
0.0.0.0 hk2sch130021450.wns.windows.com
0.0.0.0 hk2sch130021518.wns.windows.com
0.0.0.0 hk2sch130021523.wns.windows.com
0.0.0.0 hk2sch130021526.wns.windows.com
0.0.0.0 hk2sch130021527.wns.windows.com
0.0.0.0 hk2sch130021544.wns.windows.com
0.0.0.0 hk2sch130021554.wns.windows.com
0.0.0.0 hk2sch130021618.wns.windows.com
0.0.0.0 hk2sch130021634.wns.windows.com
0.0.0.0 hk2sch130021638.wns.windows.com
0.0.0.0 hk2sch130021646.wns.windows.com
0.0.0.0 hk2sch130021652.wns.windows.com
0.0.0.0 hk2sch130021654.wns.windows.com
0.0.0.0 hk2sch130021657.wns.windows.com
0.0.0.0 hk2sch130021723.wns.windows.com
0.0.0.0 hk2sch130021726.wns.windows.com
0.0.0.0 hk2sch130021727.wns.windows.com
0.0.0.0 hk2sch130021730.wns.windows.com
0.0.0.0 hk2sch130021731.wns.windows.com
0.0.0.0 hk2sch130021754.wns.windows.com
0.0.0.0 hk2sch130021829.wns.windows.com
0.0.0.0 hk2sch130021830.wns.windows.com
0.0.0.0 hk2sch130021833.wns.windows.com
0.0.0.0 hk2sch130021840.wns.windows.com
0.0.0.0 hk2sch130021842.wns.windows.com
0.0.0.0 hk2sch130021851.wns.windows.com
0.0.0.0 hk2sch130021852.wns.windows.com
0.0.0.0 hk2sch130021927.wns.windows.com
0.0.0.0 hk2sch130021928.wns.windows.com
0.0.0.0 hk2sch130021929.wns.windows.com
0.0.0.0 hk2sch130021958.wns.windows.com
0.0.0.0 hk2sch130022035.wns.windows.com
0.0.0.0 hk2sch130022041.wns.windows.com
0.0.0.0 hk2sch130022049.wns.windows.com
0.0.0.0 hk2sch130022135.wns.windows.com
0.0.0.0 hk2wns1.wns.windows.com
0.0.0.0 hk2wns1b.wns.windows.com
0.0.0.0 i-bl6p-cor001.api.p001.1drv.com
0.0.0.0 i-by3p-cor001.api.p001.1drv.com
0.0.0.0 i-by3p-cor002.api.p001.1drv.com
0.0.0.0 i-ch1-cor001.api.p001.1drv.com
0.0.0.0 i-ch1-cor002.api.p001.1drv.com
0.0.0.0 i-sn2-cor001.api.p001.1drv.com
0.0.0.0 i-sn2-cor002.api.p001.1drv.com
0.0.0.0 i1.services.social.microsoft.com
0.0.0.0 i1.services.social.microsoft.com.nsatc.net
0.0.0.0 ieonlinews.microsoft.com
0.0.0.0 ieonlinews.trafficmanager.net
0.0.0.0 img-s-msn-com.akamaized.net
0.0.0.0 inference.location.live.net
0.0.0.0 insiderppe.cloudapp.net
0.0.0.0 insideruser.trafficmanager.net
0.0.0.0 kmwatson.events.data.microsoft.com
0.0.0.0 kmwatsonc.events.data.microsoft.com
0.0.0.0 kv101-prod.do.dsp.mp.microsoft.com
0.0.0.0 kv201-prod.do.dsp.mp.microsoft.com
0.0.0.0 kv401-prod.do.dsp.mp.microsoft.com
0.0.0.0 lb1.www.ms.akadns.net
0.0.0.0 live.rads.msn.com
0.0.0.0 ls2web.redmond.corp.microsoft.com
0.0.0.0 m.adnxs.com
0.0.0.0 m.hotmail.com
0.0.0.0 mediaredirect.microsoft.com
0.0.0.0 mobile.pipe.aria.microsoft.com
0.0.0.0 modern.watson.data.microsoft.com.akadns.net
0.0.0.0 msedge.net
0.0.0.0 msftconnecttest.com
0.0.0.0 msftncsi.com
0.0.0.0 msnbot-207-46-194-33.search.msn.com
0.0.0.0 msnbot-65-55-108-23.search.msn.com
0.0.0.0 msntest.serving-sys.com
0.0.0.0 nexus.officeapps.live.com
0.0.0.0 nexusrules.officeapps.live.com
0.0.0.0 nw-umwatson.events.data.microsoft.com
0.0.0.0 oca.telemetry.microsoft.com
0.0.0.0 oca.telemetry.microsoft.com.nsatc.net
0.0.0.0 oca.telemetry.microsoft.us
0.0.0.0 officeclient.microsoft.com
0.0.0.0 oneclient.sfx.ms
0.0.0.0 onecollector.cloudapp.aria.akadns.net
0.0.0.0 par02p.wns.windows.com
0.0.0.0 pre.footprintpredict.com
0.0.0.0 presence.teams.live.com
0.0.0.0 preview.msn.com
0.0.0.0 pricelist.skype.com
0.0.0.0 pti.store.microsoft.com
0.0.0.0 query.prod.cms.rt.microsoft.com
0.0.0.0 rad.live.com
0.0.0.0 rad.msn.com
0.0.0.0 redir.metaservices.microsoft.com
0.0.0.0 register.cdpcs.microsoft.com
0.0.0.0 reports.wes.df.telemetry.microsoft.com
0.0.0.0 romeccs.microsoft.com
0.0.0.0 s.gateway.messenger.live.com
0.0.0.0 s0.2mdn.net
0.0.0.0 sO.2mdn.net
0.0.0.0 schemas.microsoft.akadns.net
0.0.0.0 scorecardresearch.com
0.0.0.0 secure.adnxs.com
0.0.0.0 secure.flashtalking.com
0.0.0.0 services.wes.df.telemetry.microsoft.com
0.0.0.0 settings-sandbox.data.microsoft.com
0.0.0.0 settings-ssl.xboxlive.com
0.0.0.0 settings-win-ppe.data.microsoft.com
0.0.0.0 settings-win.data.microsoft.com
0.0.0.0 settings.data.glbdns2.microsoft.com
0.0.0.0 settings.data.microsof.com
0.0.0.0 settingsfd-geo.trafficmanager.net
0.0.0.0 sg2p.wns.windows.com
0.0.0.0 sls.update.microsoft.com.akadns.net
0.0.0.0 sn3301-c.1drv.com
0.0.0.0 sn3301-e.1drv.com
0.0.0.0 sn3301-g.1drv.com
0.0.0.0 so.2mdn.net
0.0.0.0 spynet2.microsoft.com
0.0.0.0 spynetalt.microsoft.com
0.0.0.0 spyneteurope.microsoft.akadns.net
0.0.0.0 sqm.df.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net
0.0.0.0 ssw.live.com
0.0.0.0 static.2mdn.net
0.0.0.0 stats-microsoft.com
0.0.0.0 statsfe1.ws.microsoft.com
0.0.0.0 statsfe2.update.microsoft.com.akadns.net
0.0.0.0 statsfe2.ws.microsoft.com
0.0.0.0 storecatalogrevocation.storequality.microsoft.com
0.0.0.0 survey.watson.microsoft.com
0.0.0.0 t0.ssl.ak.dynamic.tiles.virtualearth.net
0.0.0.0 t0.ssl.ak.tiles.virtualearth.net
0.0.0.0 tele.trafficmanager.net
0.0.0.0 telecommand.telemetry.microsoft.com
0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net
0.0.0.0 telemetry.appex.bing.com
0.0.0.0 telemetry.appex.bing.net
0.0.0.0 telemetry.microsoft.com
0.0.0.0 telemetry.microsoft.comecho
0.0.0.0 telemetry.remoteapp.windowsazure.com
0.0.0.0 telemetry.urs.microsoft.com
0.0.0.0 teredo.ipv6.microsoft.com
0.0.0.0 test.activity.windows.com
0.0.0.0 tile-service.weather.microsoft.com
0.0.0.0 time.windows.com
0.0.0.0 tk2.plt.msn.com
0.0.0.0 tsfe.trafficshaping.dsp.mp.microsoft.com
0.0.0.0 ui.skype.com
0.0.0.0 uks.b.prd.ags.trafficmanager.net
0.0.0.0 umwatson.events.data.microsoft.com
0.0.0.0 umwatsonc.events.data.microsoft.com
0.0.0.0 umwatsonc.telemetry.microsoft.us
0.0.0.0 urs.microsoft.com.nsatc.net
0.0.0.0 urs.smartscreen.microsoft.com
0.0.0.0 us-v10.events.data.microsoft.com
0.0.0.0 us-v20.events.data.microsoft.com
0.0.0.0 us.vortex-win.data.microsoft.com
0.0.0.0 v10-win.vortex.data.microsft.com.akadns.net
0.0.0.0 v10-win.vortex.data.microsoft.com.akadns.net
0.0.0.0 v10.vortex-win.data.metron.live.com.nsatc.net
0.0.0.0 v10.vortex-win.data.microsft.com
0.0.0.0 v10.vortex-win.data.microsoft.com
0.0.0.0 v20.vortex-win.data.microsoft.com
0.0.0.0 version.hybrid.api.here.com
0.0.0.0 view.atdmt.com
0.0.0.0 vortex-bn2.metron.live.com.nsatc.net
0.0.0.0 vortex-cy2.metron.live.com.nsatc.net
0.0.0.0 vortex-db5.metron.live.com.nsatc.net
0.0.0.0 vortex-hk2.metron.live.com.nsatc.net
0.0.0.0 vortex-sandbox.data.microsoft.com
0.0.0.0 vortex-win-sandbox.data.microsoft.com
0.0.0.0 vortex-win.data.metron.live.com.nsatc.net
0.0.0.0 vortex-win.data.microsoft.com
0.0.0.0 vortex.data.glbdns2.microsoft.com
0.0.0.0 vortex.data.metron.live.com.nsatc.net
0.0.0.0 vortex.data.microsoft.com
0.0.0.0 vsgallery.com
0.0.0.0 watson.live.com
0.0.0.0 watson.microsoft.com
0.0.0.0 watson.ppe.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com.nsatc.net
0.0.0.0 wdcp.microsoft.com
0.0.0.0 wdcpalt.microsoft.com
0.0.0.0 web.vortex.data.microsoft.com
0.0.0.0 wes.df.telemetry.microsoft.com
0.0.0.0 weus2watcab01.blob.core.windows.net
0.0.0.0 weus2watcab02.blob.core.windows.net
0.0.0.0 win10-trt.msedge.net
0.0.0.0 win10.ipv6.microsoft.com
0.0.0.0 win1710.ipv6.microsoft.com
0.0.0.0 win8.ipv6.microsoft.com
0.0.0.0 wns.notify.windows.com.akadns.net
0.0.0.0 wscont.apps.microsoft.com
0.0.0.0 www.msedge.net
0.0.0.0 www.msftncsi.com
0.0.0.0 xblgdvrassets3010.blob.core.windows.net
0.0.0.0 ztd.dds.microsoft.com
"@ | Out-File -FilePath "$env:WINDIR\System32\drivers\etc\hosts" -Encoding ASCII
}


# ==================================================
# Software Installation / Update
# ==================================================


function Software {
    $installWinget = cls; Read-Host "`n  # Install winget? (Y/N)"

    if ($installWinget -eq 'Y' -or $installWinget -eq 'y') {
        Write-Host "  # Installing [92mwinget[0m..."

        $latestWingetUrl = Invoke-RestMethod -Uri 'https://api.github.com/repos/microsoft/winget-cli/releases/latest' | 
                            Select-Object -ExpandProperty assets | 
                            Where-Object { $_.name -like '*msixbundle*' } | 
                            Select-Object -ExpandProperty browser_download_url

        if ($latestWingetUrl) {
            $downloadPath = Join-Path $env:TEMP 'Microsoft.DesktopAppInstaller.msixbundle'
            Invoke-WebRequest -Uri $latestWingetUrl -OutFile $downloadPath -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' -UseBasicParsing
            Start-Process -Wait -FilePath "Add-AppxPackage" -ArgumentList "$downloadPath"
            Remove-Item -Path $downloadPath -Force
        } else {
            cls; Write-Host "`n  # [91mFailed[0m to obtain the latest winget version."; Start-Sleep -Seconds 3
            return
        }
    } else {
        cls; Write-Host "`n  # Skipped winget installation."
        return
    }

    $packages = @"
7-Zip
"@

    $pingResult = Test-Connection -ComputerName 9.9.9.9 -Count 1 -Quiet

    if ($pingResult) {
        # Install specified packages
        foreach ($package in $packages) {
            $installedPackage = winget list | Select-String $package
            if (-not $installedPackage) {
                cls; Write-Host "`n  # Installing package: [92m$package[0m"; Start-Sleep -Seconds 3
                winget install -h --id $package
            } else {
                cls; Write-Host "`n  # [92m$package[0m is already installed."; Start-Sleep -Seconds 3
            }
        }

        $launcherPath = Join-Path ${env:ProgramFiles(x86)} "\EverythingToolbar\EverythingToolbar.Launcher.exe"
        if (Test-Path $launcherPath) {
            # Start-Process -FilePath $launcherPath -NoNewWindow
        }
    } else {
        cls; Write-Host "`n  # Software Download: [91mFAILED[0m (No Internet)"; Start-Sleep -Seconds 3
    }
}


# ==================================================
# DNS
# ==================================================


function DNS {
    function Set-DnsConfiguration {
        param(
            [string]$Ipv4PrimaryDns,
            [string]$Ipv4BackupDns,
            [string]$Ipv6PrimaryDns,
            [string]$Ipv6BackupDns
        )

        Get-NetAdapter | Where-Object Status -eq 'Up' | ForEach-Object {
            Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses $Ipv4PrimaryDns, $Ipv4BackupDns, $Ipv6PrimaryDns, $Ipv6BackupDns
        }

        Clear-DnsClientCache
    }

    $menu = @"
IPv4 & IPv6 DNS Providers:

[1] - [93mCloudflare[0m [1.1.1.1]
[2] - [94mGoogle[0m     [8.8.8.8]
[3] - [91mQuad9[0m      [9.9.9.9]
[4] - [92mNone (Skip DNS Configuration)[0m
"@

    do {
        cls
        Write-Host $menu
        $choice = Read-Host "`n  "

        switch ($choice) {
            '1' { Set-DnsConfiguration -Ipv4PrimaryDns "1.1.1.1" -Ipv4BackupDns "1.0.0.1" -Ipv6PrimaryDns "2606:4700:4700::1111" -Ipv6BackupDns "2606:4700:4700::1001" }
            '2' { Set-DnsConfiguration -Ipv4PrimaryDns "8.8.8.8" -Ipv4BackupDns "8.8.4.4" -Ipv6PrimaryDns "2001:4860:4860::8888" -Ipv6BackupDns "2001:4860:4860::8844" }
            '3' { Set-DnsConfiguration -Ipv4PrimaryDns "9.9.9.9" -Ipv4BackupDns "149.112.112.112" -Ipv6PrimaryDns "2620:fe::fe" -Ipv6BackupDns "2620:fe::9" }
            '4' { Write-Host "No DNS configuration will be applied." }
            default {
                cls
                Write-Host "`n  [31m# ""$choice"" isn't a valid option, please try again.[0m"
                Start-Sleep -Seconds 3
            }
        }
    } while ($choice -notin '1', '2', '3', '4')
}


# ==================================================
# Clean System
# ==================================================


function Clean {
    $paths = @(
        "$env:WINDIR\SoftwareDistribution\Download\*"
        "$env:SystemDrive\Windows\Installer\*"
        "$env:SystemDrive\Windows\Temp\*"
        "$env:SystemDrive\Windows.old"
        "$env:WINDIR\Prefetch\*"
        "$env:tmp\*"
    )

    foreach ($path in $paths) {
        Remove-Item -Path $path -Force -Recurse -ErrorAction SilentlyContinue
    }

    # Clear event logs
    wevtutil el | ForEach-Object { wevtutil cl "$_" } > $null

    # Delete ARP cache
    arp -d *

    # Clear Recycle Bin
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

    # Restart Explorer
    Stop-Process -Name explorer -Force
    Start-Process explorer -NoNewWindow
}


# ==================================================
# Exit
# ==================================================


function Exit-Menu {
	cls; Write-Host "`n  [92m# Optimization Complete.[0m"; Start-Sleep -Seconds 3
	Main-Menu
}


# ==================================================
# Main Menu
# ==================================================


$Host.UI.RawUI.WindowTitle = "Windows - Multi-Tool"
mode con:cols=33 lines=13

function Main-Menu {
    cls; Write-Host @"

    Windows - Multi-Tool 


   [1] - Activate Windows
   [2] - Update all Apps
   [3] - Optimize Windows

"@
}

while ($true) {
	Main-Menu
	$c = Read-Host "   "; cls

	switch ($c) {
		'1' {
			iex (irm 'https://get.activated.win')
			Main-Menu
			break
		}
		'2' {
			cls; Write-Host "`n   # Receiving Latest Updates`n"
			winget upgrade -h --all
			Main-Menu
			break
		}
		'3' {
			Apps *>$null
			Scheduled-Tasks *>$null
			Services *>$null
			Registry *>$null
			Hosts *>$null
			Software
			DNS
			Clean *>$null
			Exit-Menu
			SystemPropertiesPerformance.exe; ncpa.cpl
			Main-Menu
			break
		}
		default {
			cls; Write-Host "`n   [31m# ""$c"" is invalid.[0m`n"; Start-Sleep -Seconds 2
		}
	}
}
