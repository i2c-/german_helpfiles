#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd
	$hwnd = GUICreate("Test")
	MsgBox($MB_SYSTEMMODAL, "Anwendungsbereich", "H&ouml;he des Anwendungsbereichs: " & _WinAPI_GetClientHeight($hwnd))
EndFunc   ;==>Example
