#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $listview, $hImage, $iRandom
	Local $exStyles = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	GUICreate("ImageList: Bilderanzahl ermitteln", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, $exStyles)
	GUISetState(@SW_SHOW)

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	$iRandom = Random(6, 20, 1)
	For $x = 1 To $iRandom
		_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", $x)
	Next
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

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
	_GUICtrlListView_AddItem($listview, "Zeile 5: Spalte 1", 4)
	_GUICtrlListView_AddSubItem($listview, 4, "Zeile 5: Spalte 2", 1, 3)
	_GUICtrlListView_AddItem($listview, "Zeile 6: Spalte 1", 5)
	_GUICtrlListView_AddSubItem($listview, 5, "Zeile 6: Spalte 2", 1, 4)
	_GUICtrlListView_AddSubItem($listview, 5, "Zeile 6: Spalte 3", 2, 3)

	MsgBox($MB_SYSTEMMODAL, "Information", "Bilderanzahl: " & _GUIImageList_GetImageCount($hImage))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
