; Demonstriert StdoutRead()
#include <Constants.au3>

Local $foo = Run(@ComSpec & " /c dir foo.bar", @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
Local $line
While 1
	$line = StdoutRead($foo)
	If @error Then ExitLoop
	MsgBox(0, "STDOUT gelesen:", $line)
WEnd

While 1
	$line = StderrRead($foo)
	If @error Then ExitLoop
	MsgBox(0, "STDERR gelesen:", $line)
WEnd

MsgBox(0, "Debug", "Wie aufregend...")
