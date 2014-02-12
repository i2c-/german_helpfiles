#include <GuiConstantsEx.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

Global $hTab

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Tab-Control: Erstellen (UDF)", 400, 300)
	$hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTab
	$hWndTab = $hTab
	If Not IsHWnd($hTab) Then $hWndTab = GUICtrlGetHandle($hTab)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTab
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat die linke Maustaste innerhalb des Controls gedr&uuml;ckt
					_DebugPrint("$NM_CLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Der R&uuml;ckgabewert wird durch das Tab-Control ignoriert
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedr&uuml;ckt
					_DebugPrint("$NM_RCLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RELEASEDCAPTURE ; Das Control wurde durch die Maus erfasst
					_DebugPrint("$NM_RELEASEDCAPTURE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
