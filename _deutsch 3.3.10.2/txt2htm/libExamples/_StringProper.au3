#include <String.au3>
#include <MsgBoxConstants.au3>

; Gibt "Somebody Lastnames" zur&uuml;ck
MsgBox($MB_SYSTEMMODAL, '', _StringProper("somebody lastnames"))
; Gibt "Some.Body Last(Name)" zur&uuml;ck
MsgBox($MB_SYSTEMMODAL, '', _StringProper("SOME.BODY LAST(NAME)"))
Exit
