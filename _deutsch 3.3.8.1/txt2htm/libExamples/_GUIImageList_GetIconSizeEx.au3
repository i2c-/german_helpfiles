#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiImageList.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hImage, $hGUI, $hDC, $tSize

	$hGUI = GUICreate("Imagelist: Icongr&ouml;&szlig;e ermitteln", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 32, 24))

	; Zeichnet Bilder
	$hDC = _WinAPI_GetDC($hGUI)
	_GUIImageList_Draw($hImage, 0, $hDC, 4, 4)
	_GUIImageList_Draw($hImage, 1, $hDC, 40, 4)
	_GUIImageList_Draw($hImage, 2, $hDC, 76, 4)

	_WinAPI_ReleaseDC($hGUI, $hDC)

	; Zeigt die Icongr&ouml;&szlig;e in der Imagelist
	$tSize = _GUIImageList_GetIconSizeEx($hImage)
	MemoWrite("Bilderbreite: " & DllStructGetData($tSize, "X"))
	MemoWrite("Bilderh&ouml;he  : " & DllStructGetData($tSize, "Y"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
