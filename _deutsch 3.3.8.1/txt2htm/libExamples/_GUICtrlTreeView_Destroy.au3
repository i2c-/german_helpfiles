#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $GUI, $hItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	$GUI = GUICreate("TreeView: L&ouml;schen (UDF)", 400, 300)

	$hTreeView = _GUICtrlTreeView_Create($GUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 1 To Random(2, 10, 1)
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = 1 To Random(2, 10, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Child", $y))
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox(4160, "Information", "L&ouml;scht das Treeview-Control")
	_GUICtrlTreeView_Destroy($hTreeView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
