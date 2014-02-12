#include <Color.au3>

Local $aColor[3] = [0x80, 0x90, 0xff]

Local $nColor = _ColorSetRGB($aColor)
MsgBox(4096, "AutoIt", " Rot=" & Hex($aColor[0], 2) & " Blau=" & Hex($aColor[1], 2) & " Gr&uuml;n=" & Hex($aColor[2], 2) & @CRLF & _
		"Farbe=" & Hex($nColor))
