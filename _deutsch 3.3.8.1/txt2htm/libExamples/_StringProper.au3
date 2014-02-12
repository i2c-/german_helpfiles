#include <String.au3>
; Gibt "Somebody Lastnames" zur&uuml;ck
MsgBox(0, '', _StringProper("somebody lastnames"))
; Gibt "Some.Body Last(Name)" zur&uuml;ck
MsgBox(0, '', _StringProper("SOME.BODY LAST(NAME)"))
Exit
