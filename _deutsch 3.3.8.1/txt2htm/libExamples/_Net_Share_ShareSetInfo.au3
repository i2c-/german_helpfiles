#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $aInfo
	Local Const $sShareName = "AutoIt Share"

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Nachsehen, ob die Freigabe existiert
	If _Net_Share_ShareCheck(@ComputerName, $sShareName) = -1 Then
		; Erstellt eine Freigabe auf dem lokalen Computer
		_Net_Share_ShareAdd(@ComputerName, $sShareName, 0, "C:\", "AutoIt Share Comment")
		If @error Then MsgBox(4096, "Information", "Freigabe erzeugt einen Fehler : " & @error)
		MemoWrite("Freigabe hinzugef&uuml;gt")
	Else
		MemoWrite("Freigabe existiert")
	EndIf

	; &Auml;ndern der Freigabe Informationen
	_Net_Share_ShareSetInfo(@ComputerName, $sShareName, "Neuer Kommentar", 4)

	; Zeigt die Informationen &uuml;ber die hinzugef&uuml;gte Freigabe
	$aInfo = _Net_Share_ShareGetInfo(@ComputerName, $sShareName)
	MemoWrite("Freigabenamen ..............: " & $aInfo[0])
	MemoWrite("Art der Freigabe ...............: " & _Net_Share_ResourceStr($aInfo[1]))
	MemoWrite("Kommentar der Freigabe.................: " & $aInfo[2])
	MemoWrite("Rechte der Freigabe .............: " & _Net_Share_PermStr($aInfo[3]))
	MemoWrite("Maximale Verbindungen zu der Freigabe .....: " & $aInfo[4])
	MemoWrite("Anzahl der momentanen Verbindungen  .....: " & $aInfo[5])
	MemoWrite("Lokaler Pfad der  Freigabe ..............: " & $aInfo[6])
	MemoWrite("Passwort der Freigabe................: " & $aInfo[7])

	; L&ouml;scht die Freigabe
	_Net_Share_ShareDel(@ComputerName, $sShareName)
	If @error Then MsgBox(4096, "Information", "Fehler beim l&ouml;schen der Freigabe : " & @error)
	MemoWrite("Freigabe gel&ouml;scht")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
