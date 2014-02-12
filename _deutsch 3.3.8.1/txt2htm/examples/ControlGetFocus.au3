$PID = Run("notepad.exe") ; Notepad-Fenster &ouml;ffnen

WinWaitActive("[CLASS:Notepad]", "", 3) ; Diese Zeile auskommentieren, um einen Fehler zu provozieren (wenn kein anderes Notepad-Fenster ge&ouml;ffnet ist)

$a = ControlGetFocus("[CLASS:Notepad]") ; Aktives Control des Notepad-Fensters ermitteln
MsgBox(262144, 'ControlGetFocus', 'CLassNameNN: ' & $a & @CRLF & '@error = ' & @error) ; Anzeige der Controlklasse und des Fehlercodes

ProcessClose($PID) ; Vom Skript ge&ouml;ffnetes Notepad-Fenster wieder schlie&szlig;en
