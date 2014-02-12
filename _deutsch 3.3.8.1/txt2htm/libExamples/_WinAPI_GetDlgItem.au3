#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd, $button
	$hwnd = GUICreate("Test")
	$button = GUICtrlCreateButton("Button", 0, 0)
	MsgBox(4096, "Handle", "Ermittelt das Handle des angegebenen Controls in einem Dialogfenster: " & _WinAPI_GetDlgItem($hwnd, $button))
EndFunc   ;==>_Main
