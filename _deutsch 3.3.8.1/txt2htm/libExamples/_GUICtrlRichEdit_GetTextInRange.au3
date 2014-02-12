#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
	_GUICtrlRichEdit_SetEventMask($hRichEdit, $ENM_LINK)

	_GUICtrlRichEdit_AutoDetectURL($hRichEdit, True)
	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "http://www.autoitscript.com")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Main

Func WM_NOTIFY($hWnd, $iMsg, $iWparam, $iLparam)
	#forceref $hWnd, $iMsg, $iWparam
	Local $hWndFrom, $iCode, $tNMHDR, $tEnLink, $cpMin, $cpMax, $tMsgFilter
	$tNMHDR = DllStructCreate($tagNMHDR, $iLparam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hRichEdit
			Select
				Case $iCode = $EN_LINK
					$tMsgFilter = DllStructCreate($tagEN_MSGFILTER, $iLparam)
					If DllStructGetData($tMsgFilter, "msg") = $WM_LBUTTONUP Then
						$tEnLink = DllStructCreate($tagENLINK, $iLparam)
						$cpMin = DllStructGetData($tEnLink, "cpMin")
						$cpMax = DllStructGetData($tEnLink, "cpMax")
						MsgBox(0, "", "Rufe deinen Webbrowser hier auf und navigiere ihn zu " & _
								_GUICtrlRichEdit_GetTextInRange($hRichEdit, $cpMin, $cpMax))
					EndIf
			EndSelect
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
