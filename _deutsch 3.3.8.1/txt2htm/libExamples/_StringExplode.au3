#include <String.au3>
#include <Array.au3>

Local $text = "eins##zwei##drei##vier##f&uuml;nf##sechs##sieben##acht"
Local $array1 = _StringExplode($text, "##", 0)
_ArrayDisplay($array1, "StringExplode 0")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf
;[5] = sechs
;[6] = sieben
;[7] = acht

Local $array2 = _StringExplode($text, "##", 4)
_ArrayDisplay($array2, "StringExplode 4")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf##sechs##sieben##acht

Local $array3 = _StringExplode($text, "##", -3)
_ArrayDisplay($array3, "StringExplode -3")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = f&uuml;nf
