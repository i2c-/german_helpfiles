#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $hListView

	GUICreate("ListView: Setzt die Anzahl von Arbeitsfl&auml;chen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($hListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 0)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, 0, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1", 0)
	_GUICtrlListView_AddItem($hListView, "Item 2", 1)
	_GUICtrlListView_AddItem($hListView, "Item 3", 2)

	; Erstellt eine Arbeitsfl&auml;che
	_GUICtrlListView_SetWorkAreas($hListView, 0, 0, 100, 100)
	MsgBox($MB_SYSTEMMODAL, "Information", "Arbeitsfl&auml;chen: " & _GUICtrlListView_GetNumberOfWorkAreas($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
