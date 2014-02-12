#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die StatusBar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()

	Local $hGUI, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Ermittelt Textflags", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 0, $SBT_POPOUT)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1, $SBT_NOBORDERS)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 3", 2, $SBT_NOTABPARSING)

	; Ermittelt Textinformationen
	For $iI = 0 To _GUICtrlStatusBar_GetCount($hStatus) - 1
		MemoWrite("Abschnitt " & $iI & " Textflags : " & _GUICtrlStatusBar_GetTextFlags($hStatus, $iI))
		MemoWrite("Abschnitt " & $iI & " Textl&auml;nge : " & _GUICtrlStatusBar_GetTextLength($hStatus, $iI))
		MemoWrite("Abschnitt " & $iI & " Textl&auml;nge : 0x" & Hex(_GUICtrlStatusBar_GetTextLengthEx($hStatus, $iI)))
		MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
