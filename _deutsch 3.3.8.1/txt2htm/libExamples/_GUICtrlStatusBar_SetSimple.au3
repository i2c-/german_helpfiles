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
	$hGUI = GUICreate("StatusBar: Einfacher Modus setzen", 400, 300)

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Pr&uuml;ft, ob ein Statusbar-Control sich im einfachen Modus befindet
	; Legt fest, ob ein Statusfenster einfachen Text oder alle Fensterabschnitte darstellen soll
	MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))
	_GUICtrlStatusBar_SetSimple($hStatus, True)
	MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
