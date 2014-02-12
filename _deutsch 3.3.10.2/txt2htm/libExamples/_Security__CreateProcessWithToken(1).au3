#include <ProcessConstants.au3>
#include <StructureConstants.au3>
#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin ; Adminrechte f&uuml;r &Auml;nderungen im System.


Example_ProcessWithTok()


Func Example_ProcessWithTok()
	; AutoIt mit normalem Level ausf&uuml;hren, unabh&auml;ngig von den Rechten, welche durch #RequireAdmin oder andere Kommandos erlangt wurden.
	_RunNonElevated('"' & @AutoItExe & '" /AutoIt3ExecuteLine  "MsgBox(4096, ''RunNonElevated'', ''IsAdmin() = '' & "IsAdmin()" & '', PID = '' & "@AutoItPID")"')
EndFunc   ;==>Example_ProcessWithTok


Func _RunNonElevated($sCommandLine = "")
	If Not IsAdmin() Then Return Run($sCommandLine) ; Wenn der aktuelle Prozess kein h&ouml;heres Level hat wird ein Neuer gestartet.

	; Structs f&uuml;r das Erstellen von Prozessen:
	Local $tSTARTUPINFO = DllStructCreate($tagSTARTUPINFO)
	Local $tPROCESS_INFORMATION = DllStructCreate($tagPROCESS_INFORMATION)

	; Handle von einem Low-Level Prozess, beispielsweise Explorer:
	Local $hProcess = _WinAPI_OpenProcess($PROCESS_ALL_ACCESS, 0, ProcessExists("explorer.exe"))

	; Wenn erfolgreich:
	If $hProcess Then
		; Token:
		Local $hTokOriginal = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
		; Prozesshandle schlie&szlig;en, da nicht mehr ben&ouml;tigt:
		_WinAPI_CloseHandle($hProcess)
		; Wenn erfolgreich:
		If $hTokOriginal Then
			; Originaltoken duplizieren:
			Local $hTokDuplicate = _Security__DuplicateTokenEx($hTokOriginal, $TOKEN_ALL_ACCESS, $SECURITYIMPERSONATION, $TOKENPRIMARY)
			; Originaltoken schlie&szlig;en:
			_WinAPI_CloseHandle($hTokOriginal)
			; Wenn erfolgreich:
			If $hTokDuplicate Then
				; Neuen Prozess mit diesem Token erstellen:
				_Security__CreateProcessWithToken($hTokDuplicate, 0, $sCommandLine, 0, @ScriptDir, $tSTARTUPINFO, $tPROCESS_INFORMATION)
				; Dieses Token schlie&szlig;en:
				_WinAPI_CloseHandle($hTokDuplicate)
				; Alle Handles schlie&szlig;en:
				_WinAPI_CloseHandle(DllStructGetData($tPROCESS_INFORMATION, "hProcess"))
				_WinAPI_CloseHandle(DllStructGetData($tPROCESS_INFORMATION, "hThread"))
				; PID vom neuen Prozess zur&uuml;ckgeben:
				Return DllStructGetData($tPROCESS_INFORMATION, "ProcessID")
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_RunNonElevated
