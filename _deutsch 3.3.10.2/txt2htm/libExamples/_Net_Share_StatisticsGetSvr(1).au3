#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $aInfo

	; Erstellt eine GUI
	GUICreate("_Net_Share_StatisticsGetSvr", 400, 300)

	; Erstellt ein Memo-Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt die Server-Statistiken
	$aInfo = _Net_Share_StatisticsGetSvr(@ComputerName)
	MemoWrite("Start der Statistik .........................: " & $aInfo[0])
	MemoWrite("Zeit der Datei&ouml;ffnung .......................: " & $aInfo[1])
	MemoWrite("Zeit der Ger&auml;te&ouml;ffnung ......................: " & $aInfo[2])
	MemoWrite("Gespeicherte Druckauftr&auml;ge ..................: " & $aInfo[3])
	MemoWrite("Start der Sitzung ...........................: " & $aInfo[4])
	MemoWrite("Sitzung unterbrochen ........................: " & $aInfo[5])
	MemoWrite("Sitzungsfehler ..............................: " & $aInfo[6])
	MemoWrite("Passwort-Verletzungen .......................: " & $aInfo[7])
	MemoWrite("Rechte-Fehler ...............................: " & $aInfo[8])
	MemoWrite("Server-System-Fehler ........................: " & $aInfo[9])
	MemoWrite("&Uuml;ber das Netzwerk gesendete Bytes ...........: " & $aInfo[10])
	MemoWrite("&Uuml;ber das Netzwerk empfangene Bytes ..........: " & $aInfo[11])
	MemoWrite("Durchschnittliche Antwortzeit des Servers ...: " & $aInfo[12])
	MemoWrite('"Req Buffer"-Fehler .........................: ' & $aInfo[13])
	MemoWrite('"Big Buffer"-Fehler .........................: ' & $aInfo[14])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
