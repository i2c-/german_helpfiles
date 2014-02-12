#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $hListView

	GUICreate("ListView: Ermittelt den inkrementellen Suchstring", 420, 300)

	$hListView = GUICtrlCreateListView("", 2, 2, 414, 268)
	GUICtrlSetStyle($hListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 0)

	_GUICtrlListView_BeginUpdate($hListView)
	For $x = 1 To 10
		_GUICtrlListView_InsertItem($hListView, "Item " & $x, -1, 0)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	Send("Item 3")

	; Ermittelt den inkrementellen Suchstring
	MsgBox(8256, "Information", "Inkrementeller Suchstring: " & _GUICtrlListView_GetISearchString($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
