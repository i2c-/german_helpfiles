#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

; Mit diesem Skript wird das verkn&uuml;pfte Programm ermittelt
MsgBox($MB_SYSTEMMODAL, "_WinAPI_FindExecutable", "Datei: " & @ScriptName & @CRLF & "Verkn&uuml;pftes Programm: " & _WinAPI_FindExecutable(@ScriptName))
