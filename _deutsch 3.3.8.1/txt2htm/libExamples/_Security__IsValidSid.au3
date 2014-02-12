#include <Security.au3>

Local $tSID = _Security__GetAccountSid(@ComputerName)
If Not @error Then
	; In der Struct $tSID stehen die SID Daten des gegebenen Accounts.
	; &Uuml;berpr&uuml;fen der SID:
	Local $fValid = _Security__IsValidSid($tSID)
	If $fValid Then
		ConsoleWrite("Die SID ist g&uuml;ltig." & @CRLF)
		; ... Der Rest des Skripts hier hinein ...
	Else
		ConsoleWrite("Die SID ist NICHT g&uuml;ltig!" & @CRLF)
		Exit
	EndIf
EndIf
