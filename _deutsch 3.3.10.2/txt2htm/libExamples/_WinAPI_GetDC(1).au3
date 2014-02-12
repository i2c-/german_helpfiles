#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $hDC
	$hwnd = GUICreate("Test")
	$hDC = _WinAPI_GetDC($hwnd)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Anzeigeger&auml;t: " & $hDC)
	_WinAPI_ReleaseDC($hwnd, $hDC)
EndFunc   ;==>Example
