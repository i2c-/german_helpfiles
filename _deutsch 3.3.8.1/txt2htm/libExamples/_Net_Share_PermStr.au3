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

	; Ermitteln der Server und Freigabe Informationen
	$sServer = InputBox("Netzwerk Demo", "Server Namen eingeben:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Auflisten der freigegebenen Dateien auf dem Server
	$aInfo = _Net_Share_FileEnum($sServer)
	MemoWrite("Fehler ....................: " & @error)
	MemoWrite("Eintr&auml;ge lesen ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Ressource ID ................: " & $aInfo[$iI][0])
		MemoWrite("Ressource Benutzerrechte ....: " & _Net_Share_PermStr($aInfo[$iI][1]))
		MemoWrite("Ressource Sperren ...........: " & $aInfo[$iI][2])
		MemoWrite("Ressource Pfad ..............: " & $aInfo[$iI][3])
		MemoWrite("Ressource Benutzer ..........: " & $aInfo[$iI][4])
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
