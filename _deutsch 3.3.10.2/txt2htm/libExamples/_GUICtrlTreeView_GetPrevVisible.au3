#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[20], $hRandItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt das sichtbare Item vor dem angegebenen Item", 500, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $hItem[$x])
		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 4), $hTreeView)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $hItem[$x])
		Next
	Next
	For $x = 10 To 19
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hRandItem = Random(1, 19, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Index %d, vorheriges sichtbares Item: %s", $hRandItem, _GUICtrlTreeView_GetPrevVisible($hTreeView, $hItem[$hRandItem])))
	_GUICtrlTreeView_SelectItem($hTreeView, _GUICtrlTreeView_GetPrevVisible($hTreeView, $hItem[$hRandItem]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
