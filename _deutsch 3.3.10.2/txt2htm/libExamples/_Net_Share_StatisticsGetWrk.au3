#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 500, 650)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 496, 646, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die Verbindungsstatistik der Workstation
	$aInfo = _Net_Share_StatisticsGetWrk(@ComputerName)
	MemoWrite("===================== NetStatisticsGetWrk =====================")
	MemoWrite("Aufzeichnung begonnen .....................: " & $aInfo[0])
	MemoWrite("Bytes empfangen ...........................: " & $aInfo[1])
	MemoWrite("SMBs empfangen ............................: " & $aInfo[2])
	MemoWrite("Paging-I/O-Bytes ..........................: " & $aInfo[3])
	MemoWrite("Non-paging-I/O-Bytes ......................: " & $aInfo[4])
	MemoWrite("Cache-I/O-Bytes ...........................: " & $aInfo[5])
	MemoWrite("Disk-I/O-Bytes ............................: " & $aInfo[6])
	MemoWrite("Bytes gesendet ............................: " & $aInfo[7])
	MemoWrite("SMBs gesendet .............................: " & $aInfo[8])
	MemoWrite("Paging-I/O-Bytes ..........................: " & $aInfo[9])
	MemoWrite("Non-paging-I/O-Bytes ......................: " & $aInfo[10])
	MemoWrite("Cache-I/O-Bytes ...........................: " & $aInfo[11])
	MemoWrite("Disk-I/O-Bytes ............................: " & $aInfo[12])
	MemoWrite("Fehlgeschlagene Operationen begonnen ......: " & $aInfo[13])
	MemoWrite("Fehlgeschlagene Operationen abgeschlossen .: " & $aInfo[14])
	MemoWrite("Lesevorg&auml;nge ..............................: " & $aInfo[15])
	MemoWrite("Lesevorg&auml;nge mit wahlfreiem Zugriff........: " & $aInfo[16])
	MemoWrite("Leseanfragen gesendet .....................: " & $aInfo[17])
	MemoWrite("Leseanfragen (gro&szlig;) .......................: " & $aInfo[18])
	MemoWrite("Leseanfragen (klein) ......................: " & $aInfo[19])
	MemoWrite("Schreibvorg&auml;nge ...........................: " & $aInfo[20])
	MemoWrite("Schreibvorg&auml;nge mit wahlfreiem Zugriff.....: " & $aInfo[21])
	MemoWrite("Schreibanfragen gesendet ..................: " & $aInfo[22])
	MemoWrite("Schreibanfragen (gro&szlig;) ....................: " & $aInfo[23])
	MemoWrite("Schreibanfragen (klein) ...................: " & $aInfo[24])
	MemoWrite("Verweigerte Raw-Lesevorg&auml;nge ..............: " & $aInfo[25])
	MemoWrite("Verweigerte Raw-Schreibvorg&auml;nge ...........: " & $aInfo[26])
	MemoWrite("Netzwerkfehler ............................: " & $aInfo[27])
	MemoWrite("Verbindungssitzungen eingerichtet .........: " & $aInfo[28])
	MemoWrite("Gescheiterte Sitzungen ....................: " & $aInfo[29])
	MemoWrite("Missgl&uuml;ckte Verbindungen ..................: " & $aInfo[30])
	MemoWrite("PCNET Verbindungen ........................: " & $aInfo[31])
	MemoWrite("NetShare 20 Verbindungen ..................: " & $aInfo[32])
	MemoWrite("NetShare 21 Verbindungen ..................: " & $aInfo[33])
	MemoWrite("WinNT Verbindungen ........................: " & $aInfo[34])
	MemoWrite("Verbindungsabbr&uuml;che .......................: " & $aInfo[35])
	MemoWrite("Sitzungen abgelaufen ......................: " & $aInfo[36])
	MemoWrite("Verbindungen hergestellt ..................: " & $aInfo[37])
	MemoWrite("Verbindungen fehlgeschlagen ...............: " & $aInfo[38])
	MemoWrite("Unvollst&auml;ndige Anfragen ...................: " & $aInfo[39])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
