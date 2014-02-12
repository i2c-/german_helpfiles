#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd
	$hwnd = GUICreate("Test")
	MsgBox(4096, "Anwendungsbereich", "H&ouml;he des Anwendungsbereichs: " & _WinAPI_GetClientHeight($hwnd))
EndFunc   ;==>_Main
