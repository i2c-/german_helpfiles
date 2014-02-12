#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hImage, $hListView

	GUICreate("ListView: Setzt die Imagelist", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	Local $hPrevImageList = _GUICtrlListView_SetImageList($hListView, $hImage, 1)

	MsgBox(4160, "Information", "Handle der obigen Image List: 0x" & Hex($hPrevImageList) & @CRLF & _
			"IsPtr = " & IsPtr($hPrevImageList) & " IsHWnd = " & IsHWnd($hPrevImageList))


	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1", 0)
	_GUICtrlListView_AddItem($hListView, "Item 2", 1)
	_GUICtrlListView_AddItem($hListView, "Item 3", 2)

	; Ermittelt das Handle der Imagelist
	MsgBox(4160, "Information", "Handle der Imagelist: 0x" & Hex(_GUICtrlListView_GetImageList($hListView, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
