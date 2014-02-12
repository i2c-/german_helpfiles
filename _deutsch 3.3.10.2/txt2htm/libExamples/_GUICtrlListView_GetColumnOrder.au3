#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $a_order, $hListView

	GUICreate("ListView: Reihenfolge der Spalten ermitteln", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, $LVS_EX_HEADERDRAGDROP)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 1, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 2, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 3, 100)
	GUISetState(@SW_SHOW)

	_GUICtrlListView_SetColumnOrder($hListView, "3|2|0|1")

	$a_order = StringSplit(_GUICtrlListView_GetColumnOrder($hListView), "|")
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Reihenfolge der Spalten: [%d, %d, %d, %d]", $a_order[1], $a_order[2], $a_order[3], $a_order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
