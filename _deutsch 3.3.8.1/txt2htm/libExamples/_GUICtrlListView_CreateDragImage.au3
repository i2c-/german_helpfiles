#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()

	Local $GUI, $hImage, $aDrag, $hListView

	$GUI = GUICreate("(UDF) ListView: Erstellt eine Imagelist f&uuml;r das bestimmte Item", 500, 300)

	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
	$iMemo = GUICtrlCreateEdit("", 2, 124, 396, 174, 0)
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

	; Erstellt eine Imagelist f&uuml;r das bestimmte Item
	$aDrag = _GUICtrlListView_CreateDragImage($hListView, 0)
	_GUICtrlListView_DrawDragImage($hListView, $aDrag)

	MemoWrite("Drag Image Handle = 0x" & Hex($aDrag[0]) & " IsPtr = " & IsPtr($aDrag[0]) & " IsHWnd = " & IsHWnd($aDrag[0]))

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
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
