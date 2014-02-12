#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $listview, $hImage1, $hImage2
	Local $exStyles = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	GUICreate("Imagelist: L&ouml;schen", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, $exStyles)
	GUISetState(@SW_SHOW)

	; L&auml;dt die Bilder
	$hImage1 = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0x0000FF, 11, 11))
	_GUICtrlListView_SetImageList($listview, $hImage1, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Items", 120)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($listview, "Item 1", 0)
	_GUICtrlListView_AddItem($listview, "Item 2", 1)
	_GUICtrlListView_AddItem($listview, "Item 3", 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Es wird nun eine neue Imagelist erstellt")

	; Eine neue Imagelist erstellen
	$hImage2 = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0x0000FF, 11, 11))
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($listview), 0xFF0000, 11, 11))
	_GUICtrlListView_SetImageList($listview, $hImage2, 1)

	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;schen der ersten Imagelist")

	; Erste Imagelist l&ouml;schen
	_GUIImageList_Destroy($hImage1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
