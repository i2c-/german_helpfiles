Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Testet, ob das Fenster gefunden wurde und zeigt die Ergebnisse.
	If IsHWnd($hWnd) Then
		MsgBox(4096, "", "Ist ein g&uuml;ltiger HWND")
	Else
		MsgBox(4096, "", "Ist kein g&uuml;ltiger HWND")
	EndIf
EndFunc   ;==>Example
