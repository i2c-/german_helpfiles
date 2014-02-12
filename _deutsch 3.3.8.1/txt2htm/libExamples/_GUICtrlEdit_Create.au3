#include <GuiEdit.au3>
#include <WinAPI.au3> ; Verwendet f&uuml;r Lo/Hi word
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hEdit

_Example1()
_Example2()

Func _Example1()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Erstellen", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "Dies ist ein Test" & @CRLF & "Noch eine Zeile", 2, 2, 394, 268)
	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example1

Func _Example2()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Erstellen", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "", 2, 2, 394, 268)
	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	_GUICtrlEdit_SetText($hEdit, "Dies ist ein Test" & @CRLF & "Noch eine Zeile")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example2

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndEdit
	If Not IsHWnd($hEdit) Then $hWndEdit = GUICtrlGetHandle($hEdit)
	$hWndFrom = $ilParam
	$iIDFrom = _WinAPI_LoWord($iwParam)
	$iCode = _WinAPI_HiWord($iwParam)
	Switch $hWndFrom
		Case $hEdit, $hWndEdit
			Switch $iCode
				Case $EN_ALIGN_LTR_EC ; Gesendet, wenn der Benutzer die Textausrichtung im Input-Control zu Links nach Rechts gewechselt hat
					_DebugPrint("$EN_ALIGN_LTR_EC" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_ALIGN_RTL_EC ; Gesendet, wenn der Benutzer die Textausrichtung im Input-Control zu Rechts nach Links gewechselt hat
					_DebugPrint("$EN_ALIGN_RTL_EC" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_CHANGE ; Gesendet, wenn der Benutzer eine Aktion ausgef&uuml;hrt hat, die m&ouml;glicherweise Text im Input-Control ge&auml;ndert hat
					_DebugPrint("$EN_CHANGE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_ERRSPACE ; Gesendet, wenn ein Input-Control nicht genug Speicher reservieren konnte, um der Anforderung dessen zu entsprechen
					_DebugPrint("$EN_ERRSPACE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_HSCROLL ; Gesendet, wenn der Benutzer auf die horizontale Scrollbar des Input-Controls klickt
					_DebugPrint("$EN_HSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_KILLFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus verliert
					_DebugPrint("$EN_KILLFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_MAXTEXT ; Gesendet, wenn das aktuelle Einf&uuml;gen von Text die festgelegte Anzahl von Zeichen f&uuml;r das Input-Control &uuml;berschritten hat
					_DebugPrint("$EN_MAXTEXT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die Anzahl der einzuf&uuml;genden
					; Zeichen die Breite des Input-Controls &uuml;berschreitet.
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die gesamte Anzahl der Zeilen,
					; Die aus einer Texteinf&uuml;gung resultieren, die H&ouml;he des Input-Controls &uuml;berschreitet.

					; Kein R&uuml;ckgabewert
				Case $EN_SETFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus erh&auml;lt
					_DebugPrint("$EN_SETFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_UPDATE ; Gesendet, wenn ein Input-Control davor ist, sich zu neuzuzeichnen
					_DebugPrint("$EN_UPDATE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_VSCROLL ; Gesendet, wenn der Benutzer auf die vertikale Scrollbar des Input-Controls klickt oder wenn der Benutzer das Mausrad &uuml;ber dem Input-Control rollt
					_DebugPrint("$EN_VSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint
