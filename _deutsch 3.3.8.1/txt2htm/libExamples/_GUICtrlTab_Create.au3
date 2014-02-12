#include <GuiConstantsEx.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

$Debug_TAB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Tab-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hTab

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Tab-Control: Erstellen (UDF)", 400, 300)
	$hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

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
					_DebugPrint("$NM_CLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Der R&uuml;ckgabewert wird durch das Tab-Control ignoriert
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedr&uuml;ckt
					_DebugPrint("$NM_RCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_RDBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zur&uuml;ck ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RELEASEDCAPTURE ; Das Control wurde durch die Maus erfasst
					_DebugPrint("$NM_RELEASEDCAPTURE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
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
