#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Zeigt eine Liste der Editorprozesse an die durch ProcessList zur&uuml;ckgegeben wurde.
	Local $aProcessList = ProcessList("notepad.exe")
	For $i = 1 To $aProcessList[0][0]
		MsgBox($MB_SYSTEMMODAL, "", $aProcessList[$i][0] & @CRLF & "PID: " & $aProcessList[$i][1])
	Next

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
