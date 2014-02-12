#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd, $tRect
	$hwnd = GUICreate("test")
	$tRect = _WinAPI_GetClientRect($hwnd)
	MsgBox(4096, "Rechteck", _
			"Links.: " & DllStructGetData($tRect, "Left") & @LF & _
			"Rechts: " & DllStructGetData($tRect, "Right") & @LF & _
			"Oben..: " & DllStructGetData($tRect, "Top") & @LF & _
			"Unten.: " & DllStructGetData($tRect, "Bottom"))
EndFunc   ;==>_Main
