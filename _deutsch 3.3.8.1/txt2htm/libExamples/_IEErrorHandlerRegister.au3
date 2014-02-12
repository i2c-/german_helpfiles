; *******************************************************
; Beispiel 1 - Registriert eine eigene und eine vorgegebene IE.au3 Fehlerbehandlungsroutine und l&ouml;scht diese sp&auml;ter
; *******************************************************

#include <IE.au3>

; Registriert eine eigene Fehlerbehandlungsroutine
_IEErrorHandlerRegister("MeineFehlerroutine")
; Programm-Code
; L&ouml;scht die eigene Fehlerbehandlungsroutine wieder
_IEErrorHandlerDeRegister()
; Programm-Code
; Registriert die vorgegebene IE.au3 COM Fehlerbehandlungsroutine
_IEErrorHandlerRegister()
; Programm-Code

Exit

Func MeineFehlerroutine()
	; Wichtig: Die Fehlerobjekt-Variable MUSS $oIEErrorHandler hei&szlig;en
	Local $ErrorScriptline = $oIEErrorHandler.scriptline
	Local $ErrorNumber = $oIEErrorHandler.number
	Local $ErrorNumberHex = Hex($oIEErrorHandler.number, 8)
	Local $ErrorDescription = StringStripWS($oIEErrorHandler.description, 2)
	Local $ErrorWinDescription = StringStripWS($oIEErrorHandler.WinDescription, 2)
	Local $ErrorSource = $oIEErrorHandler.Source
	Local $ErrorHelpFile = $oIEErrorHandler.HelpFile
	Local $ErrorHelpContext = $oIEErrorHandler.HelpContext
	Local $ErrorLastDllError = $oIEErrorHandler.LastDllError
	$ErrorOutput = ""
	$ErrorOutput &= "--> COM Error Encountered in " & @ScriptName & @CR
	$ErrorOutput &= "----> $ErrorScriptline = " & $ErrorScriptline & @CR
	$ErrorOutput &= "----> $ErrorNumberHex = " & $ErrorNumberHex & @CR
	$ErrorOutput &= "----> $ErrorNumber = " & $ErrorNumber & @CR
	$ErrorOutput &= "----> $ErrorWinDescription = " & $ErrorWinDescription & @CR
	$ErrorOutput &= "----> $ErrorDescription = " & $ErrorDescription & @CR
	$ErrorOutput &= "----> $ErrorSource = " & $ErrorSource & @CR
	$ErrorOutput &= "----> $ErrorHelpFile = " & $ErrorHelpFile & @CR
	$ErrorOutput &= "----> $ErrorHelpContext = " & $ErrorHelpContext & @CR
	$ErrorOutput &= "----> $ErrorLastDllError = " & $ErrorLastDllError
	MsgBox(0, "COM Fehler", $ErrorOutput)
	SetError(1)
	Return
EndFunc   ;==>MeineFehlerroutine
