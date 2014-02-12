#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example1()

Func Example1()
	GUICreate("ListView: L&ouml;scht alle Items", 400, 500)
	Local $hListView = GUICtrlCreateListView("Spalte 1               |Spalte 2      |Spalte 3      ", 10, 10, 380, 480, $LVS_SHOWSELALWAYS)

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; 3 Spalten laden
	For $iI = 0 To 9
		GUICtrlCreateListViewItem("Item " & $iI & "|Item " & $iI & "-1|Item " & $iI & "-2", $hListView)
	Next

	For $i = 10 To 20
		_GUICtrlListView_AddItem($hListView, "UDF Item " & $i, -1, 1000 + $i)
		_GUICtrlListView_AddSubItem($hListView, $i, "Item " & $i & "-1", 1)
		_GUICtrlListView_AddSubItem($hListView, $i, "Item " & $i & "-2", 2)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;scht alle Items")

	; Verwendet die ControlID des erstellten ListViews
	_GUICtrlListView_DeleteAllItems($hListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; L&ouml;scht die obige GUI und alle Controls
	GUIDelete()
EndFunc   ;==>Example1
