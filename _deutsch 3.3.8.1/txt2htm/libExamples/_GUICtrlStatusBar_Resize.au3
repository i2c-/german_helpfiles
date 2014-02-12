#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die StatusBar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hStatus

_Main()

Func _Main()

	Local $hGUI
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Gr&ouml;&szlig;en&auml;nderung", 400, 300, -1, -1, $WS_SIZEBOX)

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	GUISetState()

	GUIRegisterMsg($WM_SIZE, "WM_SIZE")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Bewirkt, dass sich die Statusbar bei Gr&ouml;&szlig;en&auml;nderung des Fensters mitanpasst
Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam, $ilParam
	_GUICtrlStatusBar_Resize($hStatus)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE
