#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()

	Local $hItem[100], $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: sichtbar machen", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 99
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(40, 99, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Index %d sichtbar: %s", $iRand, _GUICtrlTreeView_GetVisible($hTreeView, $hItem[$iRand])))
	_GUICtrlTreeView_EnsureVisible($hTreeView, $hItem[$iRand])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Index %d sichtbar: %s", $iRand, _GUICtrlTreeView_GetVisible($hTreeView, $hItem[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
