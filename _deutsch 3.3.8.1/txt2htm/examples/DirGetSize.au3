Local $size = DirGetSize(@HomeDrive)
MsgBox(0, "", "Gr&ouml;&szlig;e (MegaBytes):" & Round($size / 1024 / 1024))

$size = DirGetSize(@WindowsDir, 2)
MsgBox(0, "", "Gr&ouml;&szlig;e (MegaBytes):" & Round($size / 1024 / 1024))

Local $timer = TimerInit()
$size = DirGetSize("\\10.0.0.1\h$", 1)
Local $diff = Round(TimerDiff($timer) / 1000) ; Zeit in Sekunden
If IsArray($size) Then
	MsgBox(0, "DirGetSize-Info", "Gr&ouml;&szlig;e (Bytes):" & $size[0] & @LF _
			 & "Dateien:" & $size[1] & @LF & "Verzeichnisse:" & $size[2] & @LF _
			 & "TimeDiff (Sek):" & $diff)
EndIf
