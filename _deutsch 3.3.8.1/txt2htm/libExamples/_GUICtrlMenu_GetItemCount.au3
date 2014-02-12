#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain

	; Startet den Editor.
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")

	; Ermittelt das Handle des Hauptmen&uuml;s.
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt die Anzahl an Items im Hauptmen&uuml;.
	Writeln("Anzahl an Items im Hauptmen&uuml;:  " & _GUICtrlMenu_GetItemCount($hMain))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor.
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
