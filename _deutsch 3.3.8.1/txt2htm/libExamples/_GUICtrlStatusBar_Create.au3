#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Status-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo, $MainGUI, $hStatus

Example1()
Example2()
Example3()
Example4()
Example5()
Example6()


Func Example1()

	Local $hGUI
	Local $aParts[3] = [75, 150, -1] ; Positionen der rechten Kante (Endposition) der Abschnitte

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 1)", 400, 300)

	;===============================================================================
	; Voreinstellung: nur 1 Abschnitt, ohne Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	;===============================================================================
	_GUICtrlStatusBar_SetParts($hStatus, $aParts) ; Abschnitte erst jetzt festlegen

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example1

Func Example2()

	Local $hGUI
	Local $aParts[3] = [75, 150, -1] ; Endpositionen der Abschnitte

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 2)", 400, 300)

	;===============================================================================
	; Nur die Abschnitte, keinen Text festlegen
	$hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts)
	;===============================================================================

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 3 Items," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example2

Func Example3()

	Local $hGUI
	Local $aText[3] = ["Linksb&uuml;ndig", @TAB & "Zentriert", @TAB & @TAB & "Rechtsb&uuml;ndig"] ; Abschnittstexte
	Local $aParts[3] = [100, 175, -1] ; Endpositionen der Abschnitte

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 3)", 400, 300)

	;===============================================================================
	; Legt die Abschnitte und die Texte fest
	$hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts, $aText)
	;===============================================================================

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 3 Items," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 3 Items," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example3

Func Example4()

	Local $hGUI
	Local $aText[3] = ["Linksb&uuml;ndig", @TAB & "Zentriert", @TAB & @TAB & "Rechtsb&uuml;ndig"] ; Abschnittstexte

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 4)", 400, 300)

	;===============================================================================
	; Erzeugt Abschnitte, deren Breite auf der &uuml;bergebenen Endposition des ersten Abschnitts basiert
	$hStatus = _GUICtrlStatusBar_Create($hGUI, 150, $aText)
	;===============================================================================

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als einzelnen Wert," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 3 Items," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example4

Func Example5()

	Local $hGUI
	Local $aText[3] = ["Linksb&uuml;ndig", @TAB & "Zentriert", @TAB & @TAB & "Rechtsb&uuml;ndig"] ; Abschnittstexte
	Local $aParts[2] = [100, 175] ; Endpositionen der Abschnitte

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Erzeugen (Beispiel 5)", 400, 300)


	;===============================================================================
	; Verwendet das l&auml;ngste &uuml;bergebene Array (in diesem Fall ist das Text-Array das l&auml;ngere)
	$hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts, $aText)
	;===============================================================================

	; Erstellt ein Memo-Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 2 Items," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 3 Items," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example5

Func Example6()

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
	GUISetState()
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 3 Items," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 2 Items," & @CRLF & _
			@TAB & "Breite von Abschnitt 1 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 0) & @CRLF & _
			@TAB & "Breite von Abschnitt 2 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 1) & @CRLF & _
			@TAB & "Breite von Abschnitt 3 ....: " & _GUICtrlStatusBar_GetWidth($hStatus, 2) & @CRLF & _
			@TAB & "Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($hStatus) & @CRLF & _
			@TAB & "Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($hStatus) & @CRLF & _
			@TAB & "Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $MainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example6

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
					_DebugPrint("$NM_CLICK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls ausgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_DBLCLK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RCLICK ; Die rechte Maustaste wurde innerhalb des Controls gedr&uuml;ckt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RCLICK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls ausgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RDBLCLK" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdr&uuml;ckt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $SBN_SIMPLEMODECHANGE ; &Auml;nderung des einfachen Modus (aufgrund eines $SB_SIMPLE-Ereignisses)
					_DebugPrint("$SBN_SIMPLEMODECHANGE" & @LF & "-->hWndFrom:" & @TAB & $hWndFrom & @LF & _
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
