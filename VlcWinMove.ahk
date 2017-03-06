;;--- Head (informations) AHK ---
;; AHK
;; VLC reset position VLC x64 only. Reset position of VLC and/or start if not.

	SetEnv, title, VLC reset position
	SetEnv, mode, VLC reset position
	SetEnv, version, Version 2017-03-06
	SetEnv, Author, LostByteSoft

;;--- Softwares options ---

	SetTitleMatchMode, 2
	SysGet, Mon1, Monitor, 1

;;--- Tray options

	Menu, tray, add, Refresh, doReload		; Reload the script.
	Menu, tray, add, --------, about		; empty space
	Menu, tray, add, About, about			; Creates a new menu item.
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
	TrayTip, %title%, %mode% %author%, 2, 1
	Return

version:
	TrayTip, %title%, %version%, 2, 2
	Return

doReload:
	Reload
	Return

;;--- End of script ---

;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;                    Version 2, December 2004
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;              You just DO WHAT THE FUCK YOU WANT TO.

;;--- End of file ---