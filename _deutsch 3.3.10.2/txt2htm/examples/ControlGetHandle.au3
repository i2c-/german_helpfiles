#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt das Handle des Edit-Controls im Editor. Dabei wird f&uuml;r den "title" Parameter von ControlGetHandle das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	Local $hControl = ControlGetHandle($hWnd, "", "Edit1")

	; Zeigt das Handle des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "The handle of Edit1 is: " & $hControl)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
