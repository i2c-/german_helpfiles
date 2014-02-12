#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hItem[5], $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Wurde die Itemliste der Child-Items mindestens einmal aufgeklappt?", 600, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 4
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox(4160, "Information", "Item 0 aufklappen")
	_GUICtrlTreeView_Expand($hTreeView, $hItem[0])

	MsgBox(4160, "Information", "Item 0 zuklappen")
	_GUICtrlTreeView_Expand($hTreeView, $hItem[0], False)

	MsgBox(4160, "Information", "Wurde Item 0 mindestens einmal aufgeklappt? " & _GUICtrlTreeView_ExpandedOnce($hTreeView, $hItem[0]))
	MsgBox(4160, "Information", "Wurde Item 1 mindestens einmal aufgeklappt? " & _GUICtrlTreeView_ExpandedOnce($hTreeView, $hItem[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
