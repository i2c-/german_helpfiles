#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hFile, $tFile, $aTime

	; Erstellen der GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Erzeugen einer Test Datei und setzen der Dateizeit
	$hFile = _WinAPI_CreateFile(@ScriptDir & "\Test.xyz", 1)
	If $hFile = 0 Then _WinAPI_ShowError("Die Datei konnte nicht erstellt werden")
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	Local $pFile = DllStructGetPtr($tFile)
	_Date_Time_SetFileTime($hFile, $pFile, $pFile, $pFile)
	_WinAPI_CloseHandle($hFile)

	; Liest die Dateizeit
	$hFile = _WinAPI_CreateFile(@ScriptDir & "\Test.xyz", 2)
	If $hFile = 0 Then _WinAPI_ShowError("Die Datei konnte nicht ge&ouml;ffnet werden")
	$aTime = _Date_Time_GetFileTime($hFile)
	_WinAPI_CloseHandle($hFile)

	MemoWrite("Erstellt ..: " & _Date_Time_FileTimeToStr($aTime[0]))
	MemoWrite("Letzter Zugriff .: " & _Date_Time_FileTimeToStr($aTime[1]))
	MemoWrite("Letzte &Auml;nderung .: " & _Date_Time_FileTimeToStr($aTime[2]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	FileDelete(@ScriptDir & "\Test.xyz")

EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
