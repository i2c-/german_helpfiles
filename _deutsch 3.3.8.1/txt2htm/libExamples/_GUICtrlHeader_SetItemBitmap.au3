#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

$Debug_HDR = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Header-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $hImage

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Erstellt eine Imagelist mit Bildern
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList($hHeader, $hImage)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100, 0, 0)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Setzt das Bitmap f&uuml;r Spalte 4
	_GUICtrlHeader_SetItemBitmap($hHeader, 3, _WinAPI_CreateSolidBitmap($hGUI, 0xFF00FF, 11, 11))
	_GUICtrlHeader_SetItemDisplay($hHeader, 3, 1 + 8)

	; Zeigt das Bitmap-Handle von Spalte 4
	MemoWrite("Bitmap-Handle von Spalte 4: " & "0x" & Hex(_GUICtrlHeader_GetItemBitmap($hHeader, 3)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
