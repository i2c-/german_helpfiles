#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Schreibt in das Edit-Control des Editors Text. Dabei wird f&uuml;r den "title" Parameter von ControlSetText das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	ControlSetText($hWnd, "", "Edit1", "This is some text")

	; Ermittelt den Text im Edit-Control des Editors. Dabei wird f&uuml;r den "title" Parameter von ControlGetText das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	Local $sText = ControlGetText($hWnd, "", "Edit1")

	; Zeigt den Text des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "Der Test in Edit1 lautet: " & $sText)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
