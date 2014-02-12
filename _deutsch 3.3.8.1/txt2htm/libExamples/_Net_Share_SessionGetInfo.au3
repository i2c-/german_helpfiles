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
	$sServer = InputBox("NetWork Demo", "Eingabe des Servernamens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Ermittelt die Sitzungs-Informationen
	$aInfo = _Net_Share_SessionGetInfo($sServer, @ComputerName, "Administrator")
	MemoWrite("Fehler ..........: " & @error)
	MemoWrite("Computername ..: " & $aInfo[0])
	MemoWrite("Benutzername ......: " & $aInfo[1])
	MemoWrite("Ge&ouml;ffnete Ressourcen .: " & $aInfo[2])
	MemoWrite("Aktive Zeit .: " & $aInfo[3])
	MemoWrite("Inaktive Zeit ...: " & $aInfo[4])
	MemoWrite("Art der Verbindung : " & $aInfo[5])
	MemoWrite("Art des Endger&auml;tes ....: " & $aInfo[6])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
