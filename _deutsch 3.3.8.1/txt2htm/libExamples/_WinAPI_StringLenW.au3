#include <WinAPI.au3>

; Erstellt den String-Buffer mit der Gr&ouml;&szlig;e 64 als wchar-Struct
Local $tStringBuffer = DllStructCreate("wchar Data[64]")
; Den Buffer mit Daten f&uuml;llen
DllStructSetData($tStringBuffer, "Data", "Gongoozle")

MsgBox(262144, "_WinAPI_StringLenW", "Die L&auml;nge des String-Buffers betr&auml;gt " & _WinAPI_StringLenW($tStringBuffer) & " Zeichen.")
