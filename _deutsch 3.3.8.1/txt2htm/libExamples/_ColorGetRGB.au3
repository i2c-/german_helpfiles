#include <Color.au3>

Local $nColor = 0x8090ff

Local $aColor = _ColorGetRGB($nColor)
MsgBox(4096, "AutoIt", "Farbe=" & Hex($nColor) & @CRLF & " Rot=" & Hex($aColor[0], 2) & " Blau=" & Hex($aColor[1], 2) & " Gr&uuml;n=" & Hex($aColor[2], 2))
