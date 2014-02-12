#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

; Achtung: SetItemParam darf nicht im Zusammenhang mit Items verwendet werden, die mit GUICtrlCreateTreeViewItem erstellt wurden
; Param ist die ID f&uuml;r Items welche mit built-in Funktionen erstellt wurden

Example_External()

Func Example_External()
	Local $GUI, $hItem[10], $hItemChild[30], $iYIndex = 0, $iRand, $iParam = 1, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	$GUI = GUICreate("(UDF) TreeView: Ermittelt den festgelegten Wert", 400, 300)

	$hTreeView = _GUICtrlTreeView_Create($GUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		_GUICtrlTreeView_SetItemParam($hTreeView, $hItem[$x], $iParam)
		$iParam += 1
		For $y = $iYIndex To $iYIndex + 2
			$hItemChild[$y] = _GUICtrlTreeView_AddChild($hTreeView, $hItem[$x], StringFormat("[%02d] Neues Item", $y))
			_GUICtrlTreeView_SetItemParam($hTreeView, $hItemChild[$y], $iParam)
			$iParam += 1
		Next
		$iYIndex += 3
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Itemparameter f&uuml;r Index %d: %s\r\nIsPtr = %d IsHWnd = %d", $iRand, _GUICtrlTreeView_GetItemParam($hTreeView, $hItem[$iRand]), _
			IsPtr(_GUICtrlTreeView_GetItemHandle($hTreeView, $hItem[$iRand])), IsHWnd(_GUICtrlTreeView_GetItemHandle($hTreeView, $hItem[$iRand]))))
	$iRand = Random(0, 29, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Itemparameter f&uuml;r Index %d: %s", $iRand, _GUICtrlTreeView_GetItemParam($hTreeView, $hItemChild[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_External
