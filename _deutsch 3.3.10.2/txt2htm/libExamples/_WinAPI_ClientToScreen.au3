#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Beispiel", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 100)
	DllStructSetData($tpoint, "Y", 160)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ClientToScreen($hwnd, $tpoint)
	MsgBox($MB_SYSTEMMODAL, "_WINAPI_ClientToScreen Beispiel", "Bildschirmkoordinaten des Punktes [100,160] im Anwendungsfenster: " & @CRLF & _
			"X: " & DllStructGetData($tpoint, "X") & @CRLF & _
			"Y: " & DllStructGetData($tpoint, "Y") & @CRLF)
EndFunc   ;==>Example
