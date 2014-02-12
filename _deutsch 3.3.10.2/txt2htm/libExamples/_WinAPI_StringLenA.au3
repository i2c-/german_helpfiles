#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

; Erstellt den String-Buffer mit der Gr&ouml;&szlig;e 64 als char-Struct
Local $tStringBuffer = DllStructCreate("char Data[64]")
; Den Buffer mit Daten f&uuml;llen
DllStructSetData($tStringBuffer, "Data", "AutoIt")

MsgBox($MB_SYSTEMMODAL, "_WinAPI_StringLenA", "Die L&auml;nge des String-Buffers betr&auml;gt " & _WinAPI_StringLenA($tStringBuffer) & " Zeichen.")
