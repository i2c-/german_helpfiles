;- Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 3 gesetzt ist.
; Wenn man ein Ger&auml;te in einer anderen Adresse hat, so ist "GPIB::3::0" auf die
; Entsprechende Beschreibung zu &auml;ndern. Das gleiche ist f&uuml;r den Aufruf zu _viOpen erledigen.
; Es zeigt wie man die _viExecCommand Funktion mit einem Timeout verwendet oder wie man stattdessen _viSetTimeout aufruft.

#include <Visa.au3>

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox(0, "Schritt 1", "Einfache GPIB Abfrage mit einem explizit gesetzten TIMEOUT")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox(0, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

; Dies ist das gleiche wie wenn man zuerst du _viSetTimeout Funktion nutzen w&uuml;rde:
MsgBox(0, "Schritt 2", "_vOpen + Timeout durch Verwenden der _viSetTimeout + GPIB Abfrage")
Local $h_instr = _viOpen(3)
_viSetTimeout($h_instr, 10000) ; 10000 ms = 10 s
$s_answer = _viExecCommand($h_instr, "*IDN?") ; Der Timeout muss nun nicht gesetzt werden
MsgBox(0, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

MsgBox(0, "Schritt 3", "Schlie&szlig;t die Ger&auml;teverbindung durch Verwenden von _viClose")
_viClose($h_instr) ; Schlie&szlig;t die Ger&auml;teverbindung
