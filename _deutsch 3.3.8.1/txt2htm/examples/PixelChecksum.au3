; Wartet, bis sich in der Region 0,0 bis 150,150 etwas ver&auml;ndert

; Startwert der zu pr&uuml;fenden Checksumme ermitteln
Local $checksum = PixelChecksum(0, 0, 150, 150)

; Wartet, bis sich die Region ver&auml;ndert. Die Region wird alle 100ms &uuml;berpr&uuml;ft, um die CPU-Last niedrig zu halten.
While $checksum = PixelChecksum(0, 0, 150, 150)
	Sleep(100)
WEnd

MsgBox(0, "", "In der Region trat eine &Auml;nderung auf!")
