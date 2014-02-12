#include <WinAPIReg.au3>
#include <APIRegConstants.au3>

Local $Ext = '.au3'

ConsoleWrite('(' & $Ext & ')' & @CRLF)
ConsoleWrite('--------------------' & @CRLF)
ConsoleWrite('Typ: ' & _WinAPI_AssocQueryString($Ext, $ASSOCSTR_FRIENDLYDOCNAME) & @CRLF)
ConsoleWrite('Befehl: ' & _WinAPI_AssocQueryString($Ext, $ASSOCSTR_COMMAND) & @CRLF)
ConsoleWrite('Ausf&uuml;hrendes Programm: ' & _WinAPI_AssocQueryString($Ext, $ASSOCSTR_EXECUTABLE) & @CRLF)
ConsoleWrite('Icon: ' & _WinAPI_AssocQueryString($Ext, $ASSOCSTR_DEFAULTICON) & @CRLF)
