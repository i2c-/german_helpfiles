#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $HandleBefore, $hMonthCal

	; Erstellt eine GUI
	$hGUI = GUICreate("MonthCal: l&ouml;schen", 400, 300)
	$hMonthCal = _GUICtrlMonthCal_Create($hGUI, 4, 4, $WS_BORDER)
	GUISetState(@SW_SHOW)

	$HandleBefore = $hMonthCal
	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;scht das Control mit dem Handle: " & $hMonthCal)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control gel&ouml;scht: " & _GUICtrlMonthCal_Destroy($hMonthCal) & @CRLF & _
			"Handle vor dem l&ouml;schen: " & $HandleBefore & @CRLF & _
			"Handle nach dem l&ouml;schen: " & $hMonthCal)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
