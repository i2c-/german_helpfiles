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

	; Ermittelt ob das &Ouml;ffnenitem markiert ist
	Writeln("&Ouml;ffnenitem markiert: " & _GUICtrlMenu_GetItemChecked($hFile, 1))
	_GUICtrlMenu_SetItemChecked($hFile, 1)
	Writeln("&Ouml;ffnenitem markiert: " & _GUICtrlMenu_GetItemChecked($hFile, 1))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
