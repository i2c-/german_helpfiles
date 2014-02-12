#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd, $hparent
	$hwnd = GUICreate("_WinAPI_GetAncestor")
	$hparent = _WinAPI_GetAncestor($hwnd, $GA_PARENT)
	MsgBox($MB_SYSTEMMODAL, "Parent", "Ermittelt den Vorfahren von " & $hwnd & ": " & $hparent)
	MsgBox($MB_SYSTEMMODAL, "Root", "Ermittelt den Vorfahren von " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOT))
	MsgBox($MB_SYSTEMMODAL, "Root Owner", "Ermittelt den Vorfahren von " & $hparent & ": " & _WinAPI_GetAncestor($hwnd, $GA_ROOTOWNER))
EndFunc   ;==>Example
