#include <String.au3>

Local $String = "Ich mag AutoIt3"
Local $Hex = _StringToHex($String)
MsgBox(0, "Hex", "Originaler String: " & $String & @LF & " Hex: " & $Hex)

$Hex = "49206C696B65204175746F497433"
$String = _HexToString($Hex)
MsgBox(0, "Hex", "Originaler Hex: " & $Hex & @LF & " String: " & $String)
