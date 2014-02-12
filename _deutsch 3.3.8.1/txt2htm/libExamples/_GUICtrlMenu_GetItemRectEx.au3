#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $tRect

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt das begrenzende Rechteck f&uuml;r 'Datei'
	$tRect = _GUICtrlMenu_GetItemRectEx($hWnd, $hMain, 0)

	Writeln("'Datei' X1: " & DllStructGetData($tRect, "Left"))
	Writeln("'Datei' Y1: " & DllStructGetData($tRect, "Top"))
	Writeln("'Datei' X2: " & DllStructGetData($tRect, "Right"))
	Writeln("'Datei' Y2: " & DllStructGetData($tRect, "Bottom"))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
