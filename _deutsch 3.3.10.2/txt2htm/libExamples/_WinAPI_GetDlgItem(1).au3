#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $button
	$hwnd = GUICreate("Test")
	$button = GUICtrlCreateButton("Button", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Ermittelt das Handle des angegebenen Controls in einem Dialogfenster: " & _WinAPI_GetDlgItem($hwnd, $button))
EndFunc   ;==>Example
