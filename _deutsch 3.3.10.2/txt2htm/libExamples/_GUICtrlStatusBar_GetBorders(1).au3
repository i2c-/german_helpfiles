#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()

	Local $hGUI, $aInfo, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: R&auml;nder ermitteln", 400, 300)

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die aktuelle Breite des horizontalen und vertikalen Randes
	$aInfo = _GUICtrlStatusBar_GetBorders($hStatus)
	MemoWrite("Breite des horizontalen Randes ...........: " & $aInfo[0])
	MemoWrite("Breite des vertikalen Randes .............: " & $aInfo[1])
	MemoWrite("Breite des Randes zwischen den Rechtecken : " & $aInfo[2])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
