Local $aArray = DriveGetDrive("ALL")
If @error Then
	; Es trat ein Fehler w&auml;hrend dem ermitteln der Laufwerke auf.
	MsgBox(4096, "DriveGetDrive", "Ein Fehler trat auf.")
Else
	For $i = 1 To $aArray[0]
		; Zeigt alle gefundenen Laufwerke. Der Laufwerksbuchstabe wurde auf Gro&szlig;schreibung ge&auml;ndert.
		MsgBox(4096, "DriveGetDrive", "Laufwerk " & $i & "/" & $aArray[0] & ":" & @CRLF & StringUpper($aArray[$i]))
	Next
EndIf
