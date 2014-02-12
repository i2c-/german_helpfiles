#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Example_UDF_Created()

Func Example_UDF_Created()

	Local $GUI, $hImage, $aDrag, $hListView

	$GUI = GUICreate("(UDF) ListView: Zeichnet das zu ziehende Bild", 400, 300)

	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Rot", 0)
	_GUICtrlListView_AddItem($hListView, "Gr&uuml;n", 1)
	_GUICtrlListView_AddItem($hListView, "Blau", 2)

	; Zeichnet das zu ziehende Bild
	$aDrag = _GUICtrlListView_CreateDragImage($hListView, 0)
	_GUICtrlListView_DrawDragImage($hListView, $aDrag)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				_GUICtrlListView_DrawDragImage($hListView, $aDrag)
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; L&ouml;scht die Imagelist
	_GUIImageList_Destroy($aDrag[0])

	GUIDelete()
EndFunc   ;==>Example_UDF_Created
