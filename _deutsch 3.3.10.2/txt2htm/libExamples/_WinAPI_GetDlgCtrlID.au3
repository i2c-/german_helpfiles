#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $button
	GUICreate("Test")
	$button = GUICtrlCreateButton("testen", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "ID", "Identifizierer des angegebenen Controls: " & _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($button)))
EndFunc   ;==>Example
