#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Local $hToken = _Security__OpenProcessToken(_WinAPI_GetCurrentProcess(), $TOKEN_QUERY)
If $hToken Then
	; $hToken ist das Prozesstoken mit $TOKEN_QUERY Zugriff

	;... Hier alle Funktionen hinein, die mit dem Token arbeiten ...
	MsgBox($MB_SYSTEMMODAL, "OpenProcessToken", "$hToken = " & $hToken)

	; Handle schlie&szlig;en:
	_WinAPI_CloseHandle($hToken)
EndIf
