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

	; Ermittelt/Setzt, ob das Men&uuml;item '&Ouml;ffnen' ausgegraut ist
	Writeln("Men&uuml;item '&Ouml;ffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))
	_GUICtrlMenu_SetItemGrayed($hFile, 1)
	Writeln("Men&uuml;item '&Ouml;ffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
