#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hDTP

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("DateTimePick: Erstellen (UDF)", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo, $tBuffer, $tBuffer2

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hDTP
			Switch $iCode
				Case $DTN_CLOSEUP ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender schlie&szlig;t.
					_DebugPrint("$DTN_CLOSEUP" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Der R&uuml;ckgabewert der Anzeige wird nicht benutzt.
				Case $DTN_DATETIMECHANGE ; Gesendet durch ein DTP-Control, wenn eine Ver&auml;nderung auftritt.
					$tInfo = DllStructCreate($tagNMDATETIMECHANGE, $ilParam)
					_DebugPrint("$DTN_DATETIMECHANGE" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->Flag:" & @TAB & DllStructGetData($tInfo, "Flag") & @LF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @LF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @LF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @LF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @LF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @LF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @LF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @LF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond"))
					Return 0
				Case $DTN_DROPDOWN ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender aktiviert.
					_DebugPrint("$DTN_DROPDOWN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Der R&uuml;ckgabewert der Anzeige wird nicht benutzt.
				Case $DTN_FORMAT ; Gesendet durch ein DTP-Control, wenn Text angefordert wird um in einem Callback Feld dargestellt zu werden.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMAT, $ilParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					$tBuffer2 = DllStructCreate("char Display[64]", DllStructGetData($tInfo, "pDisplay"))
					_DebugPrint("$DTN_FORMAT" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @LF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @LF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @LF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @LF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @LF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @LF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @LF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @LF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond") & @LF & _
							"-->Display:" & @TAB & DllStructGetData($tBuffer2, "Display"))
					Return 0
				Case $DTN_FORMATQUERY ; Gesendet durch ein DTP-Control, um die maximal erlaubte Gr&ouml;&szlig;e des Strings zu ermitteln, der in einem Callback Feld dargestellt werden soll.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMATQUERY, $ilParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					_DebugPrint("$DTN_FORMATQUERY" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @LF & _
							"-->SizeX:" & @TAB & DllStructGetData($tInfo, "SizeX") & @LF & _
							"-->SizeY:" & @TAB & DllStructGetData($tBuffer2, "SizeY"))
					DllStructSetData($tInfo, "SizeX", 64)
					DllStructSetData($tInfo, "SizeY", 10)
					Return 0
				Case $DTN_USERSTRING ; Gesendet durch ein DTP-Control, wenn ein Benutzer mit dem bearbeiten eines Strings in dem Control fertig ist.
					$tInfo = DllStructCreate($tagNMDATETIMESTRING, $ilParam)
					$tBuffer = DllStructCreate("char UserString[128]", DllStructGetData($tInfo, "UserString"))
					_DebugPrint("$DTN_USERSTRING" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->UserString:" & @TAB & DllStructGetData($tBuffer, "UserString") & @LF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @LF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @LF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @LF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @LF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @LF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @LF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @LF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond") & @LF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					Return 0
				Case $DTN_WMKEYDOWN ; Gesendet durch ein DTP-Control, wenn der Benutzer etwas in ein Callback Feld eintr&auml;gt.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMATQUERY, $ilParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					_DebugPrint("$DTN_WMKEYDOWN" & @LF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @LF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @LF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @LF & _
							"-->VirtKey:" & @TAB & DllStructGetData($tInfo, "VirtKey") & @LF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @LF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @LF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @LF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @LF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @LF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @LF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @LF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @LF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond"))
					Return 0
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
