#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $cursor, $text
	$cursor = _WinAPI_GetCursorInfo()
	$text = "War der Vorgang erfolgreich? " & $cursor[0] & @CRLF
	$text &= "Wird der Cursor angezeigt? " & $cursor[1] & @CRLF & @CRLF
	$text &= "Cursor Handle: " & $cursor[2] & @CRLF
	$text &= "X-Koordinate: " & $cursor[3] & @CRLF
	$text &= "Y-Koordinate: " & $cursor[4]
	MsgBox($MB_SYSTEMMODAL, "_WinApi_GetCursorInfo Demo", $text)
EndFunc   ;==>Example
