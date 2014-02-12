#include <GuiToolbar.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.
Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hToolbar, $hNormal, $hDisabled, $hHot
	Local Enum $idRed = 1000, $idGreen, $idBlue

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	GUISetBkColor(0xffff00)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")
	GUISetState()

	; Erstellt eine normale Imagelist
	$hNormal = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 32, 24))
	_GUICtrlToolbar_SetImageList($hToolbar, $hNormal)

	; Erstellt eine deaktivierte Imagelist
	$hDisabled = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUICtrlToolbar_SetDisabledImageList($hToolbar, $hDisabled)

	; Erstellt eine 'hot' Imagelist
	$hHot = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0x111111, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0x888888, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0xAAAAAA, 32, 24))
	_GUICtrlToolbar_SetHotImageList($hToolbar, $hHot)

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; Deaktiviert den blauen Button
	_GUICtrlToolbar_EnableButton($hToolbar, $idBlue, False)

	; Zeigt die Handles der Imagelisten
	MemoWrite("Handle der deaktivierte Imagelist .: 0x" & Hex(_GUICtrlToolbar_GetDisabledImageList($hToolbar)))
	MemoWrite("Handle der 'hot' Imagelist ........: 0x" & Hex(_GUICtrlToolbar_GetHotImageList($hToolbar)))
	MemoWrite("IsPtr = " & IsPtr(_GUICtrlToolbar_GetHotImageList($hToolbar)) & " IsHWnd = " & IsHWnd(_GUICtrlToolbar_GetHotImageList($hToolbar)))
	MemoWrite("Handle der normalen Imagelist .....: 0x" & Hex(_GUICtrlToolbar_GetImageList($hToolbar)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
