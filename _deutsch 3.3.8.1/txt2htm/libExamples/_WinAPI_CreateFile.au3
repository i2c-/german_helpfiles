#include <WinAPI.au3>

Global $sFile, $hFile, $sText, $nBytes, $tBuffer

; 1) Erstellt eine Datei und schreibt Daten hinein
$sFile = @ScriptDir & '\test.txt'
$sText = 'abcdefghijklmnopqrstuvwxyz'
$tBuffer = DllStructCreate("byte[" & StringLen($sText) & "]")
DllStructSetData($tBuffer, 1, $sText)
$hFile = _WinAPI_CreateFile($sFile, 1)
_WinAPI_WriteFile($hFile, DllStructGetPtr($tBuffer), StringLen($sText), $nBytes)
_WinAPI_CloseHandle($hFile)
; Ausgabe in die Konsole
ConsoleWrite('1) ' & FileRead($sFile) & @CRLF)

; 2) liest 6 Bytes ab Position 3
$tBuffer = DllStructCreate("byte[6]")
$hFile = _WinAPI_CreateFile($sFile, 2, 2)
_WinAPI_SetFilePointer($hFile, 3)
_WinAPI_ReadFile($hFile, DllStructGetPtr($tBuffer), 6, $nBytes)
_WinAPI_CloseHandle($hFile)
$sText = BinaryToString(DllStructGetData($tBuffer, 1))
; Ausgabe in die Konsole
ConsoleWrite('2) ' & $sText & @CRLF)

; 3) Schreibt die vorher gelesenen 6 Bytes an die gleiche Position, aber in Gro&szlig;buchstaben
DllStructSetData($tBuffer, 1, StringUpper($sText))
$hFile = _WinAPI_CreateFile($sFile, 2, 4)
_WinAPI_SetFilePointer($hFile, 3)
_WinAPI_WriteFile($hFile, DllStructGetPtr($tBuffer), 6, $nBytes)
_WinAPI_CloseHandle($hFile)
$tBuffer = 0
; Ausgabe in die Konsole
ConsoleWrite('3) ' & FileRead($sFile) & @CRLF)

; 4) k&uuml;rze die Dateigr&ouml;&szlig;e auf 12 Bytes
$hFile = _WinAPI_CreateFile($sFile, 2, 4)
_WinAPI_SetFilePointer($hFile, 12)
_WinAPI_SetEndOfFile($hFile)
_WinAPI_CloseHandle($hFile)
; Ausgabe in die Konsole
ConsoleWrite('4) ' & FileRead($sFile) & @CRLF)

FileDelete($sFile)
