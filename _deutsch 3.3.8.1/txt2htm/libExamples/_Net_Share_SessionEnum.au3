#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $sServer, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt die Server- und die Freigabe-Informationen
	$sServer = InputBox("NetWork Demo", "Eingabe des Server-Namens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Listet die Netzwerk-Sitzungen auf
	$aInfo = _Net_Share_SessionEnum($sServer, @ComputerName)
	MemoWrite("Fehler ..........: " & @error)
	MemoWrite("Gelesene Eintr&auml;ge ...: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Computernamen ..: " & $aInfo[$iI][0])
		MemoWrite("Benutzernamen.......: " & $aInfo[$iI][1])
		MemoWrite("Ge&ouml;ffnete Ressourcen .: " & $aInfo[$iI][2])
		MemoWrite("Aktive Zeit .: " & $aInfo[$iI][3])
		MemoWrite("Inaktive Zeit ...: " & $aInfo[$iI][4])
		MemoWrite("Art der Verbindung : " & $aInfo[$iI][5])
		MemoWrite("Art des Endger&auml;tes ....: " & $aInfo[$iI][6]) ???
		MemoWrite("&Uuml;bertragene Daten ......: " & $aInfo[$iI][7]) ???
		MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
