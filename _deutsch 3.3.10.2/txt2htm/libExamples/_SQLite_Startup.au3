#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <Constants.au3>

; die SQLite.dll Version mu&szlig; passen

Local $sSQliteDll
$sSQliteDll = _SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite.dll konnte nicht geladen werden!" & @CRLF & @CRLF & _
	"Nicht gefunden in @SystemDir, @WindowsDir, @ScriptDir, @WorkingDir oder auf www.autoitscript.com")
	Exit -1
EndIf
MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
