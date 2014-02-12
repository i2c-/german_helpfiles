#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $a_order, $hListView

	GUICreate("ListView: Reihenfolge der Spalten ermitteln", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, $LVS_EX_HEADERDRAGDROP)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 1, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 2, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 3, 100)
	GUISetState()

	_GUICtrlListView_SetColumnOrder($hListView, "3|2|0|1")

	$a_order = StringSplit(_GUICtrlListView_GetColumnOrder($hListView), "|")
	MsgBox(4160, "Information", StringFormat("Reihenfolge der Spalten: [%d, %d, %d, %d]", $a_order[1], $a_order[2], $a_order[3], $a_order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>_Main
