Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Versteckt das Edit-Control im Editor durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	ControlHide($hWnd, "", "Edit1")

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Zeigt das Edit-Control im Editor durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	ControlShow($hWnd, "", "Edit1")

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
