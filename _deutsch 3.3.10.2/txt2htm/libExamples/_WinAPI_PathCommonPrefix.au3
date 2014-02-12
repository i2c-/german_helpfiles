#include <WinAPIShPath.au3>

Local $Path1 = 'C:\Documents\Test.txt'
Local $Path2 = 'C:\Documents\Archive\Sample.txt'

ConsoleWrite('Pfad1 : ' & $Path1 & @CRLF)
ConsoleWrite('Pfad2 : ' & $Path2 & @CRLF)
ConsoleWrite('Pr&auml;fix: ' & _WinAPI_PathCommonPrefix($Path1, $Path2) & @CRLF)
