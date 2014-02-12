#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hGUI, $HandleBefore, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: L&ouml;schen", 400, 300)

	;===============================================================================
	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	;===============================================================================
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState(@SW_SHOW)

	$HandleBefore = $hStatus
	MsgBox($MB_SYSTEMMODAL, "Information", "Das Control des folgenden Handles wird gel&ouml;scht: " & $hStatus)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control gel&ouml;scht: " & _GUICtrlStatusBar_Destroy($hStatus) & @CRLF & _
			"Handle vor dem l&ouml;schen: " & $HandleBefore & @CRLF & _
			"Handle nach dem l&ouml;schen: " & $hStatus)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
