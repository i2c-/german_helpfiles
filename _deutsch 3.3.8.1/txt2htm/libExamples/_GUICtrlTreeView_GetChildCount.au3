#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hItem[10], $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt die Anzahl der Childs", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To Random(1, 20, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9)
	MsgBox(4160, "Information", StringFormat("Anzahl der Childs f&uuml;r den Itemindex %d: %d", $iRand, _GUICtrlTreeView_GetChildCount($hTreeView, $hItem[$iRand])))
	_GUICtrlTreeView_Expand($hTreeView, $hItem[$iRand])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
