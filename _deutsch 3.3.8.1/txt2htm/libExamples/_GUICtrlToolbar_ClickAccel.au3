#include <GuiToolbar.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ToolBar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hToolbar, $iMemo
Global $iItem ; ID des Buttons der mit der Nachricht verkn&uuml;pft ist
Global Enum $idNew = 1000, $idOpen, $idSave, $idHelp

_Main()

Func _Main()
	Local $hGUI, $aSize, $aStrings[4]

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 600, 400)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$aSize = _GUICtrlToolbar_GetMaxSize($hToolbar)

	$iMemo = GUICtrlCreateEdit("", 2, $aSize[1] + 30, 596, 396 - ($aSize[1] + 30), $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

	; F&uuml;gt die Standard Systembitmaps hinzu
	_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

	; F&uuml;gt Strings hinzu
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&Neu")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&&Ouml;ffnen")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Speichern")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Hilfe")

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP, $aStrings[3])

	; Klickt auf den Speichern-Button durch Verwendung des Abk&uuml;rzungsbefehls
	_GUICtrlToolbar_ClickAccel($hToolbar, "s", "left", True)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; WM_NOTIFY-Eventhandler
Func _WM_NOTIFY($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $hWndGUI, $MsgID, $wParam
	Local $tNMHDR, $hwndFrom, $code, $i_idNew, $dwFlags, $i_idOld
	Local $tNMTBHOTITEM
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hwndFrom = DllStructGetData($tNMHDR, "hWndFrom")
	$code = DllStructGetData($tNMHDR, "Code")
	Switch $hwndFrom
		Case $hToolbar
			Switch $code
				Case $NM_LDOWN
					;----------------------------------------------------------------------------------------------
					MemoWrite("$NM_LDOWN: Angeklicktes Item: " & $iItem & " bei Index: " & _GUICtrlToolbar_CommandToIndex($hToolbar, $iItem))
					;----------------------------------------------------------------------------------------------
				Case $TBN_HOTITEMCHANGE
					$tNMTBHOTITEM = DllStructCreate($tagNMTBHOTITEM, $lParam)
					$i_idOld = DllStructGetData($tNMTBHOTITEM, "idOld")
					$i_idNew = DllStructGetData($tNMTBHOTITEM, "idNew")
					$iItem = $i_idNew
					$dwFlags = DllStructGetData($tNMTBHOTITEM, "dwFlags")
					If BitAND($dwFlags, $HICF_LEAVING) = $HICF_LEAVING Then
						MemoWrite("$HICF_LEAVING: " & $i_idOld)
					Else
						Switch $i_idNew
							Case $idNew
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idNew")
								;----------------------------------------------------------------------------------------------
							Case $idOpen
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idOpen")
								;----------------------------------------------------------------------------------------------
							Case $idSave
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idSave")
								;----------------------------------------------------------------------------------------------
							Case $idHelp
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idHelp")
								;----------------------------------------------------------------------------------------------
						EndSwitch
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
