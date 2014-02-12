; *******************************************************
; Beispiel 1 - 	Registriert und deregistriert einen benutzerdefinierten Errorhandler
; 				und stellt dann den standardm&auml;&szlig;igen Word.au3-Errorhandler ein.
; *******************************************************
;
#include <Word.au3>

; Registriert den benutzerdefinierten Errorhandler
_WordErrorHandlerRegister("MyErrFunc")
; Erstellt ein Word-Objekt
$oWordApp = _WordAttach("c:\xyz.zyx") ; <- Diese Datei sollte nicht existieren!
$oWordApp.Selection.Copy ; Provoziere einen Fehler

; Deregistriert den benutzerdefinierten Errorhandler
_WordErrorHandlerDeRegister()

; Registriert den Standard-Errorhandler aus Word.au3
_WordErrorHandlerRegister()
$oWordApp.Selection.Copy ; Provoziere wieder einen Fehler

_WordQuit($oWordApp) ; Word-Objekt schlie&szlig;en
Exit

Func MyErrFunc()
	; Wichtig: Die Fehler-Objektvariable muss $oWordErrorHandler genannt werden!
	Local $ErrorScriptline = $oWordErrorHandler.scriptline
	Local $ErrorNumber = $oWordErrorHandler.number
	Local $ErrorNumberHex = Hex($oWordErrorHandler.number, 8)
	Local $ErrorDescription = StringStripWS($oWordErrorHandler.description, 2)
	Local $ErrorWinDescription = StringStripWS($oWordErrorHandler.WinDescription, 2)
	Local $ErrorSource = $oWordErrorHandler.Source
	Local $ErrorHelpFile = $oWordErrorHandler.HelpFile
	Local $ErrorHelpContext = $oWordErrorHandler.HelpContext
	Local $ErrorLastDllError = $oWordErrorHandler.LastDllError
	Local $ErrorOutput = ""
	$ErrorOutput &= "--> Ein COM-Fehler ist aufgetreten in: " & @ScriptName & @CR
	$ErrorOutput &= "----> $ErrorScriptline = " & $ErrorScriptline & @CR
	$ErrorOutput &= "----> $ErrorNumberHex = " & $ErrorNumberHex & @CR
	$ErrorOutput &= "----> $ErrorNumber = " & $ErrorNumber & @CR
	$ErrorOutput &= "----> $ErrorWinDescription = " & $ErrorWinDescription & @CR
	$ErrorOutput &= "----> $ErrorDescription = " & $ErrorDescription & @CR
	$ErrorOutput &= "----> $ErrorSource = " & $ErrorSource & @CR
	$ErrorOutput &= "----> $ErrorHelpFile = " & $ErrorHelpFile & @CR
	$ErrorOutput &= "----> $ErrorHelpContext = " & $ErrorHelpContext & @CR
	$ErrorOutput &= "----> $ErrorLastDllError = " & $ErrorLastDllError
	MsgBox(0, "COM-Fehler", $ErrorOutput)
	SetError(1)
	Return
EndFunc   ;==>MyErrFunc
