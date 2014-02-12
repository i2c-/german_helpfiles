#include <MsgBoxConstants.au3>

Local $iTimeout = 10

; Zeigt ein Nachrichtenfenster mit Variablen innerhalb des Texts
MsgBox($MB_SYSTEMMODAL, "Titel", "Dieses Nachrichtenfenster wird sich nach " & $iTimeout & " schlie&szlig;en oder wenn der OK-Button gedr&uuml;ckt wurde.", $iTimeout)
