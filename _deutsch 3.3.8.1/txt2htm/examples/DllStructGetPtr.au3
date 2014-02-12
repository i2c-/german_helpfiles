; Beispiel 1
; Windows-Handle und Position auslesen
Local $hwnd = WinGetHandle("")
Local $coor = WinGetPos($hwnd)

; Struktur erzeugen
Local $rect = DllStructCreate("int;int;int;int")

; DLL-Funktion aufrufen
DllCall("user32.dll", "int", "GetWindowRect", _
		"hwnd", $hwnd, _
		"ptr", DllStructGetPtr($rect)) ; Zeiger auf Struktur mit DllStructGetPtr &uuml;bergeben

; Rechteckdaten auslesen
Local $l = DllStructGetData($rect, 1)
Local $t = DllStructGetData($rect, 2)
Local $r = DllStructGetData($rect, 3)
Local $b = DllStructGetData($rect, 4)

; Struktur freigeben
$rect = 0

; Windows-Position und Rechteckdaten ausgeben
MsgBox(0, "The Larry Test :)", "WinGetPos(): (" & $coor[0] & "," & $coor[1] & _
		") (" & $coor[2] + $coor[0] & "," & $coor[3] + $coor[1] & ")" & @CRLF & _
		"GetWindowRect(): (" & $l & "," & $t & ") (" & $r & "," & $b & ")")

; Beispiel 2
; DllStructGetPtr zum Erzeugen einer Referenz auf ein Strukturelement (vergleichbar mit union in C++)
Local $a = DllStructCreate("int")
If @error Then
	MsgBox(0, "", "Fehler in DllStructCreate " & @error);
	Exit
EndIf

$b = DllStructCreate("uint", DllStructGetPtr($a, 1))
If @error Then
	MsgBox(0, "", "Fehler in DllStructCreate " & @error);
	Exit
EndIf

Local $c = DllStructCreate("float", DllStructGetPtr($a, 1))
If @error Then
	MsgBox(0, "", "Fehler in DllStructCreate " & @error);
	Exit
EndIf

;Daten eintragen
DllStructSetData($a, 1, -1)

;=========================================================
;	Ausgeben der verschiedenen Datentypen
;=========================================================
MsgBox(0, "DllStruct", _
		"int: " & DllStructGetData($a, 1) & @CRLF & _
		"uint: " & DllStructGetData($b, 1) & @CRLF & _
		"float: " & DllStructGetData($c, 1) & @CRLF & _
		"")

; Struktur freigeben
$a = 0
