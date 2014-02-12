; Erstellt 0x10203040 als Bin&auml;rdatum
Local $binary = Binary("0x10203040")
Local $extract = BinaryMid($binary, 2, 2)
MsgBox(0, "Das zweite und dritte Byte lautet: ", $extract)
