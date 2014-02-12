#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iEncoding = FileGetEncoding(@ScriptFullPath) ; Liest die Zeichenkodierung der Scriptdatei aus
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "Error", "Konnte keine Kodierung auslesen.")
	Else
		MsgBox($MB_SYSTEMMODAL, "FileGetEncoding", "Der zur&uuml;ckgegebene Wert ist: " & $iEncoding) ; Der zur&uuml;ckgegebene Wert f&uuml;r dieses Beispiel sollte 0 bzw. ANSI sein.
	EndIf
EndFunc   ;==>Example
