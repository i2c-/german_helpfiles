#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hImage, $hStateImage, $a

_Main()

Func _Main()

	Local $hItem[10], $hChildItem[30], $iYItem = 0, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: Gibt Informationen &uuml;ber den Ort eines Punktes", 600, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_CreateNormalImageList()
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_CreateStateImageList()
	_GUICtrlTreeView_SetStateImageList($hTreeView, $hStateImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), 4, 5)
		_GUICtrlTreeView_SetStateImageIndex($hTreeView, $hItem[$x], 1)
		For $y = 1 To 3
			$hChildItem[$iYItem] = _GUICtrlTreeView_AddChild($hTreeView, $hItem[$x], StringFormat("[%02d] Neues Child", $y), 0, 3)
			_GUICtrlTreeView_SetStateImageIndex($hTreeView, $hChildItem[$iYItem], 1)
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	_GUICtrlTreeView_SelectItem($hTreeView, $hItem[0])
	_GUICtrlTreeView_SetStateImageIndex($hTreeView, $hItem[0], 2)

	MsgBox(4160, "Anleitung", "Klicke mit der linken Maustaste irgendwo ins Fenster!")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $GUI_EVENT_PRIMARYDOWN
				$a = GUIGetCursorInfo()
				MsgBox(4160, "Information", StringFormat("Hit-Test (%d, %d): %s", $a[0], $a[1], _GetHitString(_GUICtrlTreeView_HitTest($hTreeView, $a[0], $a[1]))))
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>_Main

Func _GetHitString($iResult)
	Switch $iResult
		Case 1
			Return "Im Anwendungsbereich, aber unterhalb des letzten Items"
		Case 2
			Return "&Uuml;ber dem Bild, das mit einem Item verkn&uuml;pft ist"
		Case 4
			Return "&Uuml;ber dem Text, der mit einem Item verkn&uuml;pft ist"
		Case 8
			Return "&Uuml;ber der Einr&uuml;ckung, die mit einem Item verkn&uuml;pft ist"
		Case 16
			Return "&Uuml;ber dem Button, der mit einem Item verkn&uuml;pft ist"
		Case 32
			Return "Im Bereich rechts neben einem Item"
		Case 64
			Return "&Uuml;ber dem Status-Icon eines Items, das sich in einem benutzerdefinierten Zustand befindet"
		Case 128
			Return "Oberhalb des Anwendungsbereichs"
		Case 256
			Return "Unterhalb des Anwendungsbereichs"
		Case 512
			Return "Links neben dem Anwendungsbereich"
		Case 1024
			Return "Rechts neben dem Anwendungsbereich"
	EndSwitch
EndFunc   ;==>_GetHitString

Func _CreateNormalImageList()
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
EndFunc   ;==>_CreateNormalImageList

Func _CreateStateImageList()
	$hStateImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hStateImage, "shell32.dll", 3)
	_GUIImageList_AddIcon($hStateImage, "shell32.dll", 4)
EndFunc   ;==>_CreateStateImageList
