#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $HandleBefore, $hDTP

	; Erstellt eine GUI
	$hGUI = GUICreate("DateTimePick: Zerst&ouml;ren (UDF)", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState()

	MsgBox(4160, "Information", "Zerst&ouml;rt das Handle des Controls: " & $hDTP)
	$HandleBefore = $hDTP
	MsgBox(4160, "Information", "Control zerst&ouml;rt: " & _GUICtrlDTP_Destroy($hDTP) & @LF & _
			"Handle vor dem zerst&ouml;ren: " & $HandleBefore & @LF & _
			"Handle nach dem zerst&ouml;ren: " & $hDTP)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
