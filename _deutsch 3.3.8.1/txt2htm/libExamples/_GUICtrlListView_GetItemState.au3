#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hImage, $hListView

	GUICreate("ListView: Itemstatus ermitteln", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1", 2)

	; Status von Item 1 ermitteln
	_GUICtrlListView_SetItemState($hListView, 0, $LVIS_FOCUSED, $LVIS_FOCUSED)
	MsgBox(4160, "Information", "Status von Item 1: " & _GUICtrlListView_GetItemState($hListView, 0, $LVIS_FOCUSED))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
