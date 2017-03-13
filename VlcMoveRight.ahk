;;--- Head --- Informations --- AHK ---

;;	Move VLC to (right) other monitor.
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

	SetEnv, title, VLC Move Right
	SetEnv, mode, VLC Move Right
	SetEnv, version, Version 2017-03-13
	SetEnv, Author, LostByteSoft

;;--- Softwares options ---

	SetWorkingDir, %A_ScriptDir%
	#SingleInstance Force
	SetTitleMatchMode, 2
	SysGet, Mon1, Monitor, 1
	SysGet, Mon2, Monitor, 2

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
		run, C:\Program Files\VideoLAN\VLC\Vlc.exe

IfExist, C:\Program Files (x86)\VideoLAN\VLC\Vlc.exe
		run, C:\Program Files (x86)\VideoLAN\VLC\Vlc.exe

	WinWait, Lecteur multimédia VLC

	move:
	; Var1 -= Var2
	SetEnv, Var1, %Mon1Right%
	SetEnv, Var2, %Mon2Right%
	var2 -= var1
	WinActivate, Lecteur multimédia VLC
	; MsgBox, Ecran 1 Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%....Ecran 2 %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%....
	;MsgBox, Move to : %Mon2Left% - 0 - %var2% - %Mon2Bottom% - need mon1right-mon2right
	WinShow, Lecteur multimédia VLC
	WinMove, Lecteur multimédia VLC, , %Mon2Left%, 0, %var2%, %Mon2Bottom%
	exitApp

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