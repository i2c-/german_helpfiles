Local $aArray[2] = [1, "Beispiel"]
Local $bBinary = Binary("0x00204060")
Local $fBoolean = False
Local $hWnd = WinGetHandle("[CLASS:Shell_TrayWnd]")
Local $iInt = 1
Local $nFloat = 2.0
Local $sString = "Etwas Text"
Local $vKeyword = Default

MsgBox(0, "Variablentypen", "$aArray ist ein " & VarGetType($aArray) & " Variablentyp." & @CRLF & _
		"$bBinary ist ein " & VarGetType($bBinary) & " Variablentyp." & @CRLF & _
		"$fBoolean ist ein " & VarGetType($fBoolean) & " Variablentyp." & @CRLF & _
		"$hWnd ist ein " & VarGetType($hWnd) & " Variablentyp." & @CRLF & _
		"$iInt ist ein " & VarGetType($iInt) & " Variablentyp." & @CRLF & _
		"$nFloat ist ein " & VarGetType($nFloat) & " Variablentyp." & @CRLF & _
		"$sString ist ein " & VarGetType($sString) & " Variablentyp." & @CRLF & _
		"$vKeyword ist ein " & VarGetType($vKeyword) & " Variablentyp." & @CRLF)
