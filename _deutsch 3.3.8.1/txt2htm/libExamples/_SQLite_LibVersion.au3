#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $sSQliteDll
$sSQliteDll = _SQLite_Startup()
If @error Then
	MsgBox(16, "SQLite Fehler", "SQLite.dll konnte nicht geladen werden!")
	Exit -1
EndIf
MsgBox(0, "SQLite3.dll geladen", $sSQliteDll)
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
