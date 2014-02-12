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

	; Ermittelt/Setzt die ID des Men&uuml;punktes '&Ouml;ffnen'
	Writeln("ID des Men&uuml;punktes '&Ouml;ffnen': " & _GUICtrlMenu_GetItemID($hFile, 1))
	_GUICtrlMenu_SetItemID($hFile, 1, 0)
	Writeln("ID des Men&uuml;punktes '&Ouml;ffnen': " & _GUICtrlMenu_GetItemID($hFile, 1))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
