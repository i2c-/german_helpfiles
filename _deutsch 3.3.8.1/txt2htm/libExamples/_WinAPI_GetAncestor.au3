#include <WinAPI.au3>
#include <WindowsConstants.au3>

_Main()

Func _Main()
	Local $hwnd, $hparent
	$hwnd = GUICreate("_WinAPI_GetAncestor")
	$hparent = _WinAPI_GetAncestor($hwnd, $GA_PARENT)
	MsgBox(4096, "Parent", "Ermittelt den Vorfahren von " & $hwnd & ": " & $hparent)
	MsgBox(4096, "Root", "Ermittelt den Vorfahren von " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOT))
	MsgBox(4096, "Root Owner", "Ermittelt den Vorfahren von " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOTOWNER))
EndFunc   ;==>_Main
