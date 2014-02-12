Run("notepad.exe")
Local $hWnd = WinWait("[CLASS:Notepad]")
If IsPtr($hWnd) Then
	MsgBox(4096, "", "Es ist ein g&uuml;ltiger Zeiger")
Else
	MsgBox(4096, "", "Es ist kein g&uuml;ltiger Zeiger")
EndIf
