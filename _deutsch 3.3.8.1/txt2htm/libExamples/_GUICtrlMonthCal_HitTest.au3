#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hMonthCal, $iMemo, $hGUI

_Main()

Func _Main()

	; Erstellt eine GUI
	$hGUI = GUICreate("MonthCal: Git Test", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				DoHitTest()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>_Main

; Hit Test durchf&uuml;hren
Func DoHitTest()
	Local $tHit

	$tHit = _GUICtrlMonthCal_HitTest($hMonthCal, _WinAPI_GetMousePosX(True, $hGUI), _WinAPI_GetMousePosY(True, $hGUI))
	If BitAND(DllStructGetData($tHit, "Hit"), $MCHT_CALENDARDATE) <> 0 Then
		MemoWrite("Date: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tHit, "Month"), _
				DllStructGetData($tHit, "Day"), _
				DllStructGetData($tHit, "Year")))
	EndIf
EndFunc   ;==>DoHitTest

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
