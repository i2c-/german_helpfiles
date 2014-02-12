; Erstellt Callback Funktion
Local $handle = DllCallbackRegister("_EnumWindowsProc", "int", "hwnd;lparam")

; EnumWindows aufrufen
DllCall("user32.dll", "int", "EnumWindows", "ptr", DllCallbackGetPtr($handle), "lparam", 10)

; L&ouml;scht Callback-Funktion
DllCallbackFree($handle)

; Callback Verfahren
Func _EnumWindowsProc($hWnd, $lParam)
	If WinGetTitle($hWnd) <> "" And BitAND(WinGetState($hWnd), 2) Then
		Local $res = MsgBox(1, WinGetTitle($hWnd), "$hWnd=" & $hWnd & @CRLF & "lParam=" & $lParam & @CRLF & "$hWnd(type)=" & VarGetType($hWnd))
		If $res = 2 Then Return 0 ; Wenn Abbrechen geklickt, R&uuml;ckgabe 0 zum Stoppen der Aufz&auml;hlung
	EndIf
	Return 1 ; R&uuml;ckgabe 1 um die Aufz&auml;hlung fortzusetzten
EndFunc   ;==>_EnumWindowsProc
