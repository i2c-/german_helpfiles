#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hGui, $tLOGFONT, $hFont, $hDTP

	; Erstellt eine GUI
	$hGui = GUICreate("DateTimePick: Ermittelt die Schriftart des Monatskalenders", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Erstellt eine neue Schrift f&uuml;r das Monats-Control
	$tLOGFONT = DllStructCreate($tagLOGFONT)
	DllStructSetData($tLOGFONT, "Height", 13)
	DllStructSetData($tLOGFONT, "Weight", 400)
	DllStructSetData($tLOGFONT, "FaceName", "Verdana")
	$hFont = _WinAPI_CreateFontIndirect($tLOGFONT)
	_GUICtrlDTP_SetMCFont($hDTP, $hFont)

	; Ermittelt das Schrifthandle des Monats-Control
	GUICtrlSetData($iMemo, "Schrithandle: " & "0x" & Hex(_GUICtrlDTP_GetMCFont($hDTP), 6), 1)
	GUICtrlSetData($iMemo, " IsPtr=" & IsPtr(_GUICtrlDTP_GetMCFont($hDTP)), 1)
	GUICtrlSetData($iMemo, " IsHwnd=" & IsHWnd(_GUICtrlDTP_GetMCFont($hDTP)) & @CRLF, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
