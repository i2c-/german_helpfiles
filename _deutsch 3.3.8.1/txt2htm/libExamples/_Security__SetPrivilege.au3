#RequireAdmin ; F&uuml;r &Auml;nderungen im System

#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>
#include <Date.au3>

Local $hToken = _Security__OpenProcessToken(_WinAPI_GetCurrentProcess(), $TOKEN_ALL_ACCESS)
If $hToken Then
	; $hToken ist das Prozesstoken mit $TOKEN_ALL_ACCESS Zugriff.
	
	; SeDebugPrivilege f&uuml;r dieses Token nutzen:
	If _Security__SetPrivilege($hToken, $SE_DEBUG_NAME, True) Then
		;... Hier alle Funktionen hinein, die mit dem Token arbeiten ...
		MsgBox(262144, "TokenPrivileges", $SE_DEBUG_NAME & " aktiviert!")
		; Deaktivieren:
		_Security__SetPrivilege($hToken, $SE_DEBUG_NAME, False)
		MsgBox(262144, "TokenPrivileges", $SE_DEBUG_NAME & " deaktiviert!")
	EndIf

	; Handle schlie&szlig;en:
	_WinAPI_CloseHandle($hToken)
EndIf
