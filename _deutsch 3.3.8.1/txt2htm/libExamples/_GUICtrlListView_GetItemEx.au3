#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $tItem, $hListView

	GUICreate("ListView: Ermittelt die Attribute eines Items", 400, 300)

	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState()

	GUICtrlCreateListViewItem("Item 1", $hListView)
	GUICtrlCreateListViewItem("Item 2", $hListView)
	GUICtrlCreateListViewItem("Item 3", $hListView)

	; Zeigt den Status von Item 2
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tItem, "Mask", $LVIF_STATE)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "StateMask", -1)
	_GUICtrlListView_GetItemEx($hListView, $tItem)
	MsgBox(4160, "Information", "Status von Item 2: " & DllStructGetData($tItem, "State"))

	; W&auml;hlt Item 2 aus
	_GUICtrlListView_SetItemSelected($hListView, 1)

	; Zeigt den Status von Item 2
	_GUICtrlListView_GetItemEx($hListView, $tItem)
	MsgBox(4160, "Information", "Status von Item 2: " & DllStructGetData($tItem, "State"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
