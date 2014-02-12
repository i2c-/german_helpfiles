#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: Bereich setzen", 300, 150)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Setzt den Bereich des ersten Feldes
	_GUICtrlIpAddress_SetRange($hIPAddress, 0, 198, 200)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
