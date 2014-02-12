#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hgui, $hIPAddress

	$hgui = GUICreate("IpAddress: L&ouml;schen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10, 125, 30, $WS_THICKFRAME)
	GUISetState(@SW_SHOW)

	; IPAddress-Control l&ouml;schen
	MsgBox($MB_SYSTEMMODAL, "Information", "IPAddress-Control l&ouml;schen")
	_GUICtrlIpAddress_Destroy($hIPAddress)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
