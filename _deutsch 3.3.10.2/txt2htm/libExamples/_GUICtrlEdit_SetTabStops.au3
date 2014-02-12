#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $StatusBar, $hEdit, $hGUI
	Local $aPartRightSide[3] = [190, 378, -1], $aTabStops[3] = [10, 30, 50]

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Setzt Tabstops", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die R&auml;nder
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, @TAB & "1." & @TAB & "2." & @TAB & "3.")

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt Tabstops")

	; Setzt Tabstops
	_GUICtrlEdit_SetTabStops($hEdit, $aTabStops)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
