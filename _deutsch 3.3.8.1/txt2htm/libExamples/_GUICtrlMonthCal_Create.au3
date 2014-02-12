#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hMonthCal

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("MonthCal: Erzeugen", 400, 300)
	$hMonthCal = _GUICtrlMonthCal_Create($hGUI, 4, 4, $WS_BORDER)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hMonthCal
			Switch $iCode
				Case $MCN_GETDAYSTATE ; Wird vom MonthCal-Control gesendet, um Informationen zu erhalten, wie individuelle Tage angezeigt werden sollen
					$tInfo = DllStructCreate($tagNMDAYSTATE, $ilParam)
					_DebugPrint("$MCN_GETDAYSTATE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDVon:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->Jahr:" & @TAB & DllStructGetData($tInfo, "Year") & @LF & _
							"-->Monat:" & @TAB & DllStructGetData($tInfo, "Month") & @LF & _
							"-->TdW:" & @TAB & DllStructGetData($tInfo, "DOW") & @LF & _
							"-->Tag:" & @TAB & DllStructGetData($tInfo, "Day") & @LF & _
							"-->Stunde:" & @TAB & DllStructGetData($tInfo, "Hour") & @LF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @LF & _
							"-->Sekunde:" & @TAB & DllStructGetData($tInfo, "Second") & @LF & _
							"-->Millisek.:" & @TAB & DllStructGetData($tInfo, "MSecond") & @LF & _
							"-->TagStatus:" & @TAB & DllStructGetData($tInfo, "DayState") & @LF & _
							"-->pTagStatus:" & @TAB & DllStructGetData($tInfo, "pDayState"))
					; Adresse eines Array's von MONTHDAYSTATE (DWORD Bit-Feld, welches den Status jedes Monatstages enth&auml;lt)
					; Jedes Bit (1 bis 31) repr&auml;sentiert den Status eines Tages im Monat. Ist ein Bit True, wird der Tag
					; In Fettdruck angezeigt; andererseits wird er ohne Hervorhebungen angezeigt
					; Kein R&uuml;ckgabewert
				Case $MCN_SELCHANGE ; Wird vom MonthCal-Control gesendet, wenn sich das aktuell gew&auml;hlte Datum oder der Datumsbereich &auml;ndert
					$tInfo = DllStructCreate($tagNMSELCHANGE, $ilParam)
					_DebugPrint("$MCN_SELCHANGE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDVon:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->AnfJahr:" & @TAB & DllStructGetData($tInfo, "BegYear") & @LF & _
							"-->AnfMonat:" & @TAB & DllStructGetData($tInfo, "BegMonth") & @LF & _
							"-->AnfTdW:" & @TAB & DllStructGetData($tInfo, "BegDOW") & @LF & _
							"-->AnfTag:" & @TAB & DllStructGetData($tInfo, "BegDay") & @LF & _
							"-->AnfStunde:" & @TAB & DllStructGetData($tInfo, "BegHour") & @LF & _
							"-->AnfMinute:" & @TAB & DllStructGetData($tInfo, "BegMinute") & @LF & _
							"-->AnfSekunde:" & @TAB & DllStructGetData($tInfo, "BegSecond") & @LF & _
							"-->AnfMilliSek.:" & @TAB & DllStructGetData($tInfo, "BegMSeconds") & @LF & _
							"-->EndeJahr:" & @TAB & DllStructGetData($tInfo, "EndYear") & @LF & _
							"-->EndeMonat:" & @TAB & DllStructGetData($tInfo, "EndMonth") & @LF & _
							"-->EndeTdW:" & @TAB & DllStructGetData($tInfo, "EndDOW") & @LF & _
							"-->EndeTag:" & @TAB & DllStructGetData($tInfo, "EndDay") & @LF & _
							"-->EndeStunde:" & @TAB & DllStructGetData($tInfo, "EndHour") & @LF & _
							"-->EndeMinute:" & @TAB & DllStructGetData($tInfo, "EndMinute") & @LF & _
							"-->EndeSekunde:" & @TAB & DllStructGetData($tInfo, "EndSecond") & @LF & _
							"-->EndeMilliSek.:" & @TAB & DllStructGetData($tInfo, "EndMSeconds"))
					; Kein R&uuml;ckgabewert
				Case $MCN_SELECT ; Wird vom MonthCal-Control gesendet, wenn der Benutzer ein spezielles Datum innerhalb des MonthCal-Control w&auml;hlt
					$tInfo = DllStructCreate($tagNMSELCHANGE, $ilParam)
					_DebugPrint("$MCN_SELECT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDVon:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->AnfJahr:" & @TAB & DllStructGetData($tInfo, "BegYear") & @LF & _
							"-->AnfMonat:" & @TAB & DllStructGetData($tInfo, "BegMonth") & @LF & _
							"-->AnfTdW:" & @TAB & DllStructGetData($tInfo, "BegDOW") & @LF & _
							"-->AnfTag:" & @TAB & DllStructGetData($tInfo, "BegDay") & @LF & _
							"-->AnfStunde:" & @TAB & DllStructGetData($tInfo, "BegHour") & @LF & _
							"-->AnfMinute:" & @TAB & DllStructGetData($tInfo, "BegMinute") & @LF & _
							"-->AnfSecond:" & @TAB & DllStructGetData($tInfo, "BegSecond") & @LF & _
							"-->AnfMilliSek.:" & @TAB & DllStructGetData($tInfo, "BegMSeconds") & @LF & _
							"-->EndeJahr:" & @TAB & DllStructGetData($tInfo, "EndYear") & @LF & _
							"-->EndeMonat:" & @TAB & DllStructGetData($tInfo, "EndMonth") & @LF & _
							"-->EndeTdW:" & @TAB & DllStructGetData($tInfo, "EndDOW") & @LF & _
							"-->EndeTag:" & @TAB & DllStructGetData($tInfo, "EndDay") & @LF & _
							"-->EndeStunde:" & @TAB & DllStructGetData($tInfo, "EndHour") & @LF & _
							"-->EndeMinute:" & @TAB & DllStructGetData($tInfo, "EndMinute") & @LF & _
							"-->EndeSekunde:" & @TAB & DllStructGetData($tInfo, "EndSecond") & @LF & _
							"-->EndeMilliSek.:" & @TAB & DllStructGetData($tInfo, "EndMSeconds"))
					; Kein R&uuml;ckgabewert
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
