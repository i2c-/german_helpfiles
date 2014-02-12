#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Spalte einf&uuml;gen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalten einf&uuml;gen
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
