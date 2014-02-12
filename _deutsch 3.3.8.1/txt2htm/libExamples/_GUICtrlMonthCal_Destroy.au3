#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $HandleBefore, $hMonthCal

	; Erstellt eine GUI
	$hGUI = GUICreate("MonthCal: l&ouml;schen", 400, 300)
	$hMonthCal = _GUICtrlMonthCal_Create($hGUI, 4, 4, $WS_BORDER)
	GUISetState()

	$HandleBefore = $hMonthCal
	MsgBox(4160, "Information", "L&ouml;scht das Control mit dem Handle: " & $hMonthCal)
	MsgBox(4160, "Information", "Control gel&ouml;scht: " & _GUICtrlMonthCal_Destroy($hMonthCal) & @LF & _
			"Handle vor dem l&ouml;schen: " & $HandleBefore & @LF & _
			"Handle nach dem l&ouml;schen: " & $hMonthCal)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
