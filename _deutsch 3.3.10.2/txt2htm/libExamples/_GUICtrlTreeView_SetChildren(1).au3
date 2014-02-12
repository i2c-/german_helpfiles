#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[11], $htmp_item, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Setzt das Children-Flag", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To 2
			$htmp_item = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem(StringFormat("Schaust du nach mir?", $x), $htmp_item)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	$hItem[10] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 10), $hTreeView)
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 0 Children? " & _GUICtrlTreeView_GetChildren($hTreeView, $hItem[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 10 Children? " & _GUICtrlTreeView_GetChildren($hTreeView, $hItem[10]))
	_GUICtrlTreeView_SetChildren($hTreeView, $hItem[10])
	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 10 Children? " & _GUICtrlTreeView_GetChildren($hTreeView, $hItem[10]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
