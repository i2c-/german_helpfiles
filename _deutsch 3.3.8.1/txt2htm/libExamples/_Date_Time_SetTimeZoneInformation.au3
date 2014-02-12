#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

; Unter Vista mu&szlig; die Windows API "SetTimeZoneInformation" m&ouml;glicherweise von der Systemsicherheit ausgenommen werden

Global $iMemo

_Main()

Func _Main()
	Local $aOld, $aNew

	; Erstellt eine GUI
	GUICreate("Zeit", 400, 500)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 496, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Zeigt Infos &uuml;ber die aktuelle Zeitzone
	$aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Current")

	; Setzt neue Zeitzone
	If Not _Date_Time_SetTimeZoneInformation($aOld[1], "A3L CST", $aOld[3], $aOld[4], "A3L CDT", $aOld[6], $aOld[7]) Then
		MsgBox(4096, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf

	; Zeigt Infos &uuml;ber die neue Zeitzone
	$aNew = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aNew, "New")

	; Setzt auf originale Zeitzone zur&uuml;ck
	_Date_Time_SetTimeZoneInformation($aOld[1], $aOld[2], $aOld[3], $aOld[4], $aOld[5], $aOld[6], $aOld[7])

	; Zeigt Infos &uuml;ber die aktuelle Zeitzone
	$aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Reset")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Zeigt Details der Zeitzone an
Func ShowTimeZoneInformation(ByRef $aInfo, $comment)
	MemoWrite("******************* " & $comment & " *******************")
	MemoWrite("Ergebnis ...................: " & $aInfo[0])
	MemoWrite("Aktuelle Verschiebung ......: " & $aInfo[1])
	MemoWrite("Standardname ...............: " & $aInfo[2])
	MemoWrite("Standard Datum/Zeit ........: " & _Date_Time_SystemTimeToDateTimeStr($aInfo[3]))
	MemoWrite("Standard Verschiebung ......: " & $aInfo[4])
	MemoWrite("Sommerzeit Name ............: " & $aInfo[5])
	MemoWrite("Sommerzeit Datum/Zeit ......: " & _Date_Time_SystemTimeToDateTimeStr($aInfo[6]))
	MemoWrite("Sommerzeitverschiebung .....: " & $aInfo[7])
EndFunc   ;==>ShowTimeZoneInformation
