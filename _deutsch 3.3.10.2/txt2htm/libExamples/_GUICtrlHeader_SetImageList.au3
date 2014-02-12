#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hHeader, $hImage

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt eine Imagelist mit Bildern
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 11, 11))
	Local $hPrevImageList = _GUICtrlHeader_SetImageList($hHeader, $hImage)

	MemoWrite("Vorheriges Handle der Imagelist ....: " & "0x" & Hex($hPrevImageList))
	MemoWrite("IsPtr = " & IsPtr($hPrevImageList) & " IsHwnd = " & IsHWnd($hPrevImageList))

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100, 0, 0)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Zeigt Informationen &uuml;ber das Header-Control
	MemoWrite("Handle der Imagelist ....: " & "0x" & Hex(_GUICtrlHeader_GetImageList($hHeader)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
