#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()

	Local $hGUI, $aRect, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Ermittelt das Rechteck", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt/Ermittelt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Ermittelt das Rechteck von Abschnitt 1
	$aRect = _GUICtrlStatusBar_GetRect($hStatus, 0)
	MemoWrite("Abschnitt 1 links ...: " & $aRect[0])
	MemoWrite("Abschnitt 1 oben ....: " & $aRect[1])
	MemoWrite("Abschnitt 1 rechts ..: " & $aRect[2])
	MemoWrite("Abschnitt 1 unten ...: " & $aRect[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
