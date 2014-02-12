#include <GuiComboBoxEx.au3>
#include <GuiImageList.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hImage, $tItem, $sText, $iLen, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt Item-Attribute", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
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

	For $x = 0 To 8
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $x, $x)
	Next

	; Setzt den Itemabstand (Einr&uuml;ckung)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 3, 1)

	; Erzeugt die Struktur
	$tItem = DllStructCreate($tagCOMBOBOXEXITEM)
	; Setzt die Maske f&uuml;r das Gew&uuml;nschte
	DllStructSetData($tItem, "Mask", BitOR($CBEIF_IMAGE, $CBEIF_INDENT, $CBEIF_LPARAM, $CBEIF_SELECTEDIMAGE, $CBEIF_OVERLAY))
	; Setzt den Index des gew&uuml;nschten Items
	DllStructSetData($tItem, "Item", 3)

	_GUICtrlComboBoxEx_GetItemEx($hCombo, $tItem)
	$iLen = _GUICtrlComboBoxEx_GetItemText($hCombo, 1, $sText)
	MemoWrite("Item Text: " & $sText)
	MemoWrite("L&auml;nge des Item-Textes ......................: " & $iLen)
	MemoWrite("Anzahl der Bildbreiten bis zur Einr&uuml;ckung ..: " & DllStructGetData($tItem, "Indent"))
	MemoWrite("0-basierender Itembilderindex ..............: " & DllStructGetData($tItem, "Image"))
	MemoWrite("0-basierender Itemstatusbilderindex ........: " & DllStructGetData($tItem, "SelectedImage"))
	MemoWrite("0-basierender Itembilder-Overlay-Index: ....: " & DllStructGetData($tItem, "OverlayImage"))
	MemoWrite("Anwendungsspezifischer Wert ................: " & DllStructGetData($tItem, "Param"))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
