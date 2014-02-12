#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $aRect

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt das begrenzende Rechteck f&uuml;r 'Datei'
	$aRect = _GUICtrlMenu_GetItemRect($hWnd, $hMain, 0)

	Writeln("'Datei' X1: " & $aRect[0])
	Writeln("'Datei' Y1: " & $aRect[1])
	Writeln("'Datei' X2: " & $aRect[2])
	Writeln("'Datei' Y2: " & $aRect[3])

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
