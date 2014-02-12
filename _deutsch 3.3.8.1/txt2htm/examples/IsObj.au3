Local $oShell = ObjCreate("shell.application")
If Not IsObj($oShell) Then
	MsgBox(0, "FEHLER", "$oShell ist kein Objekt.")
Else
	MsgBox(0, "ERFOLG", "Objekt $oShell erfolgreich erstellt.")
EndIf
