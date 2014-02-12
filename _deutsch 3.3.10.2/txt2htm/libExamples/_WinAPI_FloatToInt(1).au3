#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $float, $text, $INT
	$float = 10.55
	$INT = _WinAPI_FloatToInt($float)
	$text = "Die Gleitkommazahl " & $float & " ergibt konvertiert in einen Integerwert: " & $INT & " (Hex = " & Hex($INT) & ")"
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_FloatToInt Beispielergebnisse", $text)
EndFunc   ;==>Example
