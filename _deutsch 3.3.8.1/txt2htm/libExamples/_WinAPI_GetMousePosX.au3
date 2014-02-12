#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd = GUICreate("Test")
	Local $iX = _WinAPI_GetMousePosX()
	Local $iX2 = _WinAPI_GetMousePosX(True, $hwnd)
	Local $iY = _WinAPI_GetMousePosY()
	Local $iY2 = _WinAPI_GetMousePosY(True, $hwnd)

	MsgBox(4096, "Mausposition: ", _
			"Bildschirmbezug: X = " & $iX & "  Y = " & $iY & @LF & @LF & _
			"Anwendungsbezug: X = " & $iX2 & "  Y = " & $iY2)
EndFunc   ;==>_Main
