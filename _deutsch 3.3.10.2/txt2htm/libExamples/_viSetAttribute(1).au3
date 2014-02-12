#include <Visa.au3>
#include <MsgBoxConstants.au3>

; Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 3 gesetzt ist.
; Wenn man ein Ger&auml;t in einer anderen Adresse hat, so ist "GPIB::3::0" auf die
; Entsprechende Beschreibung zu &auml;ndern. Das Gleiche ist f&uuml;r den Aufruf von _viOpen zu erledigen.
; Es zeigt, wie man _viSetAttribute verwendet. In diesem Beispiel verwenden wir _viSetAttribute
; Anstelle von _viSetTimeout, um den GPIB-Timeout eines _viExecCommand-Vorgangs zu setzen.

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Einfache GPIB-Abfrage mit einem explizit gesetzten TIMEOUT")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

; Dies ist das Gleiche, als wenn man zuerst die _viSetTimeout-Funktion nutzen w&uuml;rde:
MsgBox($MB_SYSTEMMODAL, "Schritt 2", "_vOpen + Timeout durch Verwenden der _viSetTimeout + GPIB Abfrage")
Local $h_instr = _viOpen(3)
; Folgendes ist zu beachten - Dies ist das Gleiche wie: _viSetTimeout($h_instr, 10000)
_viSetAttribute($h_instr, $VI_ATTR_TMO_VALUE, 10000) ; 10000 ms = 10 s

$s_answer = _viExecCommand($h_instr, "*IDN?") ; Der Timeout muss nun nicht gesetzt werden
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Schlie&szlig;t die Ger&auml;teverbindung durch Verwenden von _viClose")
_viClose($h_instr) ; Schlie&szlig;t die Ger&auml;teverbindung
