#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd
	$hwnd = GUICreate("Test")
	MsgBox(4096, "Anwendungsbereich", "Breite des Anwendungsbereichs: " & _WinAPI_GetClientWidth($hwnd))
EndFunc   ;==>_Main
