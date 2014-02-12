; Erstellt auf dem Desktop eine Verkn&uuml;pfung zu der explorer.exe und setzt ctrl+alt+t als Tastenkombination (in AutoIt ^!t)
FileCreateShortcut(@WindowsDir & "\Explorer.exe", @DesktopDir & "\Shortcut Test.lnk", @WindowsDir, "/e,c:\", "ToolTip-Beschreibung der Verkn&uuml;pfung", @SystemDir & "\shell32.dll", "^!t", "15", @SW_MINIMIZE)

; Ermittelt die Details der Verkn&uuml;pfung.
Local $aDetails = FileGetShortcut(@DesktopDir & "\Beispielverkn&uuml;pfung.lnk")
If Not @error Then
	MsgBox(0, "FileGetShortcut", "Verkn&uuml;pfungsziel: " & $aDetails[0] & @CRLF & _
			"Arbeitsverzeichnis: " & $aDetails[1] & @CRLF & _
			"Argumente: " & $aDetails[2] & @CRLF & _
			"Beschreibung: " & $aDetails[3] & @CRLF & _
			"Dateiname des Icons: " & $aDetails[4] & @CRLF & _
			"Index des Icons: " & $aDetails[5] & @CRLF & _
			"Verkn&uuml;pfungsstatus: " & $aDetails[6] & @CRLF)
EndIf
