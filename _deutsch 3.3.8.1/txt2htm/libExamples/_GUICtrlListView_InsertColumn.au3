#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView: Spalte einf&uuml;gen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; Spalten einf&uuml;gen
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
