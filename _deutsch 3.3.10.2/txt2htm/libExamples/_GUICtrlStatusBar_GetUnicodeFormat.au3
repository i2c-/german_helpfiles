#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()

	Local $hGUI, $hStatus

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Ermittelt das Unicode Format", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt das Unicode Format
	MemoWrite("Unicode Format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))
	_GUICtrlStatusBar_SetUnicodeFormat($hStatus)
	MemoWrite("Unicode Format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
