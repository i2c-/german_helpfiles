#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hGUI, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Zeigen/verstecken", 400, 300)

	;===============================================================================
	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	;===============================================================================
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Versteckt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	MsgBox($MB_SYSTEMMODAL, "Information", "Zeigt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
