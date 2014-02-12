#include <String.au3>

; F&uuml;gt drei Unterstriche ein und gibt diese in der Console aus
For $i_loop = -20 To 20
	ConsoleWrite($i_loop & @TAB & _StringInsert("Supercalifragilistic", "___", $i_loop) & @CRLF)
Next
