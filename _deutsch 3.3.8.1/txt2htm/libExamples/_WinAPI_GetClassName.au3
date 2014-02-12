#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hwnd
	$hwnd = GUICreate("test")
	MsgBox(4096, "Ermittelt den Namen der Klasse", "Name der Klasse von " & $hwnd & ": " & _WinAPI_GetClassName($hwnd))
EndFunc   ;==>_Main
