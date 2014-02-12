#include <GuiComboBoxEx.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>

Global $hCombo

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Erstellen", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlComboBoxEx_AddString($hCombo, "Etwas mehr Text")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Eingef&uuml;gter Text", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hCombo
			Switch $iCode
				Case $CBEN_BEGINEDIT ; Gesendet, wenn der Benutzer die Aufklappliste aktiviert oder in das Input-Control des Controls klickt.
					_DebugPrint("$CBEN_BEGINEDIT" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					Return 0
				Case $CBEN_DELETEITEM
					_DebugPrint("$CBEN_DELETEITEM" & _GetComboBoxEx($ilParam))
					Return 0
				Case $CBEN_DRAGBEGINA, $CBEN_DRAGBEGINW
					$tInfo = DllStructCreate($tagNMCBEDRAGBEGIN, $ilParam)
					If DllStructGetData($tInfo, "ItemID") Then _DebugPrint("$CBEN_DRAGBEGIN" & _GetComboBoxEx($ilParam))
					_DebugPrint("$CBEN_DRAGBEGIN" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->ItemID:" & @TAB & DllStructGetData($tInfo, "ItemID") & @CRLF & _
							"-->Text:" & @TAB & DllStructGetData($tInfo, "Text"))
					; R&uuml;ckgabe auslassen
				Case $CBEN_ENDEDITA, $CBEN_ENDEDITW ; Gesendet, wenn der Benutzer eine Operation in dem Input-Control beendet hat oder ein Item aus der Aufklappliste des Controls ausgew&auml;hlt hat.
					$tInfo = DllStructCreate($tagNMCBEENDEDIT, $ilParam)
					_DebugPrint("$CBEN_ENDEDIT" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->fChanged:" & @TAB & DllStructGetData($tInfo, "fChanged") & @CRLF & _
							"-->NewSelection:" & @TAB & DllStructGetData($tInfo, "NewSelection") & @CRLF & _
							"-->Text:" & @TAB & DllStructGetData($tInfo, "Text") & @CRLF & _
							"-->Why:" & @TAB & DllStructGetData($tInfo, "Why"))
					Return False ; Akzeptiert die Benachrichtigung und erlaubt dem Control das gew&auml;hlte Item anzuzeigen
;~ 					Return True  ; Andernfalls
				Case $CBEN_GETDISPINFOA, $CBEN_GETDISPINFOW ; Gesendet, um Anzeigeinformationen &uuml;ber das Callback-Item abzurufen
					_DebugPrint("$CBEN_GETDISPINFO" & _GetComboBoxEx($ilParam))
					Return 0
				Case $CBEN_INSERTITEM
					$tInfo = DllStructCreate($tagNMCOMBOBOXEX, $ilParam)
					Local $tBuffer = DllStructCreate("wchar Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
					_DebugPrint("$CBEN_INSERTITEM" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
							"-->SelectedImage:" & @TAB & DllStructGetData($tInfo, "SelectedImage") & @CRLF & _
							"-->OverlayImage:" & @TAB & DllStructGetData($tInfo, "OverlayImage") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					Return 0
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _GetComboBoxEx($ilParam)
	Local $tInfo = DllStructCreate($tagNMCOMBOBOXEX, $ilParam)
	Local $aItem = _GUICtrlComboBoxEx_GetItem($hCombo, DllStructGetData($tInfo, "Item"))
	Return @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
			"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
			"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
			"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
			"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
			"-->Text:" & @TAB & $aItem[0] & @CRLF & _
			"-->TextMax:" & @TAB & $aItem[1] & @CRLF & _
			"-->Indent:" & @TAB & $aItem[2] & @CRLF & _
			"-->Image:" & @TAB & $aItem[3] & @CRLF & _
			"-->SelectedImage:" & @TAB & $aItem[4] & @CRLF & _
			"-->OverlayImage:" & @TAB & $aItem[5] & @CRLF & _
			"-->Param:" & @TAB & $aItem[6]
EndFunc   ;==>_GetComboBoxEx

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
