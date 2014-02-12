#include <WinAPIShPath.au3>

Local $Path1 = 'C:\Documents\Text'
Local $Path2 = '..\Test.txt'

ConsoleWrite('Pfad1   : ' & $Path1 & @CRLF)
ConsoleWrite('Pfad2   : ' & $Path2 & @CRLF)
ConsoleWrite('Ergebnis: ' & _WinAPI_PathAppend($Path1, $Path2) & @CRLF)
