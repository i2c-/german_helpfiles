#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo
Local $hGUI, $pFileTime1, $tFileTime1, $pFileTime2, $tFileTime2

; Erstellt die GUI
$hGUI = GUICreate("StringFormat", 250, 400)
$iMemo = GUICtrlCreateEdit("", 2, 2, 246, 396, $WS_VSCROLL)
GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
GUISetState()

Local $n = 43951789
Local $u = -43951789

; Folgendes ist zu beachten: Ein einzelnes % ist der Beginn einer Kombination aus Platzhalter und Formatcode (z.B. %d, %X, %.2f), der bei der Ausgabe durch die formatierte
;          Variable ersetzt wird. Das doppelte Prozentzeichen %% im Formatstring gibt jedoch nur ein einzelnes % aus, d.h. '%%d' wird als '%d' ausgegeben.
;
printf("%%d      = '%d'", $n);				'43951789'			standardm&auml;&szlig;ige Integerschreibweise
printf("%%e      = '%e'", $n);				'4.395179e+007'		wissenschaftliche Schreibweise
printf("%%u      = '%u'", $n);				'43951789'			vorzeichenlose Integerschreibweise eines positiven Integerwerts
printf("%%u <0   = '%u'", $u);				'4251015507'		vorzeichenlose Integerschreibweise eines negativen Integerwerts
printf("%%f      = '%f'", $n);				'43951789.000000'	standardm&auml;&szlig;ige Gleitpunktschreibweise
printf("%%.2f    = '%.2f'", $n);			'43951789.00'		Gleitpunktschreibweise mit 2 Stellen nach dem Dezimalpunkt
printf("%%o      = '%o'", $n);				'247523255'			Darstellung als Oktalzahl
printf("%%s      = '%s'", $n);				'43951789'			Darstellung als String
printf("%%#x     = '%#x'", $n);				'0x29ea6ad'			Darstellung als Hexadezimalzahl mit Pr&auml;fix in Kleinschreibung
printf("%%X      = '%X'", $n);				'29EA6AD'			Darstellung als Hexadezimalzahl ohne Pr&auml;fix und in Gro&szlig;schreibung

printf("%%+d     = '%+d'", $n);				'+43951789'			Darstellung eines positiven Integerwerts bei erzwungenem Vorzeichen
printf("%%+d <0  = '%+d'", $u);				'-43951789'			Darstellung eines negativen Integerwerts bei erzwungenem Vorzeichen
printf()

Local $s = 'monkey';

printf("%%s      = [%s]", $s);				[monkey]			standardm&auml;&szlig;ige Stringausgabe
printf("%%10s    = [%10s]", $s);			[    monkey]		rechtsb&uuml;ndige Ausgabe von 10 Zeichen mit auff&uuml;llenden Leerzeichen
printf("%%-10s   = [%-10s]", $s);			[monkey    ]		linksb&uuml;ndige Ausgabe von 10 Zeichen mit auff&uuml;llenden Leerzeichen
printf("%%010s   = [%010s]", $s);			[0000monkey]		Ausgabe mit f&uuml;hrenden Nullen geht auch bei Strings
printf("%%10.4s  = [%10.4s]", $s);			[      monk]		rechtsb&uuml;ndige Ausrichtung von 10 Zeichen, aber nur 4 Zeichen der Variablen werden verwendet
printf()

printf('Direkte Ausgabe (ohne printf):')
; Drei Beispiele der Verwendung von StringFormat ohne die Verwendung der lokalen Funktionen printf und MemoWrite:
GUICtrlSetData($iMemo, (StringFormat("%%d = '%d'", $u)) & @CRLF, 1)
MsgBox(0, "Ein Datum", StringFormat("%%02d.%%02d.%%04d = %02d.%02d.%04d", 28, 2, 2009))
ConsoleWrite(StringFormat("%%10.7s = [%10.7s]", "Konsolenausgabe"))

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE
Exit

; Formatstring und Variablen f&uuml;r die Ausgabe weiterleiten
Func printf($format = "", $var1 = "", $var2 = "", $var3 = "")
	If $format = "" Then
		MemoWrite("")
	ElseIf $var1 = "" Then
		MemoWrite($format)
	ElseIf $var2 = "" Then
		MemoWrite(StringFormat($format, $var1))
	Else
		MemoWrite(StringFormat($format, $var1, $var2, $var3))
	EndIf
EndFunc   ;==>printf

; Ausgabe einer Zeile in ein Memo-Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
