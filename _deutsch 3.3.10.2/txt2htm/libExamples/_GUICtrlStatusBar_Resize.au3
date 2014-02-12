#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $hStatus

Example()

Func Example()

	Local $hGUI
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Gr&ouml;&szlig;en&auml;nderung", 400, 300, -1, -1, $WS_SIZEBOX)

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_SIZE, "WM_SIZE")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Bewirkt, dass sich die Statusbar bei Gr&ouml;&szlig;en&auml;nderung des Fensters mitanpasst
Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam, $ilParam
	_GUICtrlStatusBar_Resize($hStatus)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE
