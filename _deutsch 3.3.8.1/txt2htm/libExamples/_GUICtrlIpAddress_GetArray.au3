#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hgui, $aIP[4] = [24, 168, 2, 128], $hIPAddress

	$hgui = GUICreate("IpAddress: IP Adresse ermitteln (Array)", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 2, 4, 125, 20)
	$iMemo = GUICtrlCreateEdit("", 2, 28, 396, 270, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_SetArray($hIPAddress, $aIP)

	$aIP = _GUICtrlIpAddress_GetArray($hIPAddress)

	MemoWrite("Feld 1 .....: " & $aIP[0])
	MemoWrite("Feld 2 .....: " & $aIP[1])
	MemoWrite("Feld 3 .....: " & $aIP[2])
	MemoWrite("Feld 4 .....: " & $aIP[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
