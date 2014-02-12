#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $HandleBefore, $hDTP

	; Erstellt eine GUI
	$hGUI = GUICreate("DateTimePick: Zerst&ouml;ren (UDF)", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Zerst&ouml;rt das Handle des Controls: " & $hDTP)
	$HandleBefore = $hDTP
	MsgBox($MB_SYSTEMMODAL, "Information", "Control zerst&ouml;rt: " & _GUICtrlDTP_Destroy($hDTP) & @CRLF & _
			"Handle vor dem zerst&ouml;ren: " & $HandleBefore & @CRLF & _
			"Handle nach dem zerst&ouml;ren: " & $hDTP)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
