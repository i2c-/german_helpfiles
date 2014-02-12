#include <WinAPI.au3>

_Main()

Func _Main()
	Local $button
	GUICreate("Test")
	$button = GUICtrlCreateButton("testen", 0, 0)
	MsgBox(4096, "ID", "Identifizierer des angegebenen Controls: " & _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($button)))
EndFunc   ;==>_Main
