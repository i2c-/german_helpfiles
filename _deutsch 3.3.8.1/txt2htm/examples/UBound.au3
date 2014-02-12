Local $myArray[10][20] ; Element 0,0 bis 9,19
Local $rows = UBound($myArray)
Local $cols = UBound($myArray, 2)
Local $dims = UBound($myArray, 0)

MsgBox(0, "Das " & $dims & "-dimensionale Array hat", _
		$rows & " Zeilen, " & $cols & " Spalten")

; Zeigt den Inhalt von $myArray
Local $output = ""
For $r = 0 To UBound($myArray, 1) - 1
	$output = $output & @LF
	For $c = 0 To UBound($myArray, 2) - 1
		$output = $output & $myArray[$r][$c] & " "
	Next
Next
MsgBox(4096, "Inhalt des Arrays", $output)
