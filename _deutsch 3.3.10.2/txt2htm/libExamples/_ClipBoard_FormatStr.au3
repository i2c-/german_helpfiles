#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $iFormat, $iCount

	; Erstellt eine GUI
	$hGUI = GUICreate("Zwischenablage", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; &Ouml;ffnet die Zwischenablage
	If _ClipBoard_Open($hGUI) Then

		; Liest die Anzahl der verschiedenen Datenformate aus, die in der Zwischenablage verf&uuml;gbar sind
		MemoWrite("Clipboard-Formate ..: " & _ClipBoard_CountFormats())

		; Auflisten der Clipboard-Formate
		Do
			$iFormat = _ClipBoard_EnumFormats($iFormat)
			If $iFormat <> 0 Then
				$iCount += 1
				MemoWrite("Clipboard-Format " & $iCount & " .: " & _ClipBoard_FormatStr($iFormat))
			EndIf
		Until $iFormat = 0

		; Schlie&szlig;t die Zwischenablage
		_ClipBoard_Close()
	Else
		_WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
