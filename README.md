> [!CAUTION]
> For your system safety, please inspect the source code before executing.

## How to run:
1. Download `debloat.ps1` to your Downloads directory
2. Open PowerShell as Administrator
3. Enter the current directory where `debloat.ps1` is located:
```
cd "$env:USERPROFILE\Downloads"
```
4. Set the PowerShell Execution Policy:
```
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
```
5. Execute the script:
```
.\debloat.ps1
```

## Windows Tools

### ISO Downloads:
- [massgrave.dev](https://massgrave.dev/genuine-installation-media.html)
- [Windows 11 ISO](https://www.microsoft.com/software-download/windows11)
- [Windows 10 ISO](https://www.microsoft.com/software-download/windows10ISO)

### Activation:
```
irm https://get.activated.win | iex
```

## Windows System Configuration:
```
WIN + R - SystemPropertiesPerformance

☐  Animate controls and elements inside windows
☐  Animate widnows when minimzing and maximizing
☐  Animations in the taskbar
☐  Enable Peek
☐  Fade or slide menus into view
☐  Fade or slide ToolTips into view
☐  Fade out menu items after clicking
☐  Save taskbar thumbnail previews
☐  Show shadows under mouse pointer
☐  Show shadows under windows
☑  Show thumbnails instead of icons
☐  Show translucent selection rectangle
☐  Show window contents while dragging
☐  Slide open combo boxes
☑  Smooth edges of screen fonts
☐  Smooth-scroll list boxes
☐  Use drop shadows for icons labels on the desktop
```

```
WIN + R - ncpa.cpl - Select NIC, then select Properties.

☐  Client for Microsoft Networks
☐  File and Printer Sharing for Microsoft Networks
☑  Npcap Packet Driver (NPCAP)  <-- Wireshark
☐  QoS Packet Scheduler
☑  Internet Protocol Version 4 (TCP/IPv4)
☐  Microsoft Network Adapter Multiplexor Protocol
☐  Microsoft LLDP Protocol Driver
☑  Internet Protocol Version 6 (TCP/IPv6)
☐  Link-Layer Topology Discovery Responder
☐  Link-Layer Topology Discovery Mapper I/O Driver
```

```
WIN + R - mmsys.cpl

Playback | WIN + R - control mmsys.cpl,,0
☐ Show Disabled Devices
☐ Show Disconnected Devices

Recording Tabs | WIN + R - control mmsys.cpl,,1
☐ Show Disabled Devices
☐ Show Disconnected Devices

Sounds Tab | WIN + R - control mmsys.cpl,,2
Sound Scheme:
- No Sounds

Communications Tab | WIN + R - control mmsys.cpl,,3
☐ Do nothing
```

## Windows Miscellaneous

### Windows Search Broken Fix:
```
sfc /scannow
Repair-WindowsImage -Online -RestoreHealth
```

### Convert BIOS Mode from Legacy to UEFI:
```
MBR2GPT.exe /convert /allowfullos
```

### Bypass Microsoft Login:
```
oobe\bypassnro
```

### UEFI/BIOS Keys by Manufacturer:
```
shutdown /r /fw /f /t 0
```
|Manufacturer|Key/Sequence|
|-|-|
|ASRock|`F2` or `DEL`|
|ASUS|`F2` for all PCs, `F2` or `DEL` for Motherboards|
|Acer|`F2` or `DEL`|
|Dell|`F2` or `F12`|
|ECS |`DEL`|
|Gigabyte / Aorus|`F2` or `DEL`|
|HP|`F10`|
|Lenovo (Consumer Laptops)|`F2` or `Fn` + `F2`|
|Lenovo (Desktops)|`F1`|
|Lenovo (ThinkPads)|Enter then `F1`.|
|MSI|`DEL` for motherboards and PCs|
|Microsoft Surface Tablets|Press and hold `volume up` button.|
|Origin PC|`F2`|
|Samsung|`F2`|
|Toshiba|`F2`|
|Zotac|`DEL`|

### Personal Fresh Install Programs:
| Software | Links |
|-|-|
| LibreWolf | [Link](https://librewolf.net/installation/) |
| 7-Zip | [Link](https://7-zip.org/download.html) |
| VLC | [Link](https://www.videolan.org/vlc/) |
| ImageGlass | [Link](https://imageglass.org/download) |
| Notepad++ | [Link](https://notepad-plus-plus.org/downloads/) |
| LibreOffice | [Link](https://www.libreoffice.org/download/download-libreoffice/) |
| System Informer | [Link](https://www.systeminformer.com/nightly.php) |
| BCUninstaller | [Link](https://github.com/Klocman/Bulk-Crap-Uninstaller/releases/latest) |
| Wireshark | [Link](https://www.wireshark.org/download.html) |
| FreeTube | [Link](https://freetubeapp.io/#download) |
| qBittorrent | [Link](https://www.qbittorrent.org/download) |
| KeePassXC | [Link](https://keepassxc.org/download) |
| Everything | [Link](https://www.voidtools.com/) |
| EverythingToolbar | [Link](https://github.com/srwi/EverythingToolbar/releases/latest) |
| Python | [Link](https://www.python.org/downloads/) |
| ShareX | [Link](https://getsharex.com/downloads) |
