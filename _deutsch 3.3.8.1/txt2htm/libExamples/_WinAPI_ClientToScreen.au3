#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd = GUICreate("Beispiel", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 100)
	DllStructSetData($tpoint, "Y", 160)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ClientToScreen($hwnd, $tpoint)
	MsgBox(0, "_WINAPI_ClientToScreen Beispiel", "Bildschirmkoordinaten des Punktes [100,160] im Anwendungsfenster: " & @LF & _
			"X: " & DllStructGetData($tpoint, "X") & @LF & _
			"Y: " & DllStructGetData($tpoint, "Y") & @LF)
EndFunc   ;==>_Main
