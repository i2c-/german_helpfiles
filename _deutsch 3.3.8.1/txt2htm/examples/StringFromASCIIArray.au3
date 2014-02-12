#include <Array.au3>	; F&uuml;r _ArrayDisplay()

; Konvertiert den String in ein Array.
Local $a = StringToASCIIArray("abc")

; Das Array anzeigen, um zu verdeutlichen, dass es
; Die ASCII-Werte jedes Zeichens enth&auml;lt.
_ArrayDisplay($a)

; Jetzt das Array in einen String umwandeln.
Local $s = StringFromASCIIArray($a)

; Anzeige des Strings, um die &Uuml;bereinstimmung mit der Originaleingabe zu belegen.
MsgBox(0, "", $s)
