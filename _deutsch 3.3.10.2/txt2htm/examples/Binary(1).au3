#include <MsgBoxConstants.au3>

Local $bBinary = Binary("0x00204060") ; konvertiert einen String in eine bin&auml;re Darstellung

MsgBox($MB_SYSTEMMODAL, "Gibt 1 zur&uuml;ck, wenn die Variable bin&auml;r ist", IsBinary($bBinary))
