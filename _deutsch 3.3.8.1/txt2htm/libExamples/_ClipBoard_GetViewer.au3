#include <ClipBoard.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>

Global $iMemo, $hNext = 0

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Zwischenablage", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Initialisiere den Clipboard-Anzeiger
	$hNext = _ClipBoard_SetViewer($hGUI)

	GUIRegisterMsg($WM_CHANGECBCHAIN, "WM_CHANGECBCHAIN")
	GUIRegisterMsg($WM_DRAWCLIPBOARD, "WM_DRAWCLIPBOARD")

	MemoWrite("GUI-Handle ....: " & $hGUI)
	MemoWrite("Viewer-Handle .: " & _ClipBoard_GetViewer())

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Beende den Clipboard-Anzeiger
	_ClipBoard_ChangeChain($hGUI, $hNext)
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Bearbeite die $WM_CHANGECBCHAIN-Nachricht
Func WM_CHANGECBCHAIN($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; Zeigt an, dass eine Nachricht empfangen wurde
	MemoWrite("***** $WM_CHANGECBCHAIN *****")

	; Wenn das Fenster geschlossen ist, repariere die Nachrichtenkette
	If $iwParam = $hNext Then
		$hNext = $ilParam
		; Sonst reiche die Nachricht an den n&auml;chsten Anzeiger weiter
	ElseIf $hNext <> 0 Then
		_SendMessage($hNext, $WM_CHANGECBCHAIN, $iwParam, $ilParam, 0, "hwnd", "hwnd")
	EndIf
EndFunc   ;==>WM_CHANGECBCHAIN

; Bearbeitete $WM_DRAWCLIPBOARD-Nachrichten
Func WM_DRAWCLIPBOARD($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; Zeigt jeden Text aus der Zwischenablage an
	MemoWrite(_ClipBoard_GetData())

	; Reiche die Nachricht an den n&auml;chsten Anzeiger weiter
	If $hNext <> 0 Then _SendMessage($hNext, $WM_DRAWCLIPBOARD, $iwParam, $ilParam)
EndFunc   ;==>WM_DRAWCLIPBOARD
