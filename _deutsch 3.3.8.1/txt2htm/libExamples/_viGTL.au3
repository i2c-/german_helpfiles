;- Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 3 gesetzt ist.
; Wenn das Ger&auml;t an eine andere Adresse gesetzt wurde, muss "GPIB::3::0" entsprechend angepasst werden.
; Es zeigt die Benutzung der Funktion _viGTL mit einem VISA-Descriptor und mit einem VISA-Ger&auml;tehandle
; Vorher haben wir mit _viExecCommand in den Fernsteuerungsmodus gewechselt

#include <Visa.au3>

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox(0, "Schritt 1", "Einfache GPIB-Abfrage mit einem VISA-Descriptor")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox(0, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Zum lokalen Computer wechseln (beendet den Fernsteuerungsmodus)
MsgBox(0, "Schritt 2", "Wechsle nach LOCAL unter Verwendung des VISA-Descriptors")
_viGTL("GPIB::1::0")

; &Ouml;ffnen der Ger&auml;teverbindung nur durch Verwenden der Adress-Nummer
MsgBox(0, "Schritt 3", "&Ouml;ffnen der Ger&auml;teverbindung durch Verwenden der Adress-Nummer")
Local $h_instr = _viOpen(3)
MsgBox(0, "Ger&auml;te-Handle bekommen", "$h_instr = " & $h_instr) ; Zeigt das Session Handle

; Das Ger&auml;t abfragen
MsgBox(0, "Schritt 4", "Das Ger&auml;t unter Nutzung des VISA-Ger&auml;tehandles abfragen")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox(0, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN
MsgBox(0, "Schritt 5", "Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox(0, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Wechselt zum lokalen Computer (optional)
MsgBox(0, "Schritt 6", "Wechsle nach LOCAL unter Verwendung des VISA-Ger&auml;tehandles")
_viGTL($h_instr)

; Ger&auml;teverbindung schlie&szlig;en
MsgBox(0, "Schritt 7", "Schlie&szlig;en der Ger&auml;teverbindung mit _viClose")
_viClose($h_instr)
