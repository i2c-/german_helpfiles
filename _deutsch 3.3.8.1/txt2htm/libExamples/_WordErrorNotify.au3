; *******************************************************
; Beispiel 1 - Pr&uuml;ft den aktuellen Status von _WordErrorNotify, schaltet ihn aus wenn er an ist und umgekehrt
; *******************************************************
;
#include <Word.au3>

; _WordErrorNotify(0) ;  Die Auskommentierung entfernen, um die zweite Meldung anzuzeigen.

If _WordErrorNotify() Then
	MsgBox(0, "_WordErrorNotify Status", "Benachrichtigung ist AN. Nun wird sie AUSGESCHALTET.")
	_WordErrorNotify(1)
Else
	MsgBox(0, "_WordErrorNotify Status", "Benachrichtigung ist AUS. Nun wird sie ANGESCHALTET.")
	_WordErrorNotify(0)
EndIf
