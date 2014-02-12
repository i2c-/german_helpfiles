#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hGui, $hItem[10], $hItemChild[30], $iYIndex = 0, $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	$hGui = GUICreate("TreeView: Ermittelt das Handle eines Items", 400, 300)

	$hTreeView = _GUICtrlTreeView_Create($hGui, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = $iYIndex To $iYIndex + 2
			$hItemChild[$y] = _GUICtrlTreeView_AddChild($hTreeView, $hItem[$x], StringFormat("[%02d] Neues Child Item", $y))
		Next
		$iYIndex += 3
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox(4160, "Information", StringFormat("Item Handle f&uuml;r Index %d: %s\r\nIsPtr = %d IsHWnd = %d", $iRand, _GUICtrlTreeView_GetItemHandle($hTreeView, $hItem[$iRand]), _
			IsPtr(_GUICtrlTreeView_GetItemHandle($hTreeView, $hItem[$iRand])), IsHWnd(_GUICtrlTreeView_GetItemHandle($hTreeView, $hItem[$iRand]))))

	$iRand = Random(0, 29, 1)
	MsgBox(4160, "Information", StringFormat("Item Handle f&uuml;r Index %d: %s", $iRand, _GUICtrlTreeView_GetItemHandle($hTreeView, $hItemChild[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
