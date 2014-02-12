#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

Global $iMemo, $MainGUI, $hStatus

Example()

Func Example()
	Local $hGUI
	Local $aText[2] = ["Linksb&uuml;ndig", @TAB & "Zentriert"] ; Abschnittstexte
	Local $aParts[3] = [100, 175, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 6)", 400, 300)

	;===============================================================================
	; Verwendet das l&auml;ngste &uuml;bergebene Array (in diesem Fall ist das Endpositions-Array das l&auml;ngere)
	$hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts, $aText)
	;===============================================================================

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 3 Items," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 2 Items," & @CRLF)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; R&auml;ndergr&ouml;&szlig;e ermitteln
	MemoWrite("Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus))
	MemoWrite("Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus))
	MemoWrite("Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Local $tinfo
	Switch $hWndFrom
		Case $hStatus
			Switch $iCode
				Case $NM_CLICK ; Die linke Maustaste wurde innerhalb des Controls gedr&uuml;ckt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_CLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls ausgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_DBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RCLICK ; Die rechte Maustaste wurde innerhalb des Controls gedr&uuml;ckt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls ausgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $SBN_SIMPLEMODECHANGE ; &Auml;nderung des einfachen Modus (aufgrund eines $SB_SIMPLE-Ereignisses)
					_DebugPrint("$SBN_SIMPLEMODECHANGE" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
