#include <MsgBoxConstants.au3>

; Ersetzt ein Leerzeichen (' ') mit einem - (minus).
Local $sString = StringReplace("Dies ist ein Satz mit Leerzeichen.", " ", "-")
Local $iReplacements = @extended
MsgBox($MB_SYSTEMMODAL, "", $iReplacements & " Ersetzungen wurden durchgef&uuml;hrt und der neue String lautet:" & @CRLF & @CRLF & $sString)
