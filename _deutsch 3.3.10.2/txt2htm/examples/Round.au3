#include <MsgBoxConstants.au3>

Local $x = Round(-1.582, 1) ; Gibt -1.6 zur&uuml;ck
Local $y = Round(3.1415, 9) ; Keine Ver&auml;nderung
Local $z = Round(123.5, -1) ; Gibt 120 zur&uuml;ck

MsgBox($MB_SYSTEMMODAL, "", "Die folgenden Werte sind gerundet: " & @CRLF & _
		$iRound1 & @CRLF & $iRound2 & @CRLF & $iRound3)
