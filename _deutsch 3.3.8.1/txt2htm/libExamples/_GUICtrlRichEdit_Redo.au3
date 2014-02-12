#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiMenu.au3>

Global $hRichEdit, $mnu, $mnuUndo, $mnuRedo, $mnuCut, $mnuCopy
Global $mnuPaste, $mnuPasteSpl, $mnuPasteSplRTF, $mnuPasteSplwObjs

Main()

Func Main()
	Local $hGui
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Die ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, ReadBmpToRtf(FindFirstBMP()) & @CR)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	$mnu = GUICtrlCreateContextMenu(GUICtrlCreateDummy())
	$mnuUndo = GUICtrlCreateMenuitem("R&uuml;ckg&auml;ngig", $mnu)
	$mnuRedo = GUICtrlCreateMenuitem("Wiederherstellen", $mnu)
	GUICtrlCreateMenuitem("", $mnu)
	$mnuCut = GUICtrlCreateMenuitem("Ausschneiden", $mnu)
	$mnuCopy = GUICtrlCreateMenuitem("Kopieren", $mnu)
	$mnuPaste = GUICtrlCreateMenuitem("Einf&uuml;gen", $mnu)
	$mnuPasteSpl = GUICtrlCreateMenu("Einf&uuml;gen Spezial", $mnu)
	$mnuPasteSplRTF = GUICtrlCreateMenuitem("Nur RTF ", $mnuPasteSpl)
	$mnuPasteSplwObjs = GUICtrlCreateMenuitem("Mit Objekts", $mnuPasteSpl)
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
			Case $mnuCut
				_GUICtrlRichEdit_Cut($hRichEdit)
			Case $mnuCopy
				_GUICtrlRichEdit_Copy($hRichEdit)
			Case $mnuPaste
				_GUICtrlRichEdit_Paste($hRichEdit)
			Case $mnuPasteSplRTF
				_GUICtrlRichEdit_PasteSpecial($hRichEdit, False)
			Case $mnuPasteSplwObjs
				_GUICtrlRichEdit_PasteSpecial($hRichEdit, True)
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
	Local $fState
	If _GUICtrlRichEdit_CanUndo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuUndo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $mnuUndo, "R&uuml;ckg&auml;ngig: " & _GUICtrlRichEdit_GetNextUndo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $mnuUndo, "R&uuml;ckg&auml;ngig", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuUndo, False, False)
	EndIf
	If _GUICtrlRichEdit_CanRedo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuRedo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $mnuRedo, "Wiederherstellen: " & _GUICtrlRichEdit_GetNextRedo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $mnuRedo, "Wiederherstellen", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $mnuRedo, False, False)
	EndIf
	$fState = _GUICtrlRichEdit_IsTextSelected($hWnd)
	_GUICtrlMenu_SetItemEnabled($hMenu, $mnuCut, $fState, False)
	_GUICtrlMenu_SetItemEnabled($hMenu, $mnuCopy, $fState, False)

	_GUICtrlMenu_SetItemEnabled($hMenu, $mnuPaste, _GUICtrlRichEdit_CanPaste($hWnd), False)

	_GUICtrlMenu_SetItemEnabled($hMenu, $mnuPasteSpl, _GUICtrlRichEdit_CanPasteSpecial($hWnd), False)
EndFunc   ;==>SetMenuTexts

Func ReadBmpToRtf($sBmpFilspc)
	Local $hFile, $sRtf
	$hFile = FileOpen($sBmpFilspc, 16)
	If FileRead($hFile, 2) <> "0x424D" Then Return SetError(1, 0, "")
	FileRead($hFile, 12)
	$sRtf = '{\rtf1{\pict\dibitmap ' & Hex(FileRead($hFile)) & '}}'
	FileClose($hFile)
	Return $sRtf
EndFunc   ;==>ReadBmpToRtf

Func FindFirstBMP($sPath = @WindowsDir)
	Local $hFind, $sBmpFilspc
	$hFind = FileFindFirstFile($sPath & "\*.bmp")
	$sBmpFilspc = FileFindNextFile($hFind)
	FileClose($hFind)
	Return $sPath & "\" & $sBmpFilspc
EndFunc   ;==>FindFirstBMP
