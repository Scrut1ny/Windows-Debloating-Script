# 1 - ACTIVATION
- Microsoft-Activation-Scripts > [Link](https://github.com/massgravel/Microsoft-Activation-Scripts/releases/latest)  

# 2 - DEBLOAT
- Sophia-Script-for-Windows    > [Link](https://github.com/farag2/Sophia-Script-for-Windows/releases/latest)
- O&O ShutUp10++               > [Link](https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe)
- privacy.sexy                 > [Link](https://privacy.sexy/)
- Autoruns                     > [Link](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns)
- WindowsSpyBlocker            > [Link](https://github.com/crazy-max/WindowsSpyBlocker/)
- wpd                          > [Link](https://wpd.app/)
- Blackbird                    > [Link](https://www.getblackbird.net/)

# 3 - SYSTEM

Useful Windows Shortcuts
- System Properties Performance > SystemPropertiesPerformance.exe
- Group Policy Editor           > gpedit.msc
- Services                      > services.msc
- NIC                           > ncpa.cpl
- UAC                           > UserAccountControlSettings.exe

```
WIN + R - UserAccountControlSettings.exe

 --|--
   |
 -===-  <---- Select this option!
   |
 --|--
   |
 --|--
```
```
WIN + R - SystemPropertiesPerformance.exe

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
☐  Show thumbnails instead of icons
☑  Show translucent selection rectangle
☑  Show window contents while dragging
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
### Enable *Ultimate Performance* Mode
```batch
powercfg.cpl
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /L | find "Ultimate"
powercfg /S *Ultimate Performance GUID*
```

# 4 - MISC

### BIOS Keys by Manufacturer
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

### Installation Error Code 2502 & 2503 FIX
Open CMD as admin then paste these commands in:
```batch
takeown /f “%systemroot%\Temp” /R /A /D Y
icacls “%systemroot%\Temp” /inheritance:r /grant:r Users:(OI)(CI)F /T
icacls “%systemroot%\Temp” /inheritance:r /grant:r Everyone:(OI)(CI)F /T
icacls “%systemroot%\Temp” /grant Administrators:F /T
icacls “%systemroot%\Temp” /grant Users:F /T
icacls “%systemroot%\Temp” /grant SYSTEM:F /T
icacls “%systemroot%\Temp” /grant Everyone:F /T
takeown /f “%temp%” /R /A /D Y
icacls “%temp%” /inheritance:r /grant:r Users:(OI)(CI)F /T
icacls “%temp%” /inheritance:r /grant:r Everyone:(OI)(CI)F /T
icacls “%temp%” /grant Administrators:F /T
icacls “%temp%” /grant Users:F /T
icacls “%temp%” /grant SYSTEM:F /T
icacls “%temp%” /grant Everyone:F /T
```

Free Games
- steamunlocked                 > [Link](https://steamunlocked.net/)
- crohasit                      > [Link](https://crohasit.net/)
- igg-games                     > [Link](https://igg-games.com/)

Random
- SteamAchievementManager       > [Link](https://github.com/gibbed/SteamAchievementManager/releases/latest)

Game Mod Menu's

Plutonium

sc config "upnphost" start= demand & sc start "upnphost"

- Black Ops 2 GSC Studio        > [Link](https://mega.nz/file/hDoGwAbR#j-9i3oIZyiAz13FULRTaxAiKQcSCOXo-44Lr977YfcQ)

- Call of Duty: Black Ops
	* Multiplayer  > 
	* Zombies               > [Link](https://cabconmodding.com/attachments/cabconmodding-com-encorev8-zombie-edition-0-9-rar.59/)
	
- Call of Duty: Black Ops 2
	- plutonium    > [Link](https://plutonium.pw/)
	- Black Ops 2 GSC Studio > [Link](https://mega.nz/file/hDoGwAbR#j-9i3oIZyiAz13FULRTaxAiKQcSCOXo-44Lr977YfcQ)
	* Multiplayer  > [Link](https://cabconmodding.com/attachments/cabconmodding-com-jiggy-4-3-compiled-pc-rar.1296/)
	* Zombies      > [Link](https://www.mediafire.com/?28un6sdd1wsdad6)
	* Zombies      > [Link](https://cabconmodding.com/attachments/encore_9-7_beta_by_cabcon-rar.249/)

- BO3/4 - t7-compiler > [Link](https://github.com/shiversoftdev/t7-compiler)

- Call of Duty: Black Ops 3
	* Multiplayer  > 
	* Zombies      > [Link](https://cabconmodding.com/attachments/zm_encorev14_release_1-rar.1103/)
	* Zombies      > [Link](https://cabconmodding.com/attachments/zm_encorev12_alpha_1-rar.639/)
- cod4x                > [Link](https://cod4x.ovh/)
