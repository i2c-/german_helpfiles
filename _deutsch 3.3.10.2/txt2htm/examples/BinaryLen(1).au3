#include <MsgBoxConstants.au3>

Local $binary = Binary("0x10203040") ; Erstellt bin&auml;re Daten aus einem String
MsgBox($MB_SYSTEMMODAL, "Die L&auml;nge der bin&auml;ren Daten ist:", BinaryLen($binary))
