#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt das Format", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))

	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
