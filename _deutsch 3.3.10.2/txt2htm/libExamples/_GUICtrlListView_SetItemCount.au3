#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Anzahl Items setzen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_SetItemCount($hListView, 100)
	_GUICtrlListView_BeginUpdate($hListView)
	For $x = 1 To 100
		GUICtrlCreateListViewItem("Item " & $x, $hListView)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
