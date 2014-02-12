#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hgui, $tIP = DllStructCreate($tagGetIPAddress), $aIP[4] = [24, 168, 2, 128], $hIPAddress

	$hgui = GUICreate("IpAddress: IP Adresse ermitteln", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 2, 4, 125, 20)
	$iMemo = GUICtrlCreateEdit("", 2, 28, 396, 270, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	For $x = 0 To 3
		DllStructSetData($tIP, "Field" & $x + 1, $aIP[$x])
	Next

	_GUICtrlIpAddress_SetEx($hIPAddress, $tIP)

	$tIP = _GUICtrlIpAddress_GetEx($hIPAddress)

	For $x = 0 To 3
		MemoWrite("Feld " & $x + 1 & " .....: " & DllStructGetData($tIP, "Field" & $x + 1))
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
