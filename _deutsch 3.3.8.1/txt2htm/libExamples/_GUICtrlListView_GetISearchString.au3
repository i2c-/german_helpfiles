#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hImage, $hListView

	GUICreate("ListView: Ermittelt den inkrementellen Suchstring", 420, 300)

	$hListView = GUICtrlCreateListView("", 2, 2, 414, 268)
	GUICtrlSetStyle($hListView, $LVS_ICON)
	GUISetState()

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
EndFunc   ;==>_Main
