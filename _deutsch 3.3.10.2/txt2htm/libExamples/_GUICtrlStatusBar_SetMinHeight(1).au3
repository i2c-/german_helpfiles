#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>

Example()

Func Example()

	Local $hGUI, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Setzt die minimale H&ouml;he", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Setzt die minimale H&ouml;he
	_GUICtrlStatusBar_SetMinHeight($hStatus, 30)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
