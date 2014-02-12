;- Hier nehmen wir an, dass das Ger&auml;t an die GPIB-Adresse 1 gesetzt ist
; Es zeigt, wie die Funktion _viExecCommand allein und in Kombination mit _viOpen und _viClose zu benutzen ist.
; Es zeigt au&szlig;erdem die Funktion _viGTL

#include <Visa.au3>

Local $h_session = 0

; Die ID des Ger&auml;ts an GPIB-Adresse 3 abfragen
MsgBox(0, "Schritt 1", "&Ouml;ffnen der Ger&auml;teverbindung mit _viOpen")
Local $h_instr = _viOpen("GPIB::3::0")
MsgBox(0, "Ger&auml;te-Handle bekommen", "$h_instr = " & $h_instr) ; Sitzungshandle anzeigen
; Das Ger&auml;t abfragen

MsgBox(0, "Schritt 2", "Das Ger&auml;t unter Nutzung des VISA Ger&auml;tehandles abfragen ")
Local $s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox(0, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen
; Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN

MsgBox(0, "Schritt 3", "Noch einmal abfragen. Es ist nicht n&ouml;tig, den Link erneut zu &Ouml;FFNEN")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox(0, "GPIB QUERY Ergebnis", $s_answer) ; Antwort anzeigen

MsgBox(0, "Schritt 4", "Schlie&szlig;en der Ger&auml;teverbindung mit _viClose")
_viClose($h_instr) ; Ger&auml;teverbindung schlie&szlig;en
