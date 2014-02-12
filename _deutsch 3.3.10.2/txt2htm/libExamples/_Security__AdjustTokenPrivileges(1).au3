#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin ; Adminrechte f&uuml;r &Auml;nderungen im System.


Local $hToken = _Security__OpenProcessToken(_WinAPI_GetCurrentProcess(), $TOKEN_ALL_ACCESS)
If $hToken Then
	; $hToken ist das Prozesstoken mit $TOKEN_ALL_ACCESS Zugriff

	; Diesem Token alle Rechte einziehen.
	If _Security__AdjustTokenPrivileges($hToken, True, 0, 0) Then
		; Alle Manipultionen des Tokens hier hinein.
		MsgBox($MB_SYSTEMMODAL, "TokenPrivileges", "Alle Rechte vom Token entzogen!")
	EndIf

	; Handle schlie&szlig;en.
	_WinAPI_CloseHandle($hToken)
EndIf
