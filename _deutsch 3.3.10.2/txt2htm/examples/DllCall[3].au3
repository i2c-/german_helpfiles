#include <MsgBoxConstants.au3>

;Den Windows PickIconDlg anzeigen
Local $sFileName = @SystemDir & '\shell32.dll'

; Struktur erzeugen um den Iconindex abzuspeichern
Local $stIcon = DllStructCreate("int")
Local $stString = DllStructCreate("wchar[260]")
Local $structsize = DllStructGetSize($stString) / 2
DllStructSetData($stString, 1, $sFileName)

; Den PickIconDlg starten - '62' ist der Ordinalwert f&uuml;r diese Funktion
DllCall("shell32.dll", "none", 62, _
		"hwnd", 0, _
		"ptr", DllStructGetPtr($stString), _
		"int", $structsize, _
		"ptr", DllStructGetPtr($stIcon))

$sFileName = DllStructGetData($stString, 1)
Local $iIconIndex = DllStructGetData($stIcon, 1)

; Den neuen Dateinamen und den Iconindex anzeigen
MsgBox($MB_SYSTEMMODAL, "Info", "Die zuletzt ausgew&auml;hlte Datei: " & $sFileName & @CRLF & "Icon-Index: " & $iIconIndex)
