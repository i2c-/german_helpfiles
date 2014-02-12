#include <GuiComboBoxEx.au3>
#include <GuiImageList.au3>
#include <GuiConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hImage, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Setzt die erweiterte Oberfl&auml;che", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

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

	; Ermittelt, ob die Standardbenutzeroberfl&auml;che oder die erweiterte Benutzeroberfl&auml;che verwendet wird
	MemoWrite("Erweiterte Benutzeroberfl&auml;che: " & _GUICtrlComboBoxEx_GetExtendedUI($hCombo))

	; Setzt die erweiterte Oberfl&auml;che
	_GUICtrlComboBoxEx_SetExtendedUI($hCombo, True)

	; Ermittelt, ob die Standardbenutzeroberfl&auml;che oder die erweiterte Benutzeroberfl&auml;che verwendet wird
	MemoWrite("Erweiterte Benutzeroberfl&auml;che: " & _GUICtrlComboBoxEx_GetExtendedUI($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
