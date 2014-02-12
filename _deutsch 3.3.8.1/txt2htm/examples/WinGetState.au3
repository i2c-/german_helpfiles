; Pr&uuml;ft ob ein neues Editor-Fenster minimiert ist
Local $state = WinGetState("[CLASS:Notepad]", "")

; Wurde der Werte f&uuml;r minimieren gesetzt?
If BitAND($state, 16) Then
	MsgBox(0, "Beispiel", "Fenster ist minimiert")
EndIf
