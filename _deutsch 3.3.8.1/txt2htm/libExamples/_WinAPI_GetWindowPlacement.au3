#include <WinAPI.au3>

Local $hWnd, $iRET, $pStruct, $sMsg, $stRET

; Eine Notepad-Instanz erzeugen
Run("notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]")
WinMove($hWnd, "", 256, 256, 400, 400)
Sleep(1000)

; Minimiert das Fenster, danach Ausgabe der Positionswerte, die mit _WinAPI_GetWindowPlacement() ermittelt werden
WinSetState($hWnd, "", @SW_MINIMIZE)
$stRET = _WinAPI_GetWindowPlacement($hWnd)
If @error = 0 Then
	$sMsg = "$stWindowPlacement:" & @CRLF
	$sMsg &= @TAB & "L&auml;nge der Struktur = " & DllStructGetData($stRET, "length") & " Byte" & @CRLF
	$sMsg &= @TAB & "Flags = " & DllStructGetData($stRET, "flags") & @CRLF
	$sMsg &= @TAB & "showCmd = " & DllStructGetData($stRET, "showCmd") & @CRLF & @CRLF
	$sMsg &= "ptMinPosition:" & @CRLF
	$sMsg &= @TAB & "MinX = " & DllStructGetData($stRET, "ptMinPosition", 1) & @CRLF
	$sMsg &= @TAB & "MinY = " & DllStructGetData($stRET, "ptMinPosition", 2) & @CRLF & @CRLF
	$sMsg &= "ptMaxPosition:" & @CRLF
	$sMsg &= @TAB & "MaxX = " & DllStructGetData($stRET, "ptMaxPosition", 1) & @CRLF
	$sMsg &= @TAB & "MaxY = " & DllStructGetData($stRET, "ptMaxPosition", 2) & @CRLF & @CRLF
	$sMsg &= "rcNormalPosition:" & @CRLF
	$sMsg &= @TAB & "links = " & DllStructGetData($stRET, "rcNormalPosition", 1) & @CRLF
	$sMsg &= @TAB & "oben = " & DllStructGetData($stRET, "rcNormalPosition", 2) & @CRLF
	$sMsg &= @TAB & "rechts = " & DllStructGetData($stRET, "rcNormalPosition", 3) & @CRLF
	$sMsg &= @TAB & "unten = " & DllStructGetData($stRET, "rcNormalPosition", 4)
	MsgBox(64, "Erfolg", $sMsg)

	; &Auml;ndert das normalisierte Rechteck mit _WinAPI_SetWindowPlacement(), danach das Fenster wiederherstellen
	DllStructSetData($stRET, "rcNormalPosition", 128, 1); Links
	DllStructSetData($stRET, "rcNormalPosition", 128, 2); Oben
	DllStructSetData($stRET, "rcNormalPosition", @DesktopWidth - 128, 3); Rechts
	DllStructSetData($stRET, "rcNormalPosition", @DesktopHeight - 128, 4); Unten
	$pStruct = DllStructGetPtr($stRET); Zeiger zur modifizierten Struktur ermitteln
	$iRET = _WinAPI_SetWindowPlacement($hWnd, $pStruct)
	If @error = 0 Then
		WinSetState($hWnd, "", @SW_RESTORE)
		ControlSetText($hWnd, "", "Edit1", "_WinAPI_SetWindowPlacement() war erfolgreich!")
	Else
		MsgBox(16, "Fehler", "_WinAPI_SetWindowPlacement() schlug fehl!" & @CRLF & _
				"$iRET = " & $iRET & @CRLF & _
				"@error = " & @error & @CRLF & _
				"@extended = " & @extended)
	EndIf
Else
	MsgBox(16, "Fehler", "_WinAPI_GetWindowPlacement() schlug fehl!" & @CRLF & _
			"$stRET = " & $stRET & @CRLF & _
			"@error = " & @error & @CRLF & _
			"@extended = " & @extended)
EndIf
