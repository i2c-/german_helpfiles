#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hImage, $hStateImage

_Main()

Func _Main()

	Local $hItem[10], $hChildItem[30], $iYItem = 0, $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: Ist es das erste Item?", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_CreateNormalImageList()
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_CreateStateImageList()
	_GUICtrlTreeView_SetStateImageList($hTreeView, $hStateImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), 4, 5)
		_GUICtrlTreeView_SetStateImageIndex($hTreeView, $hItem[$x], 1)
		For $y = 1 To 3
			$hChildItem[$iYItem] = _GUICtrlTreeView_AddChild($hTreeView, $hItem[$x], StringFormat("[%02d] Neues Child", $iYItem), 0, 3)
			_GUICtrlTreeView_SetStateImageIndex($hTreeView, $hChildItem[$iYItem], 1)
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox(4160, "Information", StringFormat("Ist der Index %d das erste Item? %s", $iRand, _GUICtrlTreeView_IsFirstItem($hTreeView, $hItem[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func _CreateNormalImageList()
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
EndFunc   ;==>_CreateNormalImageList

Func _CreateStateImageList()
	$hStateImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hStateImage, "shell32.dll", 3)
	_GUIImageList_AddIcon($hStateImage, "shell32.dll", 4)
EndFunc   ;==>_CreateStateImageList
