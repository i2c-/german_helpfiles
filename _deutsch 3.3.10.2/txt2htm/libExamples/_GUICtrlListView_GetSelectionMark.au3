#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt die Markierung", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; W&auml;hlt mehrere Items aus
	_GUICtrlListView_SetSelectionMark($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Markierung: " & _GUICtrlListView_GetSelectionMark($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
