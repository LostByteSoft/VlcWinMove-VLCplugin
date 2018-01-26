;;--- Head --- Informations --- AHK ---

;;	VLC reset position VLC x64 only. Reset position of VLC and/or start if not.
;;	Compatibility: Windows
;;	All files must be in same folder. Where you want.
;;	64 bit AHK version : 1.1.24.2 64 bit Unicode

;;--- Softwares options ---

	SetEnv, title, VLC reset position
	SetEnv, mode, VLC reset position
	SetEnv, version, Version 2018-01-26-0730
	SetEnv, Author, LostByteSoft
	SetEnv, icofolder, C:\Program Files\Common Files
	SetEnv, debug, 0
	SetEnv, logoicon, ico_VlcWinMove.ico

	SetWorkingDir, %A_ScriptDir%
	SetTitleMatchMode, 2
	SysGet, Mon1, Monitor, 1

	FileInstall, ico_VlcWinMove.ico, %icofolder%\ico_VlcWinMove.ico, 0

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %icofolder%\%logoicon%
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program
	Menu, Tray, Icon, Secret MsgBox, %icofolder%\ico_lock.ico
	Menu, tray, add, About && ReadMe, author
	Menu, Tray, Icon, About && ReadMe, %icofolder%\ico_about.ico
	Menu, tray, add, Author %author%, about
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about
	menu, tray, disable, %version%
	Menu, tray, add,
	Menu, tray, add, --== Control ==--, about
	Menu, Tray, Icon, --== Control ==--, %icofolder%\ico_options.ico
	Menu, tray, add, Exit %title%, ExitApp					; Close exit program
	Menu, Tray, Icon, Exit %title%, %icofolder%\ico_shut.ico
	Menu, tray, add, Refresh (ini mod), doReload 				; Reload the script.
	Menu, Tray, Icon, Refresh (ini mod), %icofolder%\ico_reboot.ico
	Menu, tray, add, Set Debug (Toggle), debug
	Menu, Tray, Icon, Set Debug (Toggle), %icofolder%\ico_debug.ico
	Menu, tray, add, Pause (Toggle), pause
	Menu, Tray, Icon, Pause (Toggle), %icofolder%\ico_pause.ico
	menu, tray, add
	Menu, Tray, Tip, %mode%

;;--- Software start here ---

IfWinNotExist, Lecteur multimédia VLC,, goto, start
	goto, move

start:
	IfExist, C:\Program Files\VideoLAN\VLC\Vlc.exe
	{
		run, C:\Program Files\VideoLAN\VLC\Vlc.exe
		Sleep, 1000
		Goto, move
	}
	else
	{
		MsgBox, VLC x64 not installed.
		goto, Close
	}

move:
	WinWait, VLC
	WinActivate, VLC
	SetEnv, Var1, %Mon1Right%
	Var1 /= 12
	SetEnv, Var2, %Var1%
	Var2 *= 10
	SetEnv, Var3, %Mon1Bottom%
	Var3 /= 8
	SetEnv, Var4, %Var3%
	Var4 *= 6
	;;MsgBox, %var1% %var2% %var3% %var4%
	WinMove, Lecteur multimédia VLC, , %var1%, %var3%, %var2%, %var4%
	WinActivate, Lecteur multimédia VLC
	Goto, close

;;--- Debug Pause ---

debug:
	IfEqual, debug, 0, goto, debug1
	IfEqual, debug, 1, goto, debug0

	debug0:
	SetEnv, debug, 0
	TrayTip, %title%, Deactivated ! debug=%debug%, 1, 2
	Goto, sleep2

	debug1:
	SetEnv, debug, 1
	TrayTip, %title%, Activated ! debug=%debug%, 1, 2
	Goto, sleep2

pause:
	Ifequal, pause, 0, goto, paused
	Ifequal, pause, 1, goto, unpaused

	paused:
	SetEnv, pause, 1
	goto, sleep

	unpaused:	
	Menu, Tray, Icon, %logoicon%
	SetEnv, pause, 0
	Goto, start

	sleep:
	Menu, Tray, Icon, %icofolder%\ico_pause.ico
	sleep2:
	sleep, 500000
	goto, sleep2

;;--- Quit (escape , esc) ---

Escape::
ExitApp:
	ExitApp

Close:
	sleep, 5000
	ExitApp

;;--- Tray Bar (must be at end of file) ---

author:
	MsgBox, 64, %title%, %title% %mode% %version% %author% This software is usefull to.............. (Game fill the ....).`n`n`tGo to https://github.com/LostByteSoft
	Return

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
	Gui, Add, Picture, x25 y25 w400 h400 , %icofolder%\%logoicon%
	Gui, Show, w450 h450, %title% Logo
	Gui, Color, 000000
	return

secret:
	SetEnv, Mon2Left1, %Mon2Left%
	IfLess, Mon2Left1, -1, goto, negative1
	negative1:
	Mon2Left1 *= -1
	SetEnv, Var1, %Mon1Right%
	Var1 /= 12
	SetEnv, Var2, %Var1%
	Var2 *= 10
	SetEnv, Var3, %Mon1Bottom%
	Var3 /= 8
	SetEnv, Var4, %Var3%
	Var4 *= 6
	MsgBox, Ecran 1 Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.... Move to : %var1% %var3% %var2% %var4%
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