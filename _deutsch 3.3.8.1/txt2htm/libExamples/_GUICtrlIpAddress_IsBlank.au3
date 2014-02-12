#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: Ermittelt ob alle Felder leer sind", 450, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 2, 4)
	$iMemo = GUICtrlCreateEdit("", 2, 28, 396, 270, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Pr&uuml;fen, ob die IP-Adresse leer ist
	MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	Sleep(1000)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Pr&uuml;fen, ob die IP-Adresse leer ist
	MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
