#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $a_font

$a_font = _ChooseFont()

Local $FontName = $a_font[2]
Local $FontSize = $a_font[3]
Local $ColorRef = $a_font[5]
Local $FontWeight = $a_font[4]
Local $Italic = BitAND($a_font[1], 2)
Local $Underline = BitAND($a_font[1], 4)
Local $Strikethru = BitAND($a_font[1], 8)
$a_font = _ChooseFont($FontName, $FontSize, $ColorRef, $FontWeight, $Italic, $Underline, $Strikethru)
If (@error) Then
	MsgBox($MB_SYSTEMMODAL, "", "_ChooseFont-Fehler: " & @error)
Else
	MsgBox($MB_SYSTEMMODAL, "", "Schriftname: " & $a_font[2] & @CRLF & "Gr&ouml;&szlig;e: " & $a_font[3] & @CRLF & "Gewicht: " & $a_font[4] & @CRLF & "COLORREF-rgb-Farben: " & $a_font[5] & @CRLF & "Hex BGR-Farbe: " & $a_font[6] & @CRLF & "Hex RGB-Farbe: " & $a_font[7])
EndIf
