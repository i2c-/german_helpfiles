#include <SecurityConstants.au3>
#include <Security.au3>

Local $tSID = _Security__StringSidToSid($SID_ADMINISTRATORS)
If Not @error Then
	; $tSID enth&auml;lt die SID Daten f&uuml;r den angegebenen String.
	; ... Restskript hier ...
EndIf
