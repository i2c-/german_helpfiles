#include <GuiEdit.au3>
#include <WinAPI.au3> ; verwendet f&uuml;r Lo/Hi word
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>

Global $hEdit

_Example1()

Func _Example1()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Erstellen", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "Dies ist ein Test" & @CRLF & "Noch eine Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example1

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
					_DebugPrint("$EN_ALIGN_LTR_EC" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_ALIGN_RTL_EC ; Gesendet, wenn der Benutzer die Textausrichtung im Input-Control zu Rechts nach Links gewechselt hat
					_DebugPrint("$EN_ALIGN_RTL_EC" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_CHANGE ; Gesendet, wenn der Benutzer eine Aktion ausgef&uuml;hrt hat, die m&ouml;glicherweise Text im Input-Control ge&auml;ndert hat
					_DebugPrint("$EN_CHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_ERRSPACE ; Gesendet, wenn ein Input-Control nicht genug Speicher reservieren konnte, um der Anforderung dessen zu entsprechen
					_DebugPrint("$EN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_HSCROLL ; Gesendet, wenn der Benutzer auf die horizontale Scrollbar des Input-Controls klickt
					_DebugPrint("$EN_HSCROLL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_KILLFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus verliert
					_DebugPrint("$EN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_MAXTEXT ; Gesendet, wenn das aktuelle Einf&uuml;gen von Text die festgelegte Anzahl von Zeichen f&uuml;r das Input-Control &uuml;berschritten hat
					_DebugPrint("$EN_MAXTEXT" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die Anzahl der einzuf&uuml;genden
					; Zeichen die Breite des Input-Controls &uuml;berschreitet.
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die gesamte Anzahl der Zeilen,
					; Die aus einer Texteinf&uuml;gung resultieren, die H&ouml;he des Input-Controls &uuml;berschreitet.

					; Kein R&uuml;ckgabewert
				Case $EN_SETFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus erh&auml;lt
					_DebugPrint("$EN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_UPDATE ; Gesendet, wenn ein Input-Control davor ist, sich zu neuzuzeichnen
					_DebugPrint("$EN_UPDATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $EN_VSCROLL ; Gesendet, wenn der Benutzer auf die vertikale Scrollbar des Input-Controls klickt oder wenn der Benutzer das Mausrad &uuml;ber dem Input-Control rollt
					_DebugPrint("$EN_VSCROLL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
