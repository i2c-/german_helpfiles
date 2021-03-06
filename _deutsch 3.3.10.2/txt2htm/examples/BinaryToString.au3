#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Definiert den String der sp&auml;ter konvertiert wird.
	; Anmerkung: Dieser String k&ouml;nnte in der Hilfe Datei und sogar in manchen Texteditoren als ?? dargestellt werden.
	; Dieses Beispiel wurde als UTF-8 mit BOM gespeichert.
	; Es sollte in Editoren die auf BOM Basis ver&auml;nderbare Codeseiten unterst&uuml;tzen korrekt angezeigt werden.
	Local Const $sString = "Hallo - ??"

	; Tempor&auml;re Variablen in denen die Konvertierungsresultate gespeichert werden.
	; $dBinary wird den Originalstring in Bin&auml;rform enthalten und
	; $sConverted wird das Resultat enthalten nachdem es in das urspr&uuml;ngliche Format gebracht wurde
	Local $dBinary = Binary(""), $sConverted = ""

	; Konvertiert den originalen UTF-8 String in einen ANSI kompatiblen Bin&auml;rstring.
	$dBinary = StringToBinary($sString)

	; Konvertiert den ANSI kompatiblen Bin&auml;rstring zur&uuml;ck in einen String.
	$sConverted = BinaryToString($dBinary)

	; Zeigt die Ergebnisse.  Die letzten beiden Zeichen werden als ?? dargestellt, da sie in ANSI nicht repr&auml;sentiert werden k&ouml;nnen.
	DisplayResults($sString, $dBinary, $sConverted, "ANSI")

	; Konvertiert den originalen UTF-8 String in einen UTF16-LE Bin&auml;rstring.
	$dBinary = StringToBinary($sString, 2)

	; Konvertiert den UTF16-LE Bin&auml;rstring zur&uuml;ck in einen String.
	$sConverted = BinaryToString($dBinary, 2)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF16-LE")

	; Konvertiert den originalen UTF-8 String in einen UTF16-LE Bin&auml;rstring.
	$dBinary = StringToBinary($sString, 3)

	; Konvertiert den UTF16-LE Bin&auml;rstring zur&uuml;ck in einen String.
	$sConverted = BinaryToString($dBinary, 3)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF16-BE")

	; Konvertiert den originalen UTF-8 String in einen UTF-8 Bin&auml;rstring.
	$dBinary = StringToBinary($sString, 4)

	; Konvertiert den UTF-8 Bin&auml;rstring zur&uuml;ck in einen String.
	$sConverted = BinaryToString($dBinary, 4)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF8")
EndFunc   ;==>Example

; Hilfsfunktion welche die Nachricht f&uuml;r die Darstellung formatiert. Sie empf&auml;ngt folgende Parameter:
; $sOriginal - Der originale String vor der Konvertierung.
; $dBinary - Der originale String nachdem er in Bin&auml;rform konvertiert wurde.
; $sConverted - Der originale String nachdem er in Bin&auml;rform und zur&uuml;ck konvertiert wurde.
; $sConversionType - Ein f&uuml;r den Benutzer lesbarer Name f&uuml;r den bei der konvertierung verwendeten Kodierungstyp.
Func DisplayResults($sOriginal, $dBinary, $sConverted, $sConversionType)
	MsgBox($MB_SYSTEMMODAL, "", "Original:" & @CRLF & $sOriginal & @CRLF & @CRLF & "Bin&auml;r:" & @CRLF & $dBinary & @CRLF & @CRLF & $sConversionType & ":" & @CRLF & $sConverted)
EndFunc   ;==>DisplayResults
