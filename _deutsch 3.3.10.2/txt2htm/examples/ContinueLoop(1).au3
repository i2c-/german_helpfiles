#include <MsgBoxConstants.au3>

; Zeigt alle Zahlen von 1 bis 10 au&szlig;er der Zahl 7
For $i = 1 To 10
	If $i = 7 Then
		ContinueLoop ; Verhindet, dass das Nachrichtenfesnter erscheint, wenn $i gleich 7 ist.
	EndIf
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert von $i ist: " & $i)
Next
