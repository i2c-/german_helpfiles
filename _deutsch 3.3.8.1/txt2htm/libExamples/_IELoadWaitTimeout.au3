; *******************************************************
; Beispiel 1 - Abfrage des momentanen Timeouts
; *******************************************************

#include <IE.au3>

Local $iCurrentTimeout = _IELoadWaitTimeout()

; *******************************************************
; Beispiel 2 - Setzen des Timeouts auf 1 Minute (60000 Millisekunden)
; *******************************************************

#include <IE.au3>

_IELoadWaitTimeout(60000)
