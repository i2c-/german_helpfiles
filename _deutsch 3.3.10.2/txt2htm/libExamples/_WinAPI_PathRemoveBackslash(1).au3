#include <WinAPIShPath.au3>

Local $Path = 'C:\Documents\'

ConsoleWrite('Vorher : ' & $Path & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathRemoveBackslash($Path) & @CRLF)
