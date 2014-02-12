#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>

Global $iMemo

_Example_Defaults()
_Example_ExplorerStyleMultiSelect()
_Example_OldStyle()
_Example_ExplorerStyleSinglSelect()
_Example_ExplorerStyle_NoPlaceBar()

Func _Example_Defaults()
	Local $hGui, $btn_dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName (mit Standardeinstellungen)", 450, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("&Ouml;ffnen-Dialog", 180, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetOpenFileName() ; Verwendet Standards
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_Defaults

Func _Example_ExplorerStyleMultiSelect()
	Local $hGui, $btn_dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (Mehrfachauswahl)", 450, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("&Ouml;ffnen-Dialog", 180, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-&Ouml;ffnen-Dialog", _
						"Textdatei (*.txt;*.au3)", ".", @ScriptName, "", 1, _
						BitOR($OFN_ALLOWMULTISELECT, $OFN_EXPLORER), 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyleMultiSelect

Func _Example_OldStyle()
	Local $hGui, $btn_dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im alten Stil (Mehrfachauswahl)", 450, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("&Ouml;ffnen-Dialog", 180, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-&Ouml;ffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, $OFN_ALLOWMULTISELECT, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_OldStyle

Func _Example_ExplorerStyleSinglSelect()
	Local $hGui, $btn_dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (Einfachauswahl)", 450, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("&Ouml;ffnen-Dialog", 180, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-&Ouml;ffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, 0, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyleSinglSelect

Func _Example_ExplorerStyle_NoPlaceBar()
	Local $hGui, $btn_dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (ohne Favoriten)", 450, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("&Ouml;ffnen-Dialog", 180, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-&Ouml;ffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, BitOR($OFN_ALLOWMULTISELECT, $OFN_EXPLORER), $OFN_EX_NOPLACESBAR, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyle_NoPlaceBar

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
