; *******************************************************
; Beispiel 1 - Registriert eine eigene Fehlerbehandlungsroutine und l&ouml;scht diese sp&auml;ter
;
; *******************************************************

#include <IE.au3>

; Registriert die eigene Fehlerbehandlungsroutine
_IEErrorHandlerRegister("MeineFehlerroutine")
; Programm-Code
; L&ouml;scht die eigene Fehlerbehandlungsroutine wieder
_IEErrorHandlerDeRegister()
; Programm-Code

Exit

Func MeineFehlerroutine()
	Local $HexNumber = Hex($oIEErrorHandler.number, 8)
	MsgBox(0, "", "Wir haben einen COM Error festgestellt!" & @CRLF & _
			"Error-Nummer: " & $HexNumber & @CRLF & _
			"Win-Beschreibung: " & $oIEErrorHandler.windescription)
	SetError(1) ; Etwas zum Nachpr&uuml;fen wenn diese Funktion abgerufen wird
EndFunc   ;==>MeineFehlerroutine
