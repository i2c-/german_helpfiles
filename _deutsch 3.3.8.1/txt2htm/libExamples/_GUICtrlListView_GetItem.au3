#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aItem, $hListView

	GUICreate("ListView: Item ermitteln", 400, 300)

	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState()

	GUICtrlCreateListViewItem("Zeile 1", $hListView)
	GUICtrlCreateListViewItem("Zeile 2", $hListView)
	GUICtrlCreateListViewItem("Zeile 3", $hListView)

	; Setzt den Text von dem Item 2
	$aItem = _GUICtrlListView_GetItem($hListView, 1)
	MsgBox(4160, "Information", "Item 2 Text: " & $aItem[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>_Main
