#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

_Main() ; Verwendet die internen AutoIt Controls

Func Example()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Ermittelt die Farbe des Monatskalenders", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Hintergrundfarbe des Monatskalenders
	_GUICtrlDTP_SetMCColor($hDTP, 2, $CLR_MONEYGREEN)

	; Ermittelt die Farben des DTPs
	MemoWrite("Hintergrund zwischen den Monaten .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 0), 6))
	MemoWrite("Text innerhalb der Monate ........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 1), 6))
	MemoWrite("Titelhintergrund .................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 2), 6))
	MemoWrite("Titeltext ........................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 3), 6))
	MemoWrite("Hintergrund innerhalb der Monate .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 4), 6))
	MemoWrite("Text des folgenden Tages .........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 5), 6))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
