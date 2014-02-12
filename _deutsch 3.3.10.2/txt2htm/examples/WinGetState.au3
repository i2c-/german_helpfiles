#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt den Status des Editorfensters durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	Local $iState = WinGetState($hWnd)

	; Pr&uuml;ft, ob das Editorfenster minimert und zeigt das Ergebnis in einem Nachrichtenfenster an.
	If BitAND($iState, 16) Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Editor ist minimiert und der von WinGetState zur&uuml;ckgegebene Status lautet - " & $iState)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Editor ist nicht minimiert und der von WinGetState zur&uuml;ckgegebene Status lautet - " & $iState)
	EndIf

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
