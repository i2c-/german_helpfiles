#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $exStyles = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES), $hListView

	GUICreate("ListView: Setzt das 'hot' Item", 400, 300)

	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	$hListView = GUICtrlGetHandle($hListView)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, $exStyles)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1")
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1")
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1")

	; Setzt das 'hot' Item
	_GUICtrlListView_SetHotItem($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Hot Item: " & _GUICtrlListView_GetHotItem($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
