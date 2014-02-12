#include <Date.au3>

Local $sDate = @YEAR & "/" & @MON & "/" & @MDAY

If _DateIsValid($sDate) Then
	MsgBox(4096, "G&uuml;ltiges Datum", "Das angegebene Datum ist g&uuml;ltig.")
Else
	MsgBox(4096, "G&uuml;ltiges Datum", "Das angegebene Datum ist ung&uuml;ltig.")
EndIf
