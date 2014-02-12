#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $sServer, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Frage nach Server- und Freigabename
	$sServer = InputBox("NetWork Demo", "Servername eintragen:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Gibt Informationen &uuml;ber die ge&ouml;ffnete Datei auf dem Server zur&uuml;ck.
	$aInfo = _Net_Share_FileEnum($sServer)
	MemoWrite("Fehler.... ..................: " & @error)
	MemoWrite("Anzahl der Eintr&auml;ge im Array : " & $aInfo[0][0])

	; Erzwingt, dass jede ge&ouml;ffnete Datei mit dem Namen "Test.txt" geschlossen wird
	For $iI = 1 To $aInfo[0][0]
		If StringInStr($aInfo[$iI][3], "Test.txt") > 0 Then
			_Net_Share_FileClose($sServer, $aInfo[$iI][0])
			MemoWrite("Datei geschlossen")
		EndIf
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
