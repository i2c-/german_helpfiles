#include <Misc.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, '', "Dies sollte 1 zur&uuml;ckgeben: " & _VersionCompare("25.2.1", "5.2.1"))
MsgBox($MB_SYSTEMMODAL, '', "Dies sollte 1 zur&uuml;ckgeben: " & _VersionCompare("5.12.0", "5.2.1"))
MsgBox($MB_SYSTEMMODAL, '', "Dies sollte -1 zur&uuml;ckgeben: " & _VersionCompare('10.0.0.0', '2,10,0,0'))
