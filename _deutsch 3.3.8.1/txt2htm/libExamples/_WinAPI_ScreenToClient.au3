#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd = GUICreate("Beispiel", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 641)
	DllStructSetData($tpoint, "Y", 459)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ScreenToClient($hwnd, $tpoint)
	MsgBox(0, "_WINAPI_ClientToScreen-Beispiel", "Die Bildschirmkoordinaten [x = 641, y = 459]" & @LF & _
			"entsprechen folgender Position im Client-Bereich:" & @LF & @LF & _
			@TAB & @TAB & "X: " & DllStructGetData($tpoint, "X") & @LF & _
			@TAB & @TAB & "Y: " & DllStructGetData($tpoint, "Y") & @LF)
EndFunc   ;==>_Main
