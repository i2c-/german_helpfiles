#include <String.au3>
#include <MsgBoxConstants.au3>

Local $sString = "Dies ist ein Beispielstring"
Local $sHex = _StringToHex($sString) ;Wandelt den String in einen hexadezimalen String
MsgBox($MB_SYSTEMMODAL, "Hex", "Originaler String: " & $sString & @CRLF & " Hex: " & $sHex)

$sString = _HexToString($sHex) ;Wandelt den hexadezimalen String wieder zur&uuml;ck in den originalen String
MsgBox($MB_SYSTEMMODAL, "Hex", "Originaler Hex: " & $sHex & @CRLF & " String: " & $sString)
