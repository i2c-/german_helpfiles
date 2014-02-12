#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $btn_SetData, $btn_GetData, $hMemory, $hLock, $tData, $sData, $iSize

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 450)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	$btn_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				; Zwischenablage &ouml;ffnen
				If _ClipBoard_Open(0) Then

					; Zwischenablage leeren
					If _ClipBoard_Empty() Then

						; Erzeugt globalen Pufferspeicher (zeigt, warum _ClipBoard_SetData VIEL einfacher zu benutzen ist!)
						$sData = "Ein freundliches Hallo von AutoIt"
						$iSize = StringLen($sData) + 1
						$hMemory = _MemGlobalAlloc($iSize, $GHND)
						If $hMemory <> 0 Then
							$hLock = _MemGlobalLock($hMemory)
							If $hLock = 0 Then _WinAPI_ShowError("_Mem_GlobalLock fehlgeschlagen!")
							$tData = DllStructCreate("char Text[" & $iSize & "]", $hLock)
							DllStructSetData($tData, "Text", $sData)
							_MemGlobalUnlock($hMemory)

							; Schreibt Text in die Zwischenablage
							If Not _ClipBoard_SetDataEx($hMemory, $CF_TEXT) Then _WinAPI_ShowError("_ClipBoard_SetDataEx fehlgeschlagen!")
						Else
							_WinAPI_ShowError("_Mem_GlobalAlloc fehlgeschlagen!")
						EndIf

						; Zwischenablage schlie&szlig;en
						_ClipBoard_Close()
					Else
						; Zwischenablage schlie&szlig;en
						_ClipBoard_Close()
						_WinAPI_ShowError("_ClipBoard_Empty fehlgeschlagen!")
					EndIf
				Else
					_WinAPI_ShowError("_ClipBoard_Open failed")
				EndIf
			Case $btn_GetData
				MemoWrite(_ClipBoard_GetData())
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
