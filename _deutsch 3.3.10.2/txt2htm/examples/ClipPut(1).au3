#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Daten der Zwischenablage
	Local $sData = ClipGet()

	; Zeigt die Daten die von ClipGet zur&uuml;ckgegeben wurden.
	MsgBox($MB_SYSTEMMODAL, "", "Die folgenden Daten sind in der Zwischenablage gespeichert: " & @CRLF & $sData)

	; F&uuml;gt neue Daten in die Zwischenablage hinzu
	ClipPut("Ein neuer String wurde in die Zwischenablage hinzugef&uuml;gt.")

	; Ermittelt die Daten der Zwischenablage
	$sData = ClipGet()

	; Zeigt die Daten die von ClipGet zur&uuml;ckgegeben wurden.
	MsgBox($MB_SYSTEMMODAL, "", "The following data is now stored in the clipboard: " & @CRLF & $sData)
EndFunc   ;==>Example
