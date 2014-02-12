#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>

Local $hToken = _Security__OpenThreadTokenEx($TOKEN_ADJUST_PRIVILEGES)
If $hToken Then
	; $hToken ist das Threadtoken mit $TOKEN_ADJUST_PRIVILEGES Zugriff.
	MsgBox(262144, "OpenThreadTokenEx", "$hToken = " & $hToken)

	_WinAPI_CloseHandle($hToken)
Else
	ConsoleWrite("! _Security__OpenThreadTokenEx ERROR. Fehler: " & _WinAPI_GetLastErrorMessage())
EndIf
