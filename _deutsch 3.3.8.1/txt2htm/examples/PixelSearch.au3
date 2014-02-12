; Findet ein rotes Pixel im Rechteck 0,0-200,300.
Local $coord = PixelSearch(0, 0, 200, 300, 0xFF0000)
If Not @error Then
	MsgBox(0, "Die Koordinaten X und Y lauten:", $coord[0] & "," & $coord[1])
EndIf


; Findet ein rotes Pixel oder ein Pixel mit 100 Abstufungen (Variationen) von reinem Rot.
$coord = PixelSearch(0, 0, 200, 300, 0xFF0000, 100)
If Not @error Then
	MsgBox(0, "Die Koordinaten X und Y lauten:", $coord[0] & "," & $coord[1])
EndIf
