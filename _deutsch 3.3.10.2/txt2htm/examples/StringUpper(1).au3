#include <MsgBoxConstants.au3>

Local $sString = StringUpper("Dies ist ein String") ; Wandelt den folgenden String in Gro&szlig;buchstaben.
MsgBox($MB_SYSTEMMODAL, "", "StringUpper gibt folgendes zur&uuml;ck: " & $sString)
