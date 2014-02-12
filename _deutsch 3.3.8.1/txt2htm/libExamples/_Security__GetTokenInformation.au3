#include <SecurityConstants.au3>
#include <Security.au3>
#include <WinAPI.au3>

Example_TokInfo()

Func Example_TokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Auf m&ouml;gliche Fehler pr&uuml;fen.

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
	; Wenn ein Token zur&uuml;ckgegeben wurde...
	If $hToken Then
		; Informationen &uuml;ber den Typ des Token erhalten:
		Local $tInfo = _Security__GetTokenInformation($hToken, $TOKENTYPE)
		; Das Ergebnis liegt als roher bin&auml;rer Datensatz vor. F&uuml;r §TOKENTYPE ist es TOKEN_TYPE, reinterpretiert als "int" Typ:
		Local $iTokenType = DllStructGetData(DllStructCreate("int", DllStructGetPtr($tInfo)), 1)

		ConsoleWrite("Der Tokentyp ist " & $iTokenType & @CRLF) ; Kann den Wert von $TOKENPRIMARY oder $TOKENIMPERSONATION annehmen.

		; Tokenhandle schlie&szlig;en:
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_TokInfo
