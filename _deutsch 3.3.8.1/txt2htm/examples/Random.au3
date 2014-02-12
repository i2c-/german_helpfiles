; M&uuml;nze werfen
Local $Msg
If Random() < 0.5 Then ; Liefert einen Wert zwischen 0 und 1
	$Msg = "Kopf. 50% Gewinn"
Else
	$Msg = "Zahl. 50% Verlust"
EndIf
MsgBox(0, "M&uuml;nze werfen:", $Msg)


; W&uuml;rfeln
MsgBox(0, "W&uuml;rfeln", "Sie w&uuml;rfelten eine " & Random(1, 6, 1))

; Simulationsspiel eines Aktienmarktes
Local $AktienPreis = 98
Local $AktienPreisAenderung = Random(-10, 10, 1) ; Erstellt eine Ganzzahl zwischen -10 und 10
$AktienPreis = $AktienPreis + $AktienPreisAenderung
If $AktienPreisAenderung < 0 Then
	MsgBox(4096, "Aktien &Auml;nderung", "Ihre Aktie fiel auf " & $AktienPreis & "€")
ElseIf $AktienPreisAenderung > 0 Then
	MsgBox(4096, "Aktien &Auml;nderung", "Ihre Aktie stieg auf " & $AktienPreis & "€")
Else
	MsgBox(4096, "Aktien &Auml;nderung", "Ihre Aktie blieb bei " & $AktienPreis & "€")
EndIf


; Zuf&auml;lliger Buchstabe
Local $Letter
If Random() < 0.5 Then
	; Gro&szlig;e Buchstaben
	$Buchstabe = Chr(Random(Asc("A"), Asc("Z"), 1))
Else
	; Kleine Buchstaben
	$Buchstabe = Chr(Random(Asc("a"), Asc("z"), 1))
EndIf
