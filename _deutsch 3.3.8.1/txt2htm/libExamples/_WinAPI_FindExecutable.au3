#include <WinAPI.au3>
MsgBox(4096, "_WinAPI_FindExecutable", "Datei: " & @ScriptName & @LF & "Verkn&uuml;pftes Programm: " & _WinAPI_FindExecutable(@ScriptName))
