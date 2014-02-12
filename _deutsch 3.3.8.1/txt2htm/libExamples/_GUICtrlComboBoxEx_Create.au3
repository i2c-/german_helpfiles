#include <GuiComboBoxEx.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hCombo

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Erstellen", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlComboBoxEx_AddString($hCombo, "Etwas mehr Text")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Eingef&uuml;gter Text", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

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
					_DebugPrint("$CBEN_BEGINEDIT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					Return 0
				Case $CBEN_DELETEITEM
					_DebugPrint("$CBEN_DELETEITEM" & _GetComboBoxEx($ilParam))
					Return 0
				Case $CBEN_DRAGBEGINA, $CBEN_DRAGBEGINW
					$tInfo = DllStructCreate($tagNMCBEDRAGBEGIN, $ilParam)
					If DllStructGetData($tInfo, "ItemID") Then _DebugPrint("$CBEN_DRAGBEGIN" & _GetComboBoxEx($ilParam))
					_DebugPrint("$CBEN_DRAGBEGIN" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->ItemID:" & @TAB & DllStructGetData($tInfo, "ItemID") & @LF & _
							"-->Text:" & @TAB & DllStructGetData($tInfo, "Text"))
					; R&uuml;ckgabe auslassen
				Case $CBEN_ENDEDITA, $CBEN_ENDEDITW ; Gesendet, wenn der Benutzer eine Operation in dem Input-Control beendet hat oder ein Item aus der Aufklappliste des Controls ausgew&auml;hlt hat.
					$tInfo = DllStructCreate($tagNMCBEENDEDIT, $ilParam)
					_DebugPrint("$CBEN_ENDEDIT" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->fChanged:" & @TAB & DllStructGetData($tInfo, "fChanged") & @LF & _
							"-->NewSelection:" & @TAB & DllStructGetData($tInfo, "NewSelection") & @LF & _
							"-->Text:" & @TAB & DllStructGetData($tInfo, "Text") & @LF & _
							"-->Why:" & @TAB & DllStructGetData($tInfo, "Why"))
					Return False ; Akzeptiert die Benachrichtigung und erlaubt dem Control das gew&auml;hlte Item anzuzeigen
;~ 					Return True  ; Andernfalls
				Case $CBEN_GETDISPINFOA, $CBEN_GETDISPINFOW ; Gesendet, um Anzeigeinformationen &uuml;ber das Callback-Item abzurufen
					_DebugPrint("$CBEN_GETDISPINFO" & _GetComboBoxEx($ilParam))
					Return 0
				Case $CBEN_INSERTITEM
					$tInfo = DllStructCreate($tagNMCOMBOBOXEX, $ilParam)
					Local $tBuffer = DllStructCreate("wchar Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
					_DebugPrint("$CBEN_INSERTITEM" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF & _
							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF & _
							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF & _
							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF & _
							"-->SelectedImage:" & @TAB & DllStructGetData($tInfo, "SelectedImage") & @LF & _
							"-->OverlayImage:" & @TAB & DllStructGetData($tInfo, "OverlayImage") & @LF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					Return 0
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _GetComboBoxEx($ilParam)
	Local $tInfo = DllStructCreate($tagNMCOMBOBOXEX, $ilParam)
	Local $aItem = _GUICtrlComboBoxEx_GetItem($hCombo, DllStructGetData($tInfo, "Item"))
	Return @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
			"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
			"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
			"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF & _
			"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF & _
			"-->Text:" & @TAB & $aItem[0] & @LF & _
			"-->TextMax:" & @TAB & $aItem[1] & @LF & _
			"-->Indent:" & @TAB & $aItem[2] & @LF & _
			"-->Image:" & @TAB & $aItem[3] & @LF & _
			"-->SelectedImage:" & @TAB & $aItem[4] & @LF & _
			"-->OverlayImage:" & @TAB & $aItem[5] & @LF & _
			"-->Param:" & @TAB & $aItem[6]
EndFunc   ;==>_GetComboBoxEx

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint
