#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: Fokus setzen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 2, 4)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	_GUICtrlIpAddress_SetFocus($hIPAddress, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
