;;; SCRIPT.AU3 ;;;
#include "Library.au3"
#include "Library.au3"  ; Gibt einen Fehler zur&uuml;ck, falls #include-once nicht benutzt wurde

MsgBox(0, "Beispiel", "Dies ist von der 'script.au3' Datei")
myFunc()

; Das Starten der script.au3 wird 2 Nachrichtenfenster ausgeben:
; In einem steht: "Dies ist von der 'script.au3' Datei"
; In dem anderen steht "Hallo von library.au3"
