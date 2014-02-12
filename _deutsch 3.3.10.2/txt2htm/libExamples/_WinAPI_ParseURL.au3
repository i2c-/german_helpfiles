#include <WinAPIShPath.au3>

Local $Data = _WinAPI_ParseURL('http://www.microsoft.com')

ConsoleWrite('Protokoll: ' & $Data[0] & @CRLF)
ConsoleWrite('Suffix:   ' & $Data[1] & @CRLF)
ConsoleWrite('Schema:   ' & $Data[2] & @CRLF)
