#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aInfo, $hListView

	GUICreate("ListView: Spalten ausrichten", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; Spalten &auml;ndern
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($hListView, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
