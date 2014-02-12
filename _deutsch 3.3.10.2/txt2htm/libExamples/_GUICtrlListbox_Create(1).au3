#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hListBox

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("(UDF) ListBox: Erzeugen", 400, 296)
	$hListBox = _GUICtrlListBox_Create($hGUI, "String bei Erzeugung", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Hinzuf&uuml;gen von Items")

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; F&uuml;gt Dateien hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	_GUICtrlListBox_ResetContent($hListBox)
	_GUICtrlListBox_InitStorage($hListBox, 100, 4096)
	_GUICtrlListBox_Dir($hListBox, @WindowsDir & "\win*.exe")
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\notepad.exe")
	_GUICtrlListBox_Dir($hListBox, "", $DDL_DRIVES)
	_GUICtrlListBox_Dir($hListBox, "", $DDL_DRIVES, False)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndListBox
	If Not IsHWnd($hListBox) Then $hWndListBox = GUICtrlGetHandle($hListBox)
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Niederwertiges Wort (WORD)
	$iCode = BitShift($iwParam, 16) ; H&ouml;herwertiges Wort (WORD)

	Switch $hWndFrom
		Case $hListBox, $hWndListBox
			Switch $iCode
				Case $LBN_DBLCLK ; Wird gesendet, wenn der Benutzer einen Doppelklick auf einen String in einer ListBox ausf&uuml;hrt
					_DebugPrint("$LBN_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $LBN_ERRSPACE ; Wird gesendet, wenn eine ListBox nicht genug Speicher zugeteilt bekommt, um eine Anfrage entgegenzunehmen
					_DebugPrint("$LBN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $LBN_KILLFOCUS ; Wird gesendet, wenn eine ListBox den Tastatur-Fokus verliert
					_DebugPrint("$LBN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $LBN_SELCANCEL ; Wird gesendet, wenn der Benutzer die Auswahl in einer ListBox abbricht
					_DebugPrint("$LBN_SELCANCEL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $LBN_SELCHANGE ; Wird gesendet, wenn die Auswahl in einer ListBox ge&auml;ndert wurde
					_DebugPrint("$LBN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $LBN_SETFOCUS ; Wird gesendet, wenn eine Listbox den Tastatur-Fokus erh&auml;lt
					_DebugPrint("$LBN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	; Die internen Standard Autoit3-Messages-Befehle werden fortgesetzt.
	; Die ganze Zeile kann auch weggelassen werden.
	; !!! Aber wird nur 'Return' (ohne R&uuml;ckgabewert) verwendet, so
	; Werden sp&auml;tere Standard Autoit3-Messages-Befehle nicht mehr verarbeitet !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text)
	$s_text = StringReplace($s_text, @CRLF, @CRLF & "-->")
	ConsoleWrite("!===========================================================" & @CRLF & _
			"+===========================================================" & @CRLF & _
			"-->" & $s_text & @CRLF & _
			"+===========================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
