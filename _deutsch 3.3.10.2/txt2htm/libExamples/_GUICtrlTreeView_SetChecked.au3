#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[6], $hRandomItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Setzt die Checkbox eines Items", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To UBound($hItem) - 1
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x + 1), $hTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hRandomItem = Random(0, UBound($hItem) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d angehakt? %s", $hRandomItem, _GUICtrlTreeView_GetChecked($hTreeView, $hItem[$hRandomItem])))
	_GUICtrlTreeView_SetChecked($hTreeView, $hItem[$hRandomItem])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d angehakt? %s", $hRandomItem, _GUICtrlTreeView_GetChecked($hTreeView, $hItem[$hRandomItem])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
