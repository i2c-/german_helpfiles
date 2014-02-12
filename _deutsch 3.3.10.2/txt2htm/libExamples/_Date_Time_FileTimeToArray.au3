#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tFile, $aFile, $sFile

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Entschl&uuml;sseln der Datei Zeit
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	$aFile = _Date_Time_FileTimeToArray($tFile)
	$sFile = StringFormat("%02d/%02d/%04d %02d:%02d:%02d", $aFile[0], $aFile[1], $aFile[2], $aFile[3], $aFile[4], $aFile[5])
	MemoWrite("Momentane/s Zeit/Datum .: " & $sFile)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
