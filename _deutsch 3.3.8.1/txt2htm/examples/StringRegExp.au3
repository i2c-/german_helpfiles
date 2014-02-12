; Option 1, Verwendung eines Offsets
Local $nOffset = 1

Local $array
While 1
	$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 1, $nOffset)

	If @error = 0 Then
		$nOffset = @extended
	Else
		ExitLoop
	EndIf
	For $i = 0 To UBound($array) - 1
		MsgBox(0, "RegExp-Test mit Option 1 - " & $i, $array[$i])
	Next
WEnd


; Option 2, einfacher R&uuml;ckgabewert, php/preg_match()-Stil
$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 2)
For $i = 0 To UBound($array) - 1
	MsgBox(0, "RegExp Test mit Option 2 - " & $i, $array[$i])
Next


; Option 3, globale R&uuml;ckgabe, alter AutoIt-Stil
$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 3)

For $i = 0 To UBound($array) - 1
	MsgBox(0, "RegExp-Test mit Option 3 - " & $i, $array[$i])
Next


; Option 4, globale R&uuml;ckgabe, php/preg_match_all()-Stil
$array = StringRegExp('F1oF2oF3o', '(F.o)*?', 4)

For $i = 0 To UBound($array) - 1

	$match = $array[$i]
	For $j = 0 To UBound($match) - 1
		MsgBox(0, "RegExp-Test mit Option 4 - " & $i & ',' & $j, $match[$j])
	Next
Next


#include <Array.au3>
; Die folgenden Beispiele sind nur in der deutschen Hilfe enthalten


; *************************************************************************************************************************************************************
; Beispiel 1
; ----------------- Anwendung von Wiederholungszeichen
; Suchmuster:
; 2x Zahl
; 1x .
; 2x Zahl
; 1x .
; 4x Zahl

Dim $array[2]

$array[0] = "23.08.2010"
$array[1] = "23.08.10"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "\d{2}\.\d{2}\.\d{4}", 3)
	_ArrayDisplay($regexp, $array[$i])
Next
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 2
; ----------------- Anwendung von Wiederholungszeichen
; Suchmuster:
; 1x "P"
; mindestens 1x "a"
; 1x "r"

Dim $array[2]

$array[0] = "Ich habe 10 Paaaaaar zu Hause"
$array[1] = "Ich habe 10 Par zu Hause"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "Pa+r", 3) ;alternativ: Pa{1,}r
	_ArrayDisplay($regexp, $array[$i])
Next
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 3
; ----------------- Anwendung von Oder und ?:
; Suchmuster:
; "-XY" ODER " XY" (?:\-XY| XY) >>> durch ?: wird nicht nur das Ergebnis der Oder-Bedingung sondern auch der Rest im Array ausgegeben
; DANN Zahlen (beliebige Anzahl) \d*
; DANN "-" \-

Dim $array[2]

$array[0] = "425-65-XY4587543-ghzgt7"
$array[1] = "4 25-65 XY4587543-ghzgt7"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "(?:\-XY| XY)\d*\-", 3)
	_ArrayDisplay($regexp, $array[$i])
Next
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 4
; ----------------- Anwendung von ?<!
; Suchmuster:
; alles au&szlig;er "142"
; DANN "Hallo"

Dim $array[2]

$array[0] = "142Hallo"
$array[1] = "412Hallo"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "(?<!142)(Hallo)", 3)
	_ArrayDisplay($regexp, $array[$i])
Next
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 5
; ----------------- Anwendung von \b
; Durch das Voranstellen von \b und das anh&auml;ngen von \b an das Ende wird nur an der Wortgrenze gesucht.
; "Abgrund oder folge" wird nicht gefunden, da das Wort Abgrund und nicht Grund heisst

$sString = _
		"Grund oder Folge der Armut?" & @CRLF & _
		"Fahre ich in den Abgrund oder folge ich der Stra&szlig;e?"
$aResult = StringRegExp($sString, "(?i)\bgrund oder folge\b", 3)
_ArrayDisplay($aResult, "StringRegExp Results")
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 6
; ----------------- R&uuml;ckgabeformen
; Hier ein kleines Script, nur um die verschiedenen R&uuml;ckgabeformen zu verdeutlichen:
$sString = _
		'<td><img src="img/x.gif" class="r1" alt="Holz" title="Holz"></td>' & @CRLF & _
		'<td id="l4" title="600">132411/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r2" alt="Lehm" title="Lehm"></td>' & @CRLF & _
		'<td id="l3" title="600">168007/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r3" alt="Eisen" title="Eisen"></td>' & @CRLF & _
		'<td id="l2" title="750">32743/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r4" alt="Getreide" title="Getreide"></td>' & @CRLF & _
		'<td id="l1" title="79">78451/240000</td>'

$aFlag1 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 1)
$aFlag2 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 2)
$aFlag3 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 3)
$aFlag4 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 4)

