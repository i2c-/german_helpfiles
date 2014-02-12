#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hImage, $hStateImage

Example()

Func Example()

	Local $hItem[10], $hChildItem[30], $iYItem = 0, $iX = 9, $iY = 29, $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: Sortieren", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $iX), $hTreeView)
		$iX -= 1
		For $y = 1 To 3
			$iRand = Random(0, 5, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $iY), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_Expand($hTreeView)
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Sortieren")
	_GUICtrlTreeView_Sort($hTreeView)
	_GUICtrlTreeView_SelectItem($hTreeView, $hItem[9])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
