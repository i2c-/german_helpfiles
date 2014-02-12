; Demonstriert den Gebrauch von StdinWrite()
#include <Constants.au3>

Local $foo = Run("sort.exe", @SystemDir, @SW_HIDE, $STDIN_CHILD + $STDOUT_CHILD)
; Schreibt den zu sortierenden String in sort.exe's STDIN
StdinWrite($foo, "Ratte" & @CRLF & "Katze" & @CRLF & "Fledermaus" & @CRLF)
; Aufruf ohne zweites Argument schliesst den Stream
StdinWrite($foo)

; Lies aus dem Child's STDOUT und zeige es an
Local $data
While True
	$data &= StdoutRead($foo)
	If @error Then ExitLoop
	Sleep(25)
WEnd
MsgBox(0, "Debug", $data)
