#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <WindowsConstants.au3>

Global $hIPAddress

Example()

Func Example()
	Local $hgui

	$hgui = GUICreate("IpAddress: Erstellen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	Local $hWndFrom, $iCode, $tNMHDR
	Local $tInfo

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hIPAddress
			Switch $iCode
				Case $IPN_FIELDCHANGED ; Dies wird gesetzt, wenn der Benutzer ein Feld in dem Control &auml;ndert oder den Fokus von einem zum anderen Feld &auml;ndert
					$tInfo = DllStructCreate($tagNMIPADDRESS, $ilParam)
					_DebugPrint("$IPN_FIELDCHANGED" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->Field:" & @TAB & DllStructGetData($tInfo, "Field") & @CRLF & _
							"-->Value:" & @TAB & DllStructGetData($tInfo, "Value"))
					; Der R&uuml;ckgabewert wird ignoriert
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
