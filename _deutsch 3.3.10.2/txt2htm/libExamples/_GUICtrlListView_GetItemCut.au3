#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt, ob das Item dargestellt wird, als w&auml;re es in einer Ausschneide Operation", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1", 2)

	; Item 2 ausschneiden
	_GUICtrlListView_SetItemCut($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 ausschneiden: " & _GUICtrlListView_GetItemCut($hListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
