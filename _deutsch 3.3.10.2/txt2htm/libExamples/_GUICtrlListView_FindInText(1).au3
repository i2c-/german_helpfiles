#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iI, $hListView

	GUICreate("ListView: Sucht nach dem Zielitem", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 49
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_AddItem($hListView, "Zielitem")
	For $iI = 51 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Sucht nach dem Zielitem
	$iI = _GUICtrlListView_FindInText($hListView, "zIeL")
	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Zielitems: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
