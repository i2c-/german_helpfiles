#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Hilfe-Men&uuml; entfernen
	_GUICtrlMenu_RemoveMenu($hMain, 4)

EndFunc   ;==>_Main
