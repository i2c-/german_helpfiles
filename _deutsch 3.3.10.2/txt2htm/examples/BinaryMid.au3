#include <MsgBoxConstants.au3>

Local $binary = Binary("0x10203040") ; Erstellt Bin&auml;rdaten aus einem String
Local $extract = BinaryMid($binary, 2, 2)
MsgBox($MB_SYSTEMMODAL, "Das zweite und dritte Byte lautet: ", $extract)
