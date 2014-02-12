#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[10], $hImage, $iImage, $iSImage, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Setzt das Bild f&uuml;r den ausgew&auml;hlten Zustand eines Items", 500, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 466, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Imagelist erstellen
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
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), $x, $x)
		For $y = 1 To Random(2, 10, 1)
			$iImage = Random(0, 5, 1)
			$iSImage = Random(0, 5, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem[$x], StringFormat("[%02d] Neues Child", $y), $iImage, $iSImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	_GUICtrlTreeView_SelectItem($hTreeView, $hItem[2])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Alter Bildindex f&uuml;r den ausgew&auml;hlten Zustand des 3. Items: %d", _GUICtrlTreeView_GetSelectedImageIndex($hTreeView, $hItem[2])))

	; Das 5. Bild der Liste (Index 4) f&uuml;r den ausgew&auml;hlten Zustand des 3. Items (Index 2) setzen
	_GUICtrlTreeView_SetSelectedImageIndex($hTreeView, $hItem[2], 4)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Neuer Bildindex f&uuml;r den ausgew&auml;hlten Zustand des 3. Items: %d", _GUICtrlTreeView_GetSelectedImageIndex($hTreeView, $hItem[2])))
	_GUICtrlTreeView_SelectItem($hTreeView, $hItem[2])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
