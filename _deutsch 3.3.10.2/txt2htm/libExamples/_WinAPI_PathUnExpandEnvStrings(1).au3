#include <WinAPIShPath.au3>

Local $Path = @SystemDir

ConsoleWrite('Vorher : ' & $Path & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathUnExpandEnvStrings($Path) & @CRLF)
