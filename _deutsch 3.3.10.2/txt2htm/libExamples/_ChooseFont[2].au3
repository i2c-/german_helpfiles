#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $a_font

$a_font = _ChooseFont()
If (@error) Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "_ChooseFont-Fehler: " & @error)
	Exit
Else
	MsgBox($MB_SYSTEMMODAL, "", "Schriftname: " & $a_font[2] & @CRLF & "Gr&ouml;&szlig;e: " & $a_font[3] & @CRLF & "Gewicht: " & $a_font[4] & @CRLF & "COLORREF-rgb-Farben: " & $a_font[5] & @CRLF & "Hex BGR-Farbe: " & $a_font[6] & @CRLF & "Hex RGB-Farbe: " & $a_font[7])
EndIf

