#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: IP-Adresse l&ouml;schen", 420, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Eingetragene IP-Adresse l&ouml;schen
	MsgBox($MB_SYSTEMMODAL, "Information", "IP-Adresse l&ouml;schen")
	_GUICtrlIpAddress_ClearAddress($hIPAddress)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
