#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $GUI, $hImage, $iImage, $hItem, $fDragging = False, $aDrag, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	$GUI = GUICreate("TreeView: Erstellt ein ziehbares Bitmap", 400, 300)
	$hTreeView = GUICtrlGetHandle(GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE))

	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x0000FF, 16, 16))
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 1 To Random(2, 10, 1)
		$iImage = Random(0, 8, 1)
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 1 To Random(2, 10, 1)
			$iImage = Random(0, 8, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)
	_GUICtrlTreeView_SelectItem($hTreeView, 0)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				If $fDragging Then DrawDragImage($hTreeView, $aDrag)

			Case $GUI_EVENT_PRIMARYDOWN
				Local $hSelected = _GUICtrlTreeView_GetSelection($hTreeView)
				If $hSelected Then
					$fDragging = True
					; Erstellt ein ziehbares Bitmap
					$aDrag = _GUICtrlTreeView_CreateDragImage($hTreeView, $hSelected)
					DrawDragImage($hTreeView, $aDrag)
				EndIf

			Case $GUI_EVENT_PRIMARYUP
				If $fDragging Then
					$fDragging = False
					; L&ouml;scht die Imagelist
					_GUIImageList_Destroy($aDrag)
					_WinAPI_InvalidateRect($hTreeView)
					_WinAPI_InvalidateRect(HWnd($GUI))
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>_Main

; Zeichnet ein ziehbares Bitmap
Func DrawDragImage(ByRef $hControl, ByRef $aDrag)
	Local $tPoint, $hDC
	$hDC = _WinAPI_GetWindowDC($hControl)
	$tPoint = _WinAPI_GetMousePos(True, $hControl)
	_WinAPI_InvalidateRect($hControl)
	_GUIImageList_Draw($aDrag, 0, $hDC, DllStructGetData($tPoint, "X"), DllStructGetData($tPoint, "Y"))
	_WinAPI_ReleaseDC($hControl, $hDC)
EndFunc   ;==>DrawDragImage
