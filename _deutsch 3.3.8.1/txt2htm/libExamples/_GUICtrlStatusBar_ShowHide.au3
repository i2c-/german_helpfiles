#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die StatusBar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hGUI, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Zeigen/verstecken", 400, 300)

	;===============================================================================
	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	;===============================================================================
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState()

	MsgBox(4160, "Information", "Versteckt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	MsgBox(4160, "Information", "Zeigt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
