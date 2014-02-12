#include <Misc.au3>

Local $a_font

; Beispiel 1
$a_font = _ChooseFont("Arial", 8)
If (@error) Then
	MsgBox(0, "", "_ChooseFont-Fehler: " & @error)
Else
	MsgBox(0, "", "Schriftname: " & $a_font[2] & @LF & "Gr&ouml;&szlig;e: " & $a_font[3] & @LF & "Gewicht: " & $a_font[4] & @LF & "COLORREF-rgb-Farben: " & $a_font[5] & @LF & "Hex BGR-Farbe: " & $a_font[6] & @LF & "Hex RGB-Farbe: " & $a_font[7])
EndIf

; Beispiel 2
$a_font = _ChooseFont()
If (@error) Then
	MsgBox(0, "", "_ChooseFont-Fehler: " & @error)
	Exit
Else
	MsgBox(0, "", "Schriftname: " & $a_font[2] & @LF & "Gr&ouml;&szlig;e: " & $a_font[3] & @LF & "Gewicht: " & $a_font[4] & @LF & "COLORREF-rgb-Farben: " & $a_font[5] & @LF & "Hex BGR-Farbe: " & $a_font[6] & @LF & "Hex RGB-Farbe: " & $a_font[7])
EndIf

; Beispiel 3
Local $FontName = $a_font[2]
Local $FontSize = $a_font[3]
Local $ColorRef = $a_font[5]
Local $FontWeight = $a_font[4]
Local $Italic = BitAND($a_font[1], 2)
Local $Underline = BitAND($a_font[1], 4)
Local $Strikethru = BitAND($a_font[1], 8)
$a_font = _ChooseFont($FontName, $FontSize, $ColorRef, $FontWeight, $Italic, $Underline, $Strikethru)
If (@error) Then
	MsgBox(0, "", "_ChooseFont-Fehler: " & @error)
Else
	MsgBox(0, "", "Schriftname: " & $a_font[2] & @LF & "Gr&ouml;&szlig;e: " & $a_font[3] & @LF & "Gewicht: " & $a_font[4] & @LF & "COLORREF-rgb-Farben: " & $a_font[5] & @LF & "Hex BGR-Farbe: " & $a_font[6] & @LF & "Hex RGB-Farbe: " & $a_font[7])
EndIf
