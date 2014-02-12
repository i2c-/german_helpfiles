#include <MsgBoxConstants.au3>
Local $bBinary = Binary("0x00204060")
Local $sString = "0x00204060"

MsgBox($MB_SYSTEMMODAL, "Gibt 1 zur&uuml;ck, wenn die Variable bin&auml;r ist", IsBinary($bBinary))
MsgBox($MB_SYSTEMMODAL, "Gibt 1 zur&uuml;ck, wenn die Variable ein String ist", IsBinary($sString))
