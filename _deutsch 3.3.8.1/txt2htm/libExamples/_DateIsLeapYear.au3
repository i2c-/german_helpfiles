#include <Date.au3>

If _DateIsLeapYear(@YEAR) Then
	MsgBox(4096, "Schaltjahr", "Das Jahr ist ein Schaltjahr.")
Else
	MsgBox(4096, "Schaltjahr", "Das Jahr ist kein Schaltjahr.")
EndIf
