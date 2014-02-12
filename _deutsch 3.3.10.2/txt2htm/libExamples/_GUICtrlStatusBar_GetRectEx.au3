#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()

	Local $hGUI, $tRect, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Ermittelt die Abschnitte", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt/Ermittelt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Ermittelt das Rechteck von Abschnitt 1
	$tRect = _GUICtrlStatusBar_GetRectEx($hStatus, 0)
	MemoWrite("Abschnitt 1 liks ..: " & DllStructGetData($tRect, "Left"))
	MemoWrite("Abschnitt 1 oben ..: " & DllStructGetData($tRect, "Top"))
	MemoWrite("Abschnitt 1 rechts : " & DllStructGetData($tRect, "Right"))
	MemoWrite("Abschnitt 1 unten .: " & DllStructGetData($tRect, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
