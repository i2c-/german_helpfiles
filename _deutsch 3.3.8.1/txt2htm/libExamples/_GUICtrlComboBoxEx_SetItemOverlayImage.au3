#include <GuiComboBoxEx.au3>
#include <GuiImageList.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hImage, $image, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Setzt den Index des Icons &uuml;ber der die Maus steht", 500, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x0000FF, 16, 16))
	_GUICtrlComboBoxEx_SetImageList($hCombo, $hImage)

	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	For $x = 0 To 149
		$image = Random(0, 8, 1)
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $image, $image)
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	_GUICtrlComboBoxEx_SetItemImage($hCombo, 0, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 2, 1)
	_GUICtrlComboBoxEx_SetItemOverlayImage($hCombo, 2, 6)
	MsgBox(4160, "Information", "Item Overlay Bild: " & _GUICtrlComboBoxEx_GetItemOverlayImage($hCombo, 2))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
