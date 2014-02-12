#include <Date.au3>
#include <WinAPI.au3>

; Unter Vista mu&szlig; die Windows API "SetSystemTimeAdjustment" m&ouml;glicherweise von der Systemsicherheit ausgenommen werden

_Main()

Func _Main()
	Local $aInfo

	; &Ouml;ffnen des Zeitdialogs, um die &Auml;nderungen zu verfolgen ;)
	Run("RunDll32.exe shell32.dll,Control_RunDLL timedate.cpl")
	WinWaitActive("[CLASS:#32770]")

	; Ermittelt die aktuellen Zeiteinstellungen
	$aInfo = _Date_Time_GetSystemTimeAdjustment()

	; Verlangsame die Systemuhr
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1] / 10, False) Then
		MsgBox(4096, "Fehler", "Die Systemzeit kann nicht gebremst werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	MsgBox(4096, "Information", "Bremse die Zeit", 2)
	Sleep(5000)

	; Beschleunige die Zeit
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1] * 10, False) Then
		MsgBox(4096, "Fehler", "Die Systemzeit kann nicht beschleunigt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
	EndIf
	MsgBox(4096, "Information", "Gib Gas", 2)

	Sleep(5000)

	; R&uuml;cksetzen der Zeiteinstellungen
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1], True) Then
		MsgBox(4096, "Fehler", "Die Systemzeit kann nicht wiederhergestellt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
	Else
		MsgBox(4096, "Information", "Systemzeit wiederhergestellt")
	EndIf

EndFunc   ;==>_Main
