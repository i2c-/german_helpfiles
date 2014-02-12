#include <String.au3>
#include <Array.au3>

Local $text = "eins##zwei##drei##vier##f&uuml;nf##sechs##sieben##acht"
Local $aArray1 = _StringExplode($text, "##", 0)
_ArrayDisplay($aArray1, "StringExplode 0")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf
;[5] = sechs
;[6] = sieben
;[7] = acht

Local $aArray2 = _StringExplode($text, "##", 4)
_ArrayDisplay($aArray2, "StringExplode 4")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf##sechs##sieben##acht

Local $aArray3 = _StringExplode($text, "##", -3)
_ArrayDisplay($aArray3, "StringExplode -3")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf
