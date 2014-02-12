#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt das Control mit dem Tastaturfokus im Editor. Dabei wird f&uuml;r den "title" Parameter von ControlGetFocus das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	Local $sControl = ControlGetFocus($hWnd)

	; Zeigt das Control welches den Tastaturfokus besitzt.
	MsgBox($MB_SYSTEMMODAL, "", "Das Control welches den Tastaturfokus im Editor besitzt lautet: " & $sControl)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
