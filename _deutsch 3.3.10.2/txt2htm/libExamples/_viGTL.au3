#include <Visa.au3>
#include <MsgBoxConstants.au3>

; Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 3 gesetzt ist.
; Wenn das Ger&auml;t an eine andere Adresse gesetzt wurde, muss "GPIB::3::0" entsprechend angepasst werden.
; Es zeigt die Benutzung der Funktion _viGTL mit einem VISA-Descriptor und mit einem VISA-Ger&auml;tehandle
; Vorher haben wir mit _viExecCommand in den Fernsteuerungsmodus gewechselt

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Einfache GPIB-Abfrage mit einem VISA-Descriptor")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Zum lokalen Computer wechseln (beendet den Fernsteuerungsmodus)
MsgBox($MB_SYSTEMMODAL, "Schritt 2", "Wechsle nach LOCAL unter Verwendung des VISA-Descriptors")
_viGTL("GPIB::1::0")

; &Ouml;ffnen der Ger&auml;teverbindung nur durch Verwenden der Adress-Nummer
MsgBox($MB_SYSTEMMODAL, "Schritt 3", "&Ouml;ffnen der Ger&auml;teverbindung durch Verwenden der Adress-Nummer")
Local $h_instr = _viOpen(3)
MsgBox($MB_SYSTEMMODAL, "Ger&auml;te-Handle bekommen", "$h_instr = " & $h_instr) ; Zeigt das Session Handle

; Das Ger&auml;t abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 4", "Das Ger&auml;t unter Nutzung des VISA-Ger&auml;tehandles abfragen")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN
MsgBox($MB_SYSTEMMODAL, "Schritt 5", "Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_answer) ; Antwort anzeigen

; Wechselt zum lokalen Computer (optional)
MsgBox($MB_SYSTEMMODAL, "Schritt 6", "Wechsle nach LOCAL unter Verwendung des VISA-Ger&auml;tehandles")
_viGTL($h_instr)

; Ger&auml;teverbindung schlie&szlig;en
MsgBox($MB_SYSTEMMODAL, "Schritt 7", "Schlie&szlig;en der Ger&auml;teverbindung mit _viClose")
_viClose($h_instr)
