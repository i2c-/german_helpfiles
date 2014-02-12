#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hgui, $hIPAddress, $hIPAddress2, $hIPAddress3

	$hgui = GUICreate("IpAddress: Setzen der Schrift", 400, 50)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10, 150, 30)
	$hIPAddress2 = _GUICtrlIpAddress_Create($hgui, 175, 10, 150, 30)
	$hIPAddress3 = _GUICtrlIpAddress_Create($hgui, 340, 10, 150, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")
	_GUICtrlIpAddress_SetFont($hIPAddress, "Times New Roman", 14, 800, True)
	_GUICtrlIpAddress_Set($hIPAddress2, "24.168.2.128")
	_GUICtrlIpAddress_SetFont($hIPAddress2, "Arial", 12, 300)
	_GUICtrlIpAddress_Set($hIPAddress3, "24.168.2.128")
	_GUICtrlIpAddress_SetFont($hIPAddress3, "Sans Serif", 12, 300)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
