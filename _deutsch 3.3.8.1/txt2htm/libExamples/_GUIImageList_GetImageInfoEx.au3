#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiImageList.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hImage, $hGUI, $hDC, $tInfo

	$hGUI = GUICreate("ImageList: Ermittelt erweiterte Icon-Informationen (InfoEx)", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 32, 24))

	; Zeichnet die Bilder
	$hDC = _WinAPI_GetDC($hGUI)
	_GUIImageList_Draw($hImage, 0, $hDC, 4, 4)
	_GUIImageList_Draw($hImage, 1, $hDC, 40, 4)
	_GUIImageList_Draw($hImage, 2, $hDC, 76, 4)

	_WinAPI_ReleaseDC($hGUI, $hDC)

	; Zeigt die Informationen des zweiten Bildes
	$tInfo = _GUIImageList_GetImageInfoEx($hImage, 1)
	MemoWrite("Handle des Bildes .: 0x" & Hex(DllStructGetData($tInfo, "hBitmap")))
	MemoWrite("Handle der Maske ..: " & DllStructGetData($tInfo, "hMask"))
	MemoWrite("Linke Seite des Bildes ...: " & DllStructGetData($tInfo, "Left"))
	MemoWrite("Obere Seite des Bildes  ....: " & DllStructGetData($tInfo, "Top"))
	MemoWrite("Rechte Seite des Bildes ..: " & DllStructGetData($tInfo, "Right"))
	MemoWrite("Untere Seite des Bildes .: " & DllStructGetData($tInfo, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
