#include <WinAPIShPath.au3>
#include <APIREgConstants.au3>
#include <WinAPIReg.au3>

Local $Path = _WinAPI_AssocQueryString('.txt', $ASSOCSTR_COMMAND)

ConsoleWrite('Befehl: ' & $Path & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathUnquoteSpaces(_WinAPI_PathRemoveArgs($Path)) & @CRLF)
ConsoleWrite('Argumente: ' & _WinAPI_PathGetArgs($Path) & @CRLF)
