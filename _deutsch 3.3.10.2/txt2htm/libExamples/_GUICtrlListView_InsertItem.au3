#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Item einf&uuml;gen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte einf&uuml;gen
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_InsertItem($hListView, "Item 1", 0)
	_GUICtrlListView_InsertItem($hListView, "Item 2", 1)
	_GUICtrlListView_InsertItem($hListView, "Item 3", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
