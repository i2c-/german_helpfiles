#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiMenu.au3>

Global $hRichEdit, $mnu, $mnuUndo, $mnuRedo, $mnuEmpty

Main()

Func Main()
	Local $hGui
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	$mnu = GUICtrlCreateContextMenu(GUICtrlCreateDummy())
	$mnuUndo = GUICtrlCreateMenuitem("R&uuml;ckg&auml;ngig", $mnu)
	$mnuRedo = GUICtrlCreateMenuitem("Wiederholen", $mnu)
	GUICtrlCreateMenuitem("", $mnu)
	$mnuEmpty = GUICtrlCreateMenuitem("L&ouml;sche R&uuml;ckg&auml;ngig Puffer", $mnu)

	_GUICtrlRichEdit_SetEventMask($hRichEdit, $ENM_MOUSEEVENTS)

	While True
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $mnuUndo
				_GUICtrlRichEdit_Undo($hRichEdit)
			Case $mnuRedo
				_GUICtrlRichEdit_Redo($hRichEdit)
			Case $mnuEmpty
				_GUICtrlRichEdit_EmptyUndoBuffer($hRichEdit)
		EndSwitch
	WEnd
EndFunc   ;==>Main

Func WM_NOTIFY($hWnd, $iMsg, $iWparam, $iLparam)
	#forceref $iMsg, $iWparam
	Local $hWndFrom, $iCode, $tNMHDR, $tMsgFilter, $hMenu
	$tNMHDR = DllStructCreate($tagNMHDR, $iLparam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hRichEdit
			Select
				Case $iCode = $EN_MSGFILTER
					$tMsgFilter = DllStructCreate($tagEN_MSGFILTER, $iLparam)
					If DllStructGetData($tMsgFilter, "msg") = $WM_RBUTTONUP Then
						$hMenu = GUICtrlGetHandle($mnu)
						SetMenuTexts($hWndFrom, $hMenu)
						_GUICtrlMenu_TrackPopupMenu($hMenu, $hWnd)
					EndIf
			EndSelect
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func SetMenuTexts($hWnd, $hMenu)
	If _GUICtrlRichEdit_CanUndo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuUndo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $mnuUndo, "R&uuml;ckg&auml;ngig: " & _GUICtrlRichEdit_GetNextUndo($hWnd), False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuEmpty, True, False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $mnuUndo, "R&uuml;ckg&auml;ngig", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuUndo, False, False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuEmpty, False, False)
	EndIf
	If _GUICtrlRichEdit_CanRedo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuRedo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $mnuRedo, "Wiederholen: " & _GUICtrlRichEdit_GetNextRedo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $mnuRedo, "Wiederholen", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuRedo, False, False)
	EndIf
EndFunc   ;==>SetMenuTexts
