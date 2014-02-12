#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aInfo, $hListView

	GUICreate("ListView: Spalten ausrichten", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; Spalten &auml;ndern
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($hListView, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
