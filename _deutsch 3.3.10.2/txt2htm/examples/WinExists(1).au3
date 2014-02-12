#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis der Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Pr&uuml;ft, ob das Editorfenster existiert und zeigt das Ergebnis.
	If WinExists("[CLASS:Notepad]") Then
		MsgBox($MB_SYSTEMMODAL, "", "Das Fenster existiert.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Das Fenster existiert nicht.")
	EndIf
EndFunc   ;==>Example
