#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

_Main()

Func _Main()
	Local $listview, $hImage

	GUICreate("Imagelist: AddMasked", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($listview, 0xFF0000, 11, 11))
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($listview, 0x00FF00, 11, 11))
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($listview, 0x0000FF, 11, 11))
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Items", 120)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($listview, "Item 1", 0)
	_GUICtrlListView_AddItem($listview, "Item 2", 1)
	_GUICtrlListView_AddItem($listview, "Item 3", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
