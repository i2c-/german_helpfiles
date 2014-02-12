; *******************************************************
; Beispiel 1 - Pr&uuml;ft den aktuellen Status von _IEErrorNotify und schaltet ihn um.
; *******************************************************

#include <IE.au3>

If _IEErrorNotify() Then
	MsgBox(0, "_IEErrorNotify Status", "Notification is ON, turning it OFF")
	_IEErrorNotify(False)
Else
	MsgBox(0, "_IEErrorNotify Status", "Notification is OFF, turning it ON")
	_IEErrorNotify(True)
EndIf
