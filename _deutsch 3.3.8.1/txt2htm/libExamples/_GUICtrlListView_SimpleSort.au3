#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hListView, $B_DESCENDING

_Main()

Func _Main()

	GUICreate("ListView: Sortieren (begrenzt)", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	GUICtrlSendMsg($hListView, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_GRIDLINES, $LVS_EX_GRIDLINES)
	GUICtrlSendMsg($hListView, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_FULLROWSELECT, $LVS_EX_FULLROWSELECT)
	GUICtrlCreateListViewItem("Zeile 4|5|mehr_a", $hListView)
	GUICtrlCreateListViewItem("Zeile 5|4.50 |mehr_c", $hListView)
	GUICtrlCreateListViewItem("Zeile 5|4.0 |mehr_c", $hListView)
	GUICtrlCreateListViewItem("Zeile 3|23|mehr_e", $hListView)
	GUICtrlCreateListViewItem("Zeile 2|0.34560 |mehr_d", $hListView)
	GUICtrlCreateListViewItem("Zeile 1|1.0 |mehr_b", $hListView)
	GUICtrlCreateListViewItem("Zeile 1|0.1 |mehr_b", $hListView)
	GUICtrlCreateListViewItem("Zeile 1|10|mehr_b", $hListView)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 75)
	_GUICtrlListView_SetColumnWidth($hListView, 1, 75)
	_GUICtrlListView_SetColumnWidth($hListView, 2, 75)

	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	Global $B_DESCENDING[_GUICtrlListView_GetColumnCount($hListView)]

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()

EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
	$hWndListView = $hListView
	If Not IsHWnd($hListView) Then $hWndListView = GUICtrlGetHandle($hListView)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; Eine Spalte wurde angeklickt
					$tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam)
					_DebugPrint("$LVN_COLUMNCLICK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					_GUICtrlListView_SimpleSort($hWndListView, $B_DESCENDING, DllStructGetData($tInfo, "SubItem"))
					; Kein R&uuml;ckgabewert
				Case $LVN_KEYDOWN ; Eine Taste wurde gedr&uuml;ckt
					$tInfo = DllStructCreate($tagNMLVKEYDOWN, $ilParam)
					_DebugPrint("$LVN_KEYDOWN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->VKey:" & @TAB & DllStructGetData($tInfo, "VKey") & @LF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					; Kein R&uuml;ckgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_CLICK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein R&uuml;ckgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_DBLCLK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein R&uuml;ckgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_DebugPrint("$NM_KILLFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_RCLICK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					_DebugPrint("$NM_RDBLCLK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein R&uuml;ckgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedr&uuml;ckt
					_DebugPrint("$NM_RETURN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_DebugPrint("$NM_SETFOCUS" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint
