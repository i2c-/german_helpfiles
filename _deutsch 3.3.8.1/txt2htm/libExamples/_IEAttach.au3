; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; Um die Beispiele 1,2,3 und 5 nachvollziehen zu k&ouml;nnen, ist
; www.autoit.de und www.wikipedia.de in je einem IE-Browserfenster oder -Tab zu &ouml;ffnen.
; F&uuml;r Beispiel 3 ist der Mediaplayer geeignet (Media Guide ausw&auml;hlen)
; Zu 4. habe gibt es leider kein funktionierendes Beispiel. :(
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; *******************************************************
; Beispiel 1 - Verbindet sich mit einem ge&ouml;ffneten Internet Explorer, in dessen Titel"AutoIt" vorkommt und gibt die URL aus.
; *******************************************************

#include <IE.au3>

Local $oIE = _IEAttach("AutoIt")
MsgBox(0, "Beispiel 1:", _IEPropertyGet($oIE, "locationurl"))

; *******************************************************
; Beispiel 2 - Verbindet sich mit einem ge&ouml;ffneten Internet Explorer, in dessen Hauptdokument der Text "unsere Spender" vorkommt.
; *******************************************************

#include <IE.au3>

$oIE = _IEAttach("unsere Spender", "text")
MsgBox(0, "Beispiel 2:", _IEPropertyGet($oIE, "locationurl"))

; *******************************************************
; Beispiel 3 - Verbindung zu einem eingebetteten IE-Control herstellen, dessen Fenstertitel "Player" enth&auml;lt.
; *******************************************************

#include <IE.au3>

$oIE = _IEAttach("Player", "embedded")
MsgBox(0, "Beispiel 3:", _IEPropertyGet($oIE, "locationurl"))

; *******************************************************
; Beispiel 4 - Verbindet sich mit dem 3. IE-Control, das in ein anderes Fenster eingebettet ist.
;				Benutzt die erweiterte Fenstertitelsyntax, um das 2. Fenster mit dem Titel 'ICQ' zu finden.
; *******************************************************

#include <IE.au3>

$oIE = _IEAttach("[REGEXPTITLE:ICQ; INSTANCE:2]", "embedded", 3)
MsgBox(0, "Beispiel 4:", _IEPropertyGet($oIE, "locationurl"))

; *******************************************************
; Beispiel 5 - F&uuml;llt ein Array mit den Objektreferenzen aller erzeugten IE-Browser-Instanzen.
;				Das Erste Array-Element enth&auml;lt die Anzahl der gefundenen Instanzen.
; *******************************************************

#include <IE.au3>

Local $aIE[1]
$aIE[0] = 0

Local $i = 1
While 1
	$oIE = _IEAttach("", "instance", $i)
	If @error = $_IEStatus_NoMatch Then ExitLoop
	ReDim $aIE[$i + 1]
	$aIE[$i] = $oIE
	$aIE[0] = $i
	$i += 1
WEnd

MsgBox(0, "Beispiel 5 - Gefundene Browser:", "Anzahl der IE-Browser-Instanzen im Array: " & $aIE[0])
