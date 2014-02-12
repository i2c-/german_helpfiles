#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hItem[100], $iRand, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: sichtbar machen", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 99
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(40, 99, 1)
	MsgBox(4160, "Information", StringFormat("Index %d sichtbar: %s", $iRand, _GUICtrlTreeView_GetVisible($hTreeView, $hItem[$iRand])))
	_GUICtrlTreeView_EnsureVisible($hTreeView, $hItem[$iRand])
	MsgBox(4160, "Information", StringFormat("Index %d sichtbar: %s", $iRand, _GUICtrlTreeView_GetVisible($hTreeView, $hItem[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
