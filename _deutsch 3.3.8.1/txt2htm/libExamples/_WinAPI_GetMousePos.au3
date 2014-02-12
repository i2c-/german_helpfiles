#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd = GUICreate("Test")
	Local $tPoint = _WinAPI_GetMousePos()
	Local $tPoint2 = _WinAPI_GetMousePos(True, $hwnd)

	MsgBox(4096, "Mausposition: ", _
			"Bildschirmbezug: X = " & DllStructGetData($tPoint, "X") & "  Y = " & DllStructGetData($tPoint, "Y") & @LF & @LF & _
			"Anwendungsbezug: X = " & DllStructGetData($tPoint2, "X") & "  Y = " & DllStructGetData($tPoint2, "Y"))
EndFunc   ;==>_Main
