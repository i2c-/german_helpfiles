#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[6], $hRandomItem, $iRandIndex, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Legt durch den Index fest, ob die Checkbox angehakt ist", 550, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To UBound($hItem) - 1
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x + 1), $hTreeView)
		For $y = 0 To 5
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child Item", $y + 1), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hRandomItem = Random(0, UBound($hItem) - 1, 1)
	$iRandIndex = Random(0, 5, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", _
			StringFormat("Setzt den Child Item Index[%d] vom Itemindex[%d]: %s", $iRandIndex, $hRandomItem, _
			_GUICtrlTreeView_SetCheckedByIndex($hTreeView, $hItem[$hRandomItem], $iRandIndex)))
	_GUICtrlTreeView_Expand($hTreeView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
