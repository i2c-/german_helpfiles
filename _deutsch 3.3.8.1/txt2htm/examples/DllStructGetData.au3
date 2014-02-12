; Erstellen der DLL Struct, die in der DllCall Funktion benutzt wird:
Local $tagOSVERSIONINFO = DllStructCreate('dword dwOSVersionInfoSize;dword dwMajorVersion;dword dwMinorVersion;dword dwBuildNumber;dword dwPlatformId;char szCSDVersion[128]')

; Aktualisierung der Gr&ouml;&szlig;e vom "Size" Element der Struct. Darin soll die Gesamtgr&ouml;&szlig;e der Struct (DllStructGetSize()) gepseichert werden.
DllStructSetData($tagOSVERSIONINFO, 'dwOSVersionInfoSize', DllStructGetSize($tagOSVERSIONINFO))

; DllCall um die API Funktion "GetVersionEx" aufzurufen und an die Struct weiterzuleiten:
Local $aReturn = DllCall('kernel32.dll', 'int', 'GetVersionEx', 'struct*', $tagOSVERSIONINFO)
If @error Or Not $aReturn[0] Then
	MsgBox(0, "DLLCall Error", "Systeminformationen konnten aufgrund eines Fehlers nicht gelesen werden.")
EndIf

; Auslesen der Daten von den Element-Strings:
Local $iMajorVersion = DllStructGetData($tagOSVERSIONINFO, 'dwMajorVersion')
Local $iMinorVersion = DllStructGetData($tagOSVERSIONINFO, 'dwMinorVersion')
Local $iBuildNumber = DllStructGetData($tagOSVERSIONINFO, 'dwBuildNumber')
Local $sServicePack = DllStructGetData($tagOSVERSIONINFO, 'szCSDVersion')

; Struct "l&ouml;schen":
$tagOSVERSIONINFO = 0

MsgBox(0, "System", "Version: " & $iMajorVersion & @CRLF & _
		"Unterversion: " & $iMinorVersion & @CRLF & _
		"Build: " & $iBuildNumber & @CRLF & _
		"Service Pack: " & $sServicePack & @CRLF)
