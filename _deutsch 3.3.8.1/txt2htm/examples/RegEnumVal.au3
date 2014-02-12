For $i = 1 To 100
	Local $var = RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\Autoit", $i)
	If @error <> 0 Then ExitLoop
	MsgBox(4096, "Wertname  #" & $i & " unter dem AutoIt3 Schl&uuml;ssel", $var)
Next
