#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aRect, $hListView

	GUICreate("ListView: Ermittelt das Rechteck des Items", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Ermittelt das Rechteck von Item 2
	$aRect = _GUICtrlListView_GetItemRect($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item 2 Rechteck : [%d, %d, %d, %d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
