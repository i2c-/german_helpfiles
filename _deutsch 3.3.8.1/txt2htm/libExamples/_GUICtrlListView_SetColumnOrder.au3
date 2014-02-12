#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $a_order, $hListView

	GUICreate("ListView: Setzt die Spaltenreihenfolge", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	GUISetState()

	; Setzt die Spaltenreihenfolge
	MsgBox(4160, "Information", "&Auml;ndert die Spaltenreihenfolge")
	_GUICtrlListView_SetColumnOrder($hListView, "3|2|0|1")

	; Zeigt die Spaltenreihenfolge
	$a_order = _GUICtrlListView_GetColumnOrderArray($hListView)
	MsgBox(4160, "Information", StringFormat("Spaltenreihenfolge: [%d, %d, %d, %d]", $a_order[1], $a_order[2], $a_order[3], $a_order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>_Main
