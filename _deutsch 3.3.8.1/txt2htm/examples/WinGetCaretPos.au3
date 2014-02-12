Local $a = WinGetCaretPos()
If Not @error Then ToolTip("Erste Methode: Position", $a[0], $a[1])
Sleep(2000)

Local $b = _CaretPos()
If Not @error Then ToolTip("Zweite Methode: Position", $b[0], $b[1])
Sleep(2000)

;Eine zuverl&auml;ssigere Methode, um die Koordinaten in MDI Texteditoren herauszufinden ("Multiple Document Interface")
Func _CaretPos()
	Local $x_adjust = 5
	Local $y_adjust = 40

	Opt("CaretCoordMode", 0) ; Relativer Modus
	Local $c = WinGetCaretPos() ; Relative Cursor Koordinaten
	Local $w = WinGetPos("") ; Fenster Koordinaten
	Local $f = ControlGetFocus("", "") ; Textregion "handle"
	Local $e = ControlGetPos("", "", $f) ; Textregion Koordinaten

	Local $t[2]
	If IsArray($c) And IsArray($w) And IsArray($e) Then
		$t[0] = $c[0] + $w[0] + $e[0] + $x_adjust
		$t[1] = $c[1] + $w[1] + $e[1] + $y_adjust
		Return $t ; Absolute Bildschirm Koordinaten des Cursors
	Else
		SetError(1)
	EndIf
EndFunc   ;==>_CaretPos
