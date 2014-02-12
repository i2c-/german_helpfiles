#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[100], $hChildItem[100], $iRand, $iChildRand, $iYItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt die Anzahl von Items, die sich auf der gleichen Ebene befinden", 700, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	$iRand = Random(2, 9, 1)
	For $x = 0 To $iRand
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		$iChildRand = Random(0, 9, 1)
		For $y = 0 To $iChildRand
			$hChildItem[$iYItem] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Items auf der gleichen Ebene wie Item Index %d: %d", $iRand, _GUICtrlTreeView_GetSiblingCount($hTreeView, $hItem[$iRand])))

	$iRand = Random(0, 99)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Items auf der gleichen Ebene wie Item Index %d: %d", $iRand, _GUICtrlTreeView_GetSiblingCount($hTreeView, $hChildItem[$iRand])))
	_GUICtrlTreeView_Expand($hTreeView, _GUICtrlTreeView_GetParentHandle($hTreeView, $hChildItem[$iRand]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
