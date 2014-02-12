#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $tRect
	$hwnd = GUICreate("test")
	$tRect = _WinAPI_GetClientRect($hwnd)
	MsgBox($MB_SYSTEMMODAL, "Rechteck", _
			"Links.: " & DllStructGetData($tRect, "Left") & @CRLF & _
			"Rechts: " & DllStructGetData($tRect, "Right") & @CRLF & _
			"Oben..: " & DllStructGetData($tRect, "Top") & @CRLF & _
			"Unten.: " & DllStructGetData($tRect, "Bottom"))
EndFunc   ;==>Example
