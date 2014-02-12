#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt das Handle das Editorfensters durch die Verwendung des Klassennamens (classname) vom Editor.
	Local $hWnd = WinGetHandle("[CLASS:Notepad]")
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Es trat ein Fehler auf als versucht wurde das Fensterhandle des Editors zu ermitteln.")
		Exit
	EndIf

	; Zeigt das Handle des Editorfensters.
	MsgBox($MB_SYSTEMMODAL, "", $hWnd)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinGetHandle zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
