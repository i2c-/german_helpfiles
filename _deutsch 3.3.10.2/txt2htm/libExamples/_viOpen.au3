#include <Visa.au3>
#include <MsgBoxConstants.au3>

; Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 1 gesetzt ist
; Es zeigt, wie die Funktion _viExecCommand allein und in Kombination mit _viOpen und _viClose zu benutzen ist.
; Es zeigt au&szlig;erdem die Funktion _viGTL

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "&Ouml;ffnen der Ger&auml;teverbindung mit _viOpen")
Local $h_instr = _viOpen("GPIB::3::0")
MsgBox($MB_SYSTEMMODAL, "Ger&auml;te-Handle bekommen", "$h_instr = " & $h_instr) ; Sitzungshandle anzeigen
; Das Ger&auml;t abfragen

MsgBox($MB_SYSTEMMODAL, "Schritt 2", "Das Ger&auml;t unter Nutzung des VISA-Ger&auml;tehandles abfragen ")
Local $s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen
; Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN

MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 4", "Schlie&szlig;en der Ger&auml;teverbindung mit _viClose")
_viClose($h_instr) ; Ger&auml;teverbindung schlie&szlig;en

MsgBox($MB_SYSTEMMODAL, "Schritt 5", "&Ouml;ffnen der Ger&auml;teverbindung nur durch Verwenden der Adress-Nummer")
Local $h_instr = _viOpen(3)
MsgBox($MB_SYSTEMMODAL, "Ger&auml;te-Handle bekommen", "$h_instr = " & $h_instr) ; Zeigt das Session Handle
; Das Ger&auml;t abfragen

MsgBox($MB_SYSTEMMODAL, "Schritt 6", "Abfrage der Ger&auml;teverbindung durch Verwenden des VISA Ger&auml;tehandles")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen
; Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN

MsgBox($MB_SYSTEMMODAL, "Schritt 7", "Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 8", "Schlie&szlig;t die Ger&auml;teverbindung durch Verwenden von _viClose")
_viClose($h_instr) ; Schlie&szlig;t die Ger&auml;teverbindung
