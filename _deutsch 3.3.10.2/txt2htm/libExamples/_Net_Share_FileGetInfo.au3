#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $sServer, $aFile, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermitteln der Server- und Freigabeinformationen
	$sServer = InputBox("Netzwerk Demo", "Server Namen eingeben:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Auflisten der freigegebenen Dateien auf dem Server
	$aFile = _Net_Share_FileEnum($sServer)
	MemoWrite("Fehler ...................: " & @error)
	MemoWrite("Eintr&auml;ge lesen ............: " & $aFile[0][0])
	MemoWrite()

	; Informationen &uuml;ber jede (freigegebene|ge&ouml;ffnete?) Datei ermitteln (dasselbe wie $aFile info)
	For $iI = 1 To $aFile[0][0]
		$aInfo = _Net_Share_FileGetInfo($sServer, $aFile[$iI][0])
		MemoWrite("Fehler ...................: " & @error)
		MemoWrite("Datei Benutzerrechte .....: " & _Net_Share_PermStr($aInfo[1]))
		MemoWrite("Datei Sperren ............: " & $aInfo[2])
		MemoWrite("Datei Pfad ...............: " & $aInfo[3])
		MemoWrite("Datei Benutzer ...........: " & $aInfo[4])
		MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
