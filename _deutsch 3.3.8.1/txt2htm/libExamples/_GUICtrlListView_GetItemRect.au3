#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aRect, $hListView

	GUICreate("ListView: Ermittelt das Rechteck des Items", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Ermittelt das Rechteck von Item 2
	$aRect = _GUICtrlListView_GetItemRect($hListView, 1)
	MsgBox(4160, "Information", StringFormat("Item 2 Rechteck : [%d, %d, %d, %d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
