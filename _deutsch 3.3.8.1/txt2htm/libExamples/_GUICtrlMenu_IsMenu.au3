#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Pr&uuml;ft den R&uuml;ckgabewert
	Writeln("Ist es ein Men&uuml;: " & _GUICtrlMenu_IsMenu($hWnd))
	Writeln("Ist es ein Men&uuml;: " & _GUICtrlMenu_IsMenu($hMain))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
