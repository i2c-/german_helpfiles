Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; L&auml;sst das Fenster 4 Mal mit einer Pause von jeweils einer halben Sekunde blinken
	WinFlash($hWnd, "", 4, 500)
EndFunc   ;==>Example