MsgBox(0, "", "Flag 0 gibt 1 (matched) oder 0 (no match) zur&uuml;ck.")
MsgBox(0, "Flag 0", StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)"))

MsgBox(0, "", "Flag 1 zeigt das erste Match (nur Subpatterns)")
_ArrayDisplay($aFlag1, "Flag 1")

MsgBox(0, "", "Flag 2 zeigt das erste Match (Full Match + Subpatterns)")
_ArrayDisplay($aFlag2, "Flag 2")

MsgBox(0, "", "Flag 3 zeigt alle Matches (nur Subpatterns)")
_ArrayDisplay($aFlag3, "Flag 3")

MsgBox(0, "", "Flag 4 gibt einen Array voller Arrays zur&uuml;ck.")
_ArrayDisplay($aFlag4, "Flag 4")
MsgBox(0, "", "Die einzelnen Arrays beinhalten Full Match + Subpatterns." & @CRLF & _
		"Leider kann man Arrays in Arrays nicht direkt ansprechen" & @CRLF & _
		"(ohne sie zwischenzuspeichern), deswegen benutze ich statt Flag 4 immer Flag 3." & @CRLF & _
		"Hier mal alle Arrays in $aFlag4:")

For $i = 0 To UBound($aFlag4) - 1
	$aDummy = $aFlag4[$i]
	_ArrayDisplay($aDummy, "$aFlag4[" & $i & "]")
Next
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 7
; ----------------- Anwendung von gierigen und faulen Wiederholungszeichen
; Das erste * ist gierig. Es wird die l&auml;ngste Stelle gesucht
$aRegExp = StringRegExp("Die Abk&uuml;rzung 'ISP' hei&szlig;t 'Internet Service Provider'.", ".*'(.*)'.*", 3)
_ArrayDisplay($aRegExp)

; Durch anh&auml;ngen eines ? wird es faul und es wird die k&uuml;rzeste Stelle gesucht
$aRegExp = StringRegExp("Die Abk&uuml;rzung 'ISP' hei&szlig;t 'Internet Service Provider'.", ".*?'(.*?)'.*", 3)
_ArrayDisplay($aRegExp)

; Das erste * ist gierig. Es wird die l&auml;ngste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)

; Durch anh&auml;ngen eines ? wird es faul und es wird die k&uuml;rzeste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*?)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 8
; ----------------- Anwendung von \n
; Das erste Wort (auf welches " Email: " folgt) wird in einer tempor&auml;ren Variable gespeichert (weil eingeklammert)
; Diese Variable wird mit \1 abgerufen. Die 1 steht dabei f&uuml;r die Nummer des Subpatterns.
$sString = "Name Email: Name@web.de" & @CRLF
$sString &= "Name Email: Peter@live.de" & @CRLF
$sString &= "Acanis Email: Acanis@gmx.net" & @CRLF
$sString &= "Acanis Email: Coolertyp@googlemail.com" & @CRLF
$aRegExp = StringRegExp($sString, "(\w+) Email: (\1@\w+\.\w+)", 3)
_ArrayDisplay($aRegExp)
; *************************************************************************************************************************************************************


; *************************************************************************************************************************************************************
; Beispiel 9
; ----------------- Anwendung von ?:
; Das folgende Beispiel soll aufzeigen, wie ein Subpattern gespeichert wird und wie nicht.
$sString = "Mein Name ist Peter" & @CRLF
$sString &= "Mein Name ist Karl" & @CRLF
$sString &= "Mein Name ist Max" & @CRLF

; So w&uuml;rde nur das Subpattern zur&uuml;ckgegeben werden
$aResult = StringRegExp($sString, "Mein Name ist (Karl|Max)", 3)
_ArrayDisplay($aResult)

; Durch voranstellen von ?: wird das Subpattern nicht gespeichert und es wird der komplette Satz als Ergebnis zur&uuml;ckgegeben
$aResult = StringRegExp($sString, "Mein Name ist (?:Karl|Max)", 3)
_ArrayDisplay($aResult)
; *************************************************************************************************************************************************************


; *************************************************************************************************************************************************************
; Beispiel 10
; ----------------- Verwendung von Subpatterns
; Das folgende Beispiel soll aufzeigen, wie ein Subpattern gespeichert wird und dieses dann sp&auml;ter wieder verwendet wird.
$date = '01.03.2008' ; YYYY/MM/DD
$new = StringRegExpReplace($date, "(\d{2})\.(\d{2})\.(\d{4})", "$3/$2/$1")
MsgBox(0, "", $new)
; *************************************************************************************************************************************************************



; *************************************************************************************************************************************************************
; Beispiel 11
; ----------------- Verwendung von Wiederholungszeichen.
; Hier wird der Inhalt der Gruppe &uuml;berschrieben, sobald ein Wiederholungszeichen auf die Gruppe angewandt wird
$sText = "aaabacad"
$aRet = StringRegExp($sText, "(a.)+", 3)
_ArrayDisplay($aRet)
; *************************************************************************************************************************************************************
