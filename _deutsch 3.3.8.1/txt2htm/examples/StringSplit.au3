#include<Array.au3>

Local $days = StringSplit("So,Mo,Di,Mi,Do,Fr,Sa", ",")
;$days[1] enth&auml;lt "So" ... $days[7] enth&auml;lt "Sa"
MsgBox(0, "Tage", $days[1])
MsgBox(0, "Tage", $days[7])

Local $text = "Diese\nLinie\nenth&auml;lt\nC-style Pausen."
Local $array = StringSplit($text, '\n', 1)
_ArrayDisplay($array)
