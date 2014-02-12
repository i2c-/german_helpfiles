#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin ; F&uuml;r &Auml;nderungen im System


Example_SeTokInfo()

Func Example_SeTokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Auf Fehler pr&uuml;fen.

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)

	; Wenn Token erhalten:
	If $hToken Then
		; Mittleres Integrit&auml;tslevel f&uuml;r dieses Token:
		Local $tSID = _Security__StringSidToSid($SID_MEDIUM_MANDATORY_LEVEL)
		; TOKEN_MANDATORY_LABEL Struct deklarieren:
		Local Const $tTOKEN_MANDATORY_LABEL = DllStructCreate("ptr Sid; dword Attributes")
		; Mit Daten f&uuml;llen:
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Sid", DllStructGetPtr($tSID, 1))
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Attributes", $SE_GROUP_INTEGRITY)

		If _Security__SetTokenInformation($hToken, $TOKENINTEGRITYLEVEL, $tTOKEN_MANDATORY_LABEL, DllStructGetSize($tTOKEN_MANDATORY_LABEL)) Then

			; Default ist $SID_HIGH_MANDATORY_LEVEL als Integrit&auml;tslevel, wie auch immer...
			MsgBox($MB_SYSTEMMODAL, "SetTokenInformation", "$hToken = " & $hToken & @CRLF & "Dieses Token l&auml;uft nicht default mit mittlerem Integrit&auml;tslevel!")

			; ... Sonstige Tokenbefehle hier ...

		EndIf
		; Handle schlie&szlig;en:
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_SeTokInfo

