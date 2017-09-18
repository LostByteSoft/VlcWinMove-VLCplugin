;;--- Head --- Informations --- AHK ---

;;	Move VLC to (right) other monitor.
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

	SetEnv, title, VLC Move Right
	SetEnv, mode, VLC Move Right
	SetEnv, version, Version 2017-09-15-1919
	SetEnv, Author, LostByteSoft

;;--- Softwares options ---

	SetWorkingDir, %A_ScriptDir%
	#SingleInstance Force
	SetTitleMatchMode, 2
	SysGet, Mon1, Monitor, 1
	SysGet, Mon2, Monitor, 2

	FileInstall, ico_VlcMoveRight.ico, ico_VlcMoveRight.ico, 0

;;--- Tray options

	Menu, Tray, NoStandard
	Menu, tray, add, Exit %title%, Close		; Close exit program
	Menu, tray, add, Refresh, doReload		; Reload the script.
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, --------, about2		; empty space
	Menu, tray, add, About - LostByteSoft, about	; Creates a new menu item.
	Menu, tray, add, Version, version		; About version

;;--- Software start here ---

	SysGet, MonitorCount, MonitorCount

IfWinExist, Lecteur multim�dia VLC,, goto, move
	goto, start

start:
	IfExist, C:\Program Files\VideoLAN\VLC\Vlc.exe
		run, C:\Program Files\VideoLAN\VLC\Vlc.exe

IfExist, C:\Program Files (x86)\VideoLAN\VLC\Vlc.exe
		run, C:\Program Files (x86)\VideoLAN\VLC\Vlc.exe

	WinWait, Lecteur multim�dia VLC
	WinActivate, Lecteur multim�dia VLC

move:
	IfEqual, MonitorCount, 1, Goto, JustMove

	; Var1 -= Var2
	SetEnv, Var1, %Mon1Left%
	SetEnv, Var2, %Mon2Left%
	var2 -= var1
	WinActivate, Lecteur multim�dia VLC
	; MsgBox, Ecran 1 Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%....Ecran 2 %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%....
	;MsgBox, Move to : %Mon2Left% - 0 - %var2% - %Mon2Bottom% - need mon1right-mon2right
	WinShow, Lecteur multim�dia VLC
	WinMove, Lecteur multim�dia VLC, , %Mon2Right%, 0, %var2%, %Mon2Bottom%
	exitApp

JustMove:
	WinWait, Lecteur multim�dia VLC
	WinActivate, Lecteur multim�dia VLC
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
	WinMove, Lecteur multim�dia VLC, , %var1%, %var3%, %var2%, %var4%
	ExitApp

;;--- Quit (escape , esc) ---

Escape::
	ExitApp

Close:
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

GuiLogo:
	Gui, Add, Picture, x25 y25 w400 h400 , ico_VlcMoveRight.ico
	Gui, Show, w450 h450, %title% Logo
	Gui, Color, 000000
	return

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
;      The warranty is included in your anus. Look carefully you
;             might miss all theses small characters.
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