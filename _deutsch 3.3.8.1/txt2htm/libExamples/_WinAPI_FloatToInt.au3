#include <WinAPI.au3>

_Main()

Func _Main()
	Local $float, $text, $INT
	$float = 10.55
	$INT = _WinAPI_FloatToInt($float)
	$text = "Die Gleitkommazahl " & $float & " ergibt konvertiert in einen Integerwert: " & $INT & " (Hex = " & Hex($INT) & ")"
	MsgBox(0, "_WinAPI_FloatToInt Beispielergebnisse", $text)
EndFunc   ;==>_Main
