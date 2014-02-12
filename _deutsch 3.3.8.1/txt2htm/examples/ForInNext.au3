; Verwendung eines Array's
Local $aArray[4]

$aArray[0] = "a"
$aArray[1] = 0
$aArray[2] = 1.3434
$aArray[3] = "test"

Local $string = ""
For $element In $aArray
	$string = $string & $element & @CRLF
Next

MsgBox(0, "For..IN Arraytest", "Das Ergebnis lautet: " & @CRLF & $string)

; Verwendung eines Objektes

Local $oShell = ObjCreate("shell.application")
Local $oShellWindows = $oShell.windows

If IsObj($oShellWindows) Then
	$string = ""

	For $Window In $oShellWindows
		$string = $string & $Window.LocationName & @CRLF
	Next

	MsgBox(0, "", "Es gibt folgende ge&ouml;ffnete Fenster:" & @CRLF & $string)
Else

	MsgBox(0, "", "Es gibt keine ge&ouml;ffneten Fenster.")
EndIf
