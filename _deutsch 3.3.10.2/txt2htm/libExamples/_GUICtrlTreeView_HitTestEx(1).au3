#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hImage, $hStateImage, $a

Example()

Func Example()

	Local $hItem[10], $hChildItem[30], $iYItem = 0, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: Gibt Informationen &uuml;ber den Ort eines Punktes", 600, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

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

	MsgBox($MB_SYSTEMMODAL, "Anleitung", "Klicke mit der linken Maustaste irgendwo ins Fenster!")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $GUI_EVENT_PRIMARYDOWN
				$a = GUIGetCursorInfo()
				MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("HitTestEx (%d, %d): %s", $a[0], $a[1], _GetHitString(_GUICtrlTreeView_HitTestEx($hTreeView, $a[0], $a[1]))))
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example

Func _GetHitString($tHitTest)
	Local $iFlags = DllStructGetData($tHitTest, "Flags")
	Select
		Case BitAND($iFlags, $TVHT_NOWHERE) <> 0
			Return "Im Anwendungsbereich, aber unterhalb des letzten Items"
		Case BitAND($iFlags, $TVHT_ONITEMICON) <> 0
			Return "&Uuml;ber dem Bild, das mit einem Item verkn&uuml;pft ist"
		Case BitAND($iFlags, $TVHT_ONITEMLABEL) <> 0
			Return "&Uuml;ber dem Text, der mit einem Item verkn&uuml;pft ist"
		Case BitAND($iFlags, $TVHT_ONITEMINDENT) <> 0
			Return "&Uuml;ber der Einr&uuml;ckung, die mit einem Item verkn&uuml;pft ist"
		Case BitAND($iFlags, $TVHT_ONITEMBUTTON) <> 0
			Return "&Uuml;ber dem Button, der mit einem Item verkn&uuml;pft ist"
		Case BitAND($iFlags, $TVHT_ONITEMRIGHT) <> 0
			Return "Im Bereich rechts neben einem Item"
		Case BitAND($iFlags, $TVHT_ONITEMSTATEICON) <> 0
			Return "&Uuml;ber dem Status-Icon eines Items, das sich in einem benutzerdefinierten Zustand befindet"
		Case BitAND($iFlags, $TVHT_ABOVE) <> 0
			Return "Oberhalb des Anwendungsbereichs"
		Case BitAND($iFlags, $TVHT_BELOW) <> 0
			Return "Unterhalb des Anwendungsbereichs"
		Case BitAND($iFlags, $TVHT_TORIGHT) <> 0
			Return "Links neben dem Anwendungsbereich"
		Case BitAND($iFlags, $TVHT_TOLEFT) <> 0
			Return "Rechts neben dem Anwendungsbereich"
	EndSelect
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
