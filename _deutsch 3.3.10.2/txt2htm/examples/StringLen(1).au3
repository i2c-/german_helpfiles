#include <MsgBoxConstants.au3>

; Ermittelt die L&auml;nge des Strings.
; Wenn der String nur ASCII Zeichen verwendet, dann ist die L&auml;nge gleich der Gr&ouml;&szlig;e in Bytes. So sind z. B. 10 Zeichen 10 Bytes.
Local $iLength = StringLen("Dies ist ein Satz mit Leerzeichen.")
MsgBox($MB_SYSTEMMODAL, "", "Die L&auml;nge des Strings sind " & $iLength & " Zeichen.")
