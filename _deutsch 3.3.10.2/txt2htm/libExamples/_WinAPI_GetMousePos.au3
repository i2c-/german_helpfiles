#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Test")
	Local $tPoint = _WinAPI_GetMousePos()
	Local $tPoint2 = _WinAPI_GetMousePos(True, $hwnd)

	MsgBox($MB_SYSTEMMODAL, "Mausposition: ", _
			"Bildschirmbezug: X = " & DllStructGetData($tPoint, "X") & "  Y = " & DllStructGetData($tPoint, "Y") & @CRLF & @CRLF & _
			"Anwendungsbezug: X = " & DllStructGetData($tPoint2, "X") & "  Y = " & DllStructGetData($tPoint2, "Y"))
EndFunc   ;==>Example
