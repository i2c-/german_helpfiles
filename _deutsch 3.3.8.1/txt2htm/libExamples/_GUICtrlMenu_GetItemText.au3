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

	; Ermittelt/Setzt den Itemtext f&uuml;r &Ouml;ffnen
	Writeln("&Ouml;ffnen Itemtext: " & _GUICtrlMenu_GetItemText($hFile, 1))
	_GUICtrlMenu_SetItemText($hFile, 1, "&Schlie&szlig;en")
	Writeln("&Ouml;ffnen Ttemtext: " & _GUICtrlMenu_GetItemText($hFile, 1))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
