#include <WinAPIShPath.au3>

Local $Path = 'C:\Documents\Test.txt'

ConsoleWrite('Vorher : ' & $Path & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathRenameExtension($Path, '.doc') & @CRLF)
