#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Test")
	Local $iX = _WinAPI_GetMousePosX()
	Local $iX2 = _WinAPI_GetMousePosX(True, $hwnd)
	Local $iY = _WinAPI_GetMousePosY()
	Local $iY2 = _WinAPI_GetMousePosY(True, $hwnd)

	MsgBox($MB_SYSTEMMODAL, "Mausposition: ", _
			"Bildschirmbezug: X = " & $iX & "  Y = " & $iY & @CRLF & @CRLF & _
			"Anwendungsbezug: X = " & $iX2 & "  Y = " & $iY2)
EndFunc   ;==>Example
