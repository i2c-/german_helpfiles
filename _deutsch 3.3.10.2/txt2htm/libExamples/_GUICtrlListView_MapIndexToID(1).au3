#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iID, $hListView

	GUICreate("ListView: Bildet die ID eines Items als Index ab", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzuf&uuml;gen
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Zeigt die ID f&uuml;r Item 2
	$iID = _GUICtrlListView_MapIndexToID($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index zu ID: " & $iID)
	MsgBox($MB_SYSTEMMODAL, "Information", "ID zu Index: " & _GUICtrlListView_MapIDToIndex($hListView, $iID))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
