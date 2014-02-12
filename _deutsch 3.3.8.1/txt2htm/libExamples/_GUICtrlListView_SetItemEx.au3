#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $tText, $tItem, $hListView

	GUICreate("ListView: Setzt die Attribute eines Items", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	GUICtrlCreateListViewItem("Item 1", $hListView)
	GUICtrlCreateListViewItem("Item 2", $hListView)
	GUICtrlCreateListViewItem("Item 3", $hListView)

	; &Auml;ndert Item 2
	MsgBox(4160, "Information", "&Auml;ndert Item 2")
	$tText = DllStructCreate("wchar Text[13]")
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tText, "Text", "Neues Item 2")
	DllStructSetData($tItem, "Mask", $LVIF_TEXT)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "Text", DllStructGetPtr($tText))
	_GUICtrlListView_SetItemEx($hListView, $tItem)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
