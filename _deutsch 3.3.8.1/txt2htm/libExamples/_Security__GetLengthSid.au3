#include <Security.au3>

Local $tSID = _Security__GetAccountSid(@UserName)
If Not @error Then
	; In der Struct $tSID stehen die SID Daten des gegebenen Accounts.
	; L&auml;nge der SID pr&uuml;fen:
	Local $iLength = _Security__GetLengthSid($tSID)
	ConsoleWrite("Die L&auml;nge der SID betr&auml;gt: " & $iLength & " bytes" & @CRLF)

	; ... Der Rest des Skripts hier hinein ...
EndIf
