#include <WinAPIShPath.au3>
#include <WinAPIReg.au3>
#include <APIRegConstants.au3>

Local $Path = _WinAPI_AssocQueryString('.txt', $ASSOCSTR_COMMAND)

ConsoleWrite('Befehl: ' & $Path & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathRemoveArgs($Path) & @CRLF)
ConsoleWrite('Argumente: ' & _WinAPI_PathGetArgs($Path) & @CRLF)
