#include <WinAPIShPath.au3>

Local $Path = @ScriptFullPath

ConsoleWrite('Vorher : ' & $Path & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathCompactPathEx($Path, 40) & @CRLF)
