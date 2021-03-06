#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

_Main()

Func _Main()
	Local $listview, $hImage
	Local $exStyles = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	GUICreate("ImageList: aktuelle Hintergrundfarbe f&uuml;r eine Imagelist ermitteln", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, $exStyles)
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	MsgBox(4160, "Information", "Hintergrundfarbe: " & _GUIImageList_GetBkColor($hImage))
	_GUIImageList_SetBkColor($hImage, 0x0000FF)
	MsgBox(4160, "Information", "Hintergrundfarbe: " & _GUIImageList_GetBkColor($hImage))

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($listview, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($listview, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($listview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($listview, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($listview, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($listview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($listview, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($listview, "Zeile 3: Spalte 1", 2)
	_GUICtrlListView_AddItem($listview, "Zeile 4: Spalte 1", 3)
	_GUICtrlListView_AddItem($listview, "Zeile 5: Spalte  1", 4)
	_GUICtrlListView_AddSubItem($listview, 4, "Zeile 5: Spalte 2", 1, 3)
	_GUICtrlListView_AddItem($listview, "Zeile 6: Spalte 1", 5)
	_GUICtrlListView_AddSubItem($listview, 5, "Zeile 6: Spalte 2", 1, 4)
	_GUICtrlListView_AddSubItem($listview, 5, "Zeile 6: Spalte 3", 2, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
