#include <ProcessConstants.au3>
#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>

Local $hProcess = _WinAPI_OpenProcess($PROCESS_ALL_ACCESS, 0, ProcessExists("explorer.exe"))
; Wenn erfolgreich:
If $hProcess Then
	; Token stellen:
	Local $hTokOriginal = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
	; Prozesshandle schlie&szlig;en, da es nicht mehr gebraucht wird:
	_WinAPI_CloseHandle($hProcess)
	; Wenn erfolgreich:
	If $hTokOriginal Then
		; Duplizieren des Originaltokens:
		Local $hTokDuplicate = _Security__DuplicateTokenEx($hTokOriginal, $TOKEN_ALL_ACCESS, $SECURITYIMPERSONATION, $TOKENPRIMARY)
		; Originaltoken schlie&szlig;en:
		_WinAPI_CloseHandle($hTokOriginal)
		; Nun liegt ein prim&auml;res Token vor (!)

		; ... Weitere Tokenbefehle hier hinein ...

		MsgBox(262144, "DuplicateTokenEx", "$hTokDuplicate = " & $hTokDuplicate)

		; Token schlie&szlig;en:
		_WinAPI_CloseHandle($hTokDuplicate)
	EndIf
EndIf

