#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd, $hDC
	$hwnd = GUICreate("Test")
	$hDC = _WinAPI_GetDC($hwnd)
	MsgBox(4096, "Handle", "Anzeigeger&auml;t: " & $hDC)
	_WinAPI_ReleaseDC($hwnd, $hDC)
EndFunc   ;==>_Main
