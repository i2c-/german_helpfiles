; *******************************************************
; Beispiel 1 - direkter Aufruf der MessageBox API
; *******************************************************

Local $result = DllCall("user32.dll", "int", "MessageBox", "hwnd", 0, "str", "Irgendein Text", "str", "Ein Titel", "int", 0)


; *******************************************************
; Beispiel 2 - Aufrufen einer Funktion, die Parameter ver&auml;ndert
; *******************************************************
Local $PID = Run('Notepad.exe')
WinWaitActive("[CLASS:Notepad]", '', 5)
Local $hwnd = WinGetHandle("[CLASS:Notepad]")
$result = DllCall("user32.dll", "int", "GetWindowText", "hwnd", $hwnd, "str", "", "int", 32768)
MsgBox(0, "Notepad-Info: L&auml;nge des Titels", $result[0]) ; Anzahl der zur&uuml;ckgegebenen Zeichen
MsgBox(0, "Notepad-Info: Fenstertitel", $result[2]) ; Zur&uuml;ckgegebener Text in Parameter 2
ProcessClose($PID)


; *******************************************************
; Beispiel 3 - Den Windows PickIconDlg anzeigen
; *******************************************************
Local $sFileName = @SystemDir & '\shell32.dll'

; Struktur erzeugen um den Iconindex abzuspeichern
Local $stIcon = DllStructCreate("int")
Local $stString = DllStructCreate("wchar[260]")
Local $structsize = DllStructGetSize($stString) / 2
DllStructSetData($stString, 1, $sFileName)

; Den PickIconDlg starten - '62' ist der Ordinalwert f&uuml;r diese Funktion
DllCall("shell32.dll", "none", 62, "hwnd", 0, "ptr", DllStructGetPtr($stString), "int", $structsize, "ptr", DllStructGetPtr($stIcon))

$sFileName = DllStructGetData($stString, 1)
Local $nIconIndex = DllStructGetData($stIcon, 1)

; Den neuen Dateinamen und den Iconindex anzeigen
MsgBox(0, "Icon-Info", "Die zuletzt ausgew&auml;hlte Datei: " & @LF & @LF & $sFileName & @LF & "Icon-Index: " & $nIconIndex)
