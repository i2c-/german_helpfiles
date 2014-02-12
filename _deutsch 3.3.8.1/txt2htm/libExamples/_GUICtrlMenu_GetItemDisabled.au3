#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt, ob das Men&uuml;item deaktiviert ist / Deaktiviert ein Men&uuml;item
	Writeln("Der Men&uuml;punkt '&Ouml;ffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemDisabled($hFile, 1)
	Writeln("Der Men&uuml;punkt '&Ouml;ffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemEnabled($hFile, 1)
	Writeln("Der Men&uuml;punkt '&Ouml;ffnen' ist aktiviert : " & _GUICtrlMenu_GetItemEnabled($hFile, 1))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
