#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <WindowsConstants.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hIPAddress

_Main()

Func _Main()
	Local $hgui

	$hgui = GUICreate("IpAddress: Erstellen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

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
					_DebugPrint("$IPN_FIELDCHANGED" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->Field:" & @TAB & DllStructGetData($tInfo, "Field") & @LF & _
							"-->Value:" & @TAB & DllStructGetData($tInfo, "Value"))
					; Der R&uuml;ckgabewert wird ignoriert
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
