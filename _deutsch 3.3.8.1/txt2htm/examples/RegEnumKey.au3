For $i = 1 To 10
	Local $var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE", $i)
	If @error <> 0 Then ExitLoop
	MsgBox(4096, "Unterschl&uuml;ssel #" & $i & " unter HKLM\Software: ", $var)
Next
