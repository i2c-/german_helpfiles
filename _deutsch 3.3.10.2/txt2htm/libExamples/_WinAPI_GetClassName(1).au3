#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd
	$hwnd = GUICreate("test")
	MsgBox($MB_SYSTEMMODAL, "Ermittelt den Namen der Klasse", "Name der Klasse von " & $hwnd & ": " & _WinAPI_GetClassName($hwnd))
EndFunc   ;==>Example
