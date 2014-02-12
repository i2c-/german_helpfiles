#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd
	$hwnd = GUICreate("Test")
	MsgBox($MB_SYSTEMMODAL, "Anwendungsbereich", "Breite des Anwendungsbereichs: " & _WinAPI_GetClientWidth($hwnd))
EndFunc   ;==>Example
