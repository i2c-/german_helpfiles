; Demonstriert StdioClose()
#include <Constants.au3>

Local $pid = Run(@ComSpec & " /c dir foo.bar", @SystemDir, @SW_HIDE, $STDERR_MERGED + $STDOUT_CHILD)
StdioClose($pid)

; Es werden keine Daten gelesen, weil der Stream, aus dem gelesen werden soll, vorher geschlossen wurde.
Local $line
While 1
	$line = StdoutRead($pid)
	If @error Then ExitLoop
	MsgBox(0, "STDOUT gelesen:", $line)
WEnd

While 1
	$line = StderrRead($pid)
	If @error Then ExitLoop
	MsgBox(0, "STDERR gelesen:", $line)
WEnd

MsgBox(0, "Debug", "Beenden...")
