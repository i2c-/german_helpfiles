#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $sDate = @YEAR & "/" & @MON & "/" & @MDAY

If _DateIsValid($sDate) Then
	MsgBox($MB_SYSTEMMODAL, "G&uuml;ltiges Datum", "Das angegebene Datum ist g&uuml;ltig.")
Else
	MsgBox($MB_SYSTEMMODAL, "G&uuml;ltiges Datum", "Das angegebene Datum ist ung&uuml;ltig.")
EndIf
