#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hImage, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Erstellt ein vollfarbiges Bitmap", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x0000FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0xFF00FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x000000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x00FFFF, 16, 16))
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	For $x = 0 To _GUIImageList_GetImageCount($hImage) - 1
		_GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x + 1), $x, $x + 3)
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
