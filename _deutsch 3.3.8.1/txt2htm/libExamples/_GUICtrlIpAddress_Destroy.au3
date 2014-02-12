#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <WindowsConstants.au3>

$Debug_IP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die IPAddress-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: L&ouml;schen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10, 125, 30, $WS_THICKFRAME)
	GUISetState(@SW_SHOW)

	; IPAddress-Control l&ouml;schen
	MsgBox(4160, "Information", "IPAddress-Control l&ouml;schen")
	_GUICtrlIpAddress_Destroy($hIPAddress)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
