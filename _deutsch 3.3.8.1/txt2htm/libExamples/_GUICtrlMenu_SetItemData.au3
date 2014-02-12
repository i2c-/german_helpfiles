#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt/Setzt den anwendungsspezifischen Wert des Men&uuml;punktes 'Datei'
	Writeln("Anwendungsspezifischer Wert des Men&uuml;punktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))
	_GUICtrlMenu_SetItemData($hMain, 0, 1234)
	Writeln("Anwendungsspezifischer Wert des Men&uuml;punktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
