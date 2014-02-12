#include <WinAPI.au3>

_Main()

Func _Main()
	Local $cursor, $text
	$cursor = _WinAPI_GetCursorInfo()
	$text = "War der Vorgang erfolgreich? " & $cursor[0] & @LF
	$text &= "Wird der Cursor angezeigt? " & $cursor[1] & @LF & @LF
	$text &= "Cursor Handle: " & $cursor[2] & @LF
	$text &= "X-Koordinate: " & $cursor[3] & @LF
	$text &= "Y-Koordinate: " & $cursor[4]
	MsgBox(0, "_WinApi_GetCursorInfo Demo", $text)
EndFunc   ;==>_Main
