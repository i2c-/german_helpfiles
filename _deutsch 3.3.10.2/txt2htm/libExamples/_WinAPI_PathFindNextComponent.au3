#include <WinAPIShPath.au3>

Local $Path = @ScriptFullPath

While $Path
	ConsoleWrite($Path & @CRLF)
	$Path = _WinAPI_PathFindNextComponent($Path)
WEnd
$Path = _WinAPI_PathFindNextComponent("")
ConsoleWrite('Pfad = "' & $Path & '" -> @error = ' & @error & @CRLF)
