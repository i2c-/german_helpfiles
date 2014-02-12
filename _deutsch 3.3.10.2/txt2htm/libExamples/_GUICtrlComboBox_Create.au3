#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hCombo

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("(UDF) ComboBox: Erstellen", 400, 296)
	$hCombo = _GUICtrlComboBox_Create($hGUI, "", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($hCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Niederwertiges Wort
	$iCode = BitShift($iwParam, 16) ; H&ouml;herwertiges Wort
	Switch $hWndFrom
		Case $hCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Gesendet, wenn die Aufklappliste einer ComboBox geschlossen wurde
					_DebugPrint("$CBN_CLOSEUP" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_DBLCLK ; Gesendet, wenn der Benutzer einen Doppelklick auf einen String in der Aufklappliste einer ComboBox ausgef&uuml;hrt hat
					_DebugPrint("$CBN_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_DROPDOWN ; Gesendet, wenn die Aufklappliste einer ComboBox davor ist, sichtbar zu werden
					_DebugPrint("$CBN_DROPDOWN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_EDITCHANGE ; Gesendet, nachdem der Benutzer eine Aktion ausgef&uuml;hrt hat, die m&ouml;glicherweise den Text in dem Input-Control einer ComboBox ge&auml;ndert hat.
					_DebugPrint("$CBN_EDITCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_EDITUPDATE ; Gesendet, wenn das Input-Control einer ComboBox davor ist, ge&auml;nderten Text anzuzeigen.
					_DebugPrint("$CBN_EDITUPDATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_ERRSPACE ; Gesendet, wenn eine ComboBox den angeforderten Speicher nicht reservieren konnte
					_DebugPrint("$CBN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_KILLFOCUS ; Gesendet, wenn die ComboBox den Fokus verloren hat
					_DebugPrint("$CBN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELCHANGE ; Gesendet, wenn der Benutzer die Auswahl in der Aufklappliste einer ComboBox ver&auml;ndert hat
					_DebugPrint("$CBN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELENDCANCEL ; Gesendet, wenn der Benutzer ein Item ausw&auml;hlt, aber dann ein anderes Control ausw&auml;hlt oder das Dialogfenster schlie&szlig;t.
					_DebugPrint("$CBN_SELENDCANCEL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELENDOK ; Gesendet, wenn der Benutzer ein Item aus der Aufklappliste ausw&auml;hlt, oder ein Item ausw&auml;hlt und dann die Aufklappliste schlie&szlig;t.
					_DebugPrint("$CBN_SELENDOK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SETFOCUS ; Gesendet, wenn die ComboBox den Tastatur-Fokus empfangen hat
					_DebugPrint("$CBN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
