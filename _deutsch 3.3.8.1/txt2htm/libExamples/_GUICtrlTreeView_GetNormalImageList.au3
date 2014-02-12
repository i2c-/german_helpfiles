#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global Const $Turquoise = 0x40e0d0
Global Const $Crimson = 0xDC143C

_Main()

Func _Main()

	Local $hImage, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt die normale Imagelist", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_SetBkColor($hTreeView, $Turquoise)
	_GUICtrlTreeView_SetTextColor($hTreeView, $Crimson)
	_GUICtrlTreeView_SetLineColor($hTreeView, $COLOR_WHITE)

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 5
		_GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x + 1), $x, $x)
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox(4160, "Information", "Handle der normalen Imagelist: " & _GUICtrlTreeView_GetNormalImageList($hTreeView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
