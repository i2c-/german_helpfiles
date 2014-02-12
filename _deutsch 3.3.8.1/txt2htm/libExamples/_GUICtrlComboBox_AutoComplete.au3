#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hCombo

_Main()

Func _Main()

	; Erstellt eine GUI
	GUICreate("ComboBox: Auto-Vervollst&auml;ndigen", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func _Edit_Changed()
	_GUICtrlComboBox_AutoComplete($hCombo)
EndFunc   ;==>_Edit_Changed

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndCombo
	If Not IsHWnd($hCombo) Then $hWndCombo = GUICtrlGetHandle($hCombo)
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
	$iCode = BitShift($iwParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $hCombo, $hWndCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Wird gesendet, wenn die ListBox der ComboBox geschlossen wurde
					_DebugPrint("$CBN_CLOSEUP" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_DBLCLK ; Wird gesendet, wenn der Benutzer einen Doppelklick auf einen String in der ListBox einer ComboBox ausf&uuml;hrt
					_DebugPrint("$CBN_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_DROPDOWN ; Wird gesendet, wenn die ListBox einer ComboBox sichtbar wird
					_DebugPrint("$CBN_DROPDOWN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_EDITCHANGE ; Wird gesendet, nachdem ein Benutzer eine Aktion durchgef&uuml;hrt hat, die den Text im Edit-Control der ComboBox ver&auml;ndert hat
					_DebugPrint("$CBN_EDITCHANGE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					_Edit_Changed()
					; Kein R&uuml;ckgabewert
				Case $CBN_EDITUPDATE ; Wird gesendet, wenn das Edit-Control der ComboBox ge&auml;nderten Text anzeigt
					_DebugPrint("$CBN_EDITUPDATE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_ERRSPACE ; Wird gesendet, wenn der ComboBox nicht genug Speicher zur Verf&uuml;gung gestellt wird, um die Anfrage zu bearbeiten
					_DebugPrint("$CBN_ERRSPACE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_KILLFOCUS ; Wird gesendet, wenn die ComboBox den Fokus verloren hat
					_DebugPrint("$CBN_KILLFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELCHANGE ; Wird gesendet, wenn der Benutzer die Auswahl in der ListBox einer ComboBox ver&auml;ndert hat
					_DebugPrint("$CBN_SELCHANGE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELENDCANCEL ; Wird gesendet, wenn der Benutzer ein Item ausw&auml;hlt und danach ein anderes Control ausw&auml;hlt oder die Dialog-Box schlie&szlig;t
					_DebugPrint("$CBN_SELENDCANCEL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SELENDOK ; Wird gesendet, wenn der Benutzer ein List-Item ausw&auml;hlt oder ein Item ausw&auml;hlt und dann die Liste schlie&szlig;t
					_DebugPrint("$CBN_SELENDOK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $CBN_SETFOCUS ; Wird gesendet, wenn die ComboBox den Tastatur-Fokus empf&auml;ngt
					_DebugPrint("$CBN_SETFOCUS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
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
