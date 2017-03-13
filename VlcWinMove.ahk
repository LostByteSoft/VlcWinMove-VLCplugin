;;--- Head --- Informations --- AHK ---

;;	VLC reset position VLC x64 only. Reset position of VLC and/or start if not.
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

	SetEnv, title, VLC reset position
	SetEnv, mode, VLC reset position
	SetEnv, version, Version 2017-03-13
	SetEnv, Author, LostByteSoft

;;--- Softwares options ---

	SetWorkingDir, %A_ScriptDir%
	#SingleInstance Force
	SetTitleMatchMode, 2
	SysGet, Mon1, Monitor, 1

;;--- Tray options

	Menu, Tray, NoStandard
	Menu, tray, add, Exit %title%, GuiClose		; GuiClose exit program
	Menu, tray, add, Refresh, doReload		; Reload the script.
	Menu, tray, add, --------, about2		; empty space
	Menu, tray, add, About - LostByteSoft, about	; Creates a new menu item.
	Menu, tray, add, Version, version		; About version

;;--- Software start here ---

IfWinNotExist, Lecteur multimédia VLC,, goto, start
	goto, move

start:
	IfExist, C:\Program Files\VideoLAN\VLC\Vlc.exe
	{
		run, C:\Program Files\VideoLAN\VLC\Vlc.exe
	}

		else
	{
		MsgBox, VLC x64 not installed.
		goto, GuiClose
	}

move:
	WinWait, VLC
	WinActivate, VLC
	;;MsgBox, Ecran 1 Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%....
	SetEnv, Var1, %Mon1Right%
	Var1 /= 4
	SetEnv, Var2, %Var1%
	Var2 *= 2
	SetEnv, Var3, %Mon1Bottom%
	Var3 /= 4
	SetEnv, Var4, %Var3%
	Var4 *= 2
	;;MsgBox, %var1% %var2% %var3% %var4%
	WinMove, Lecteur multimédia VLC, , %var1%, %var3%, %var2%, %var4%
	ExitApp

;;--- Quit (escape , esc) ---

Escape::
	ExitApp

GuiClose:
	ExitApp

;;--- Tray Bar (must be at end of file) ---

about:
about2:
	TrayTip, %title%, %mode% %author%, 2, 1
	Return

version:
	TrayTip, %title%, %version%, 2, 2
	Return

doReload:
	Reload
	Return

;;--- End of script ---
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   Version 3.14159265358979323846264338327950288419716939937510582
;                          March 2017
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;              You just DO WHAT THE FUCK YOU WANT TO.
;
;		     NO FUCKING WARRANTY AT ALL
;
;	As is customary and in compliance with current global and
;	interplanetary regulations, the author of these pages disclaims
;	all liability for the consequences of the advice given here,
;	in particular in the event of partial or total destruction of
;	the material, Loss of rights to the manufacturer's warranty,
;	electrocution, drowning, divorce, civil war, the effects of
;	radiation due to atomic fission, unexpected tax recalls or
;	    encounters with extraterrestrial beings 'elsewhere.
;
;              LostByteSoft no copyright or copyleft.
;
;	If you are unhappy with this software i do not care.
;
;;--- End of file ---