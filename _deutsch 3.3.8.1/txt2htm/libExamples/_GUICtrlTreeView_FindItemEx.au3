#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hItem[10], $hItemFound, $htmp_item, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt ein Item", 400, 300)
	Opt("GUIDataSeparatorChar", "\")

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To 2
			$htmp_item = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem(StringFormat("Suchst du nach mir?", $x), $htmp_item)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $hTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hItemFound = _GUICtrlTreeView_FindItemEx($hTreeView, "[03] Neues Item\[02] Neues Item\Suchst du nach mir?")
	If $hItemFound Then
		_GUICtrlTreeView_SelectItem($hTreeView, $hItemFound)
		MsgBox(4160, "Information", "Item gefunden:" & @LF & "Handle: " & $hItemFound & @LF & "Text: " & _GUICtrlTreeView_GetText($hTreeView, $hItemFound))
	Else
		MsgBox(4160, "Information", "Nicht gefunden")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
