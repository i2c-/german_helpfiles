#include<File.au3>

Local $avCommon = _FileListToArray(@CommonFilesDir)
Local $avUser = _FileListToArray(@UserProfileDir)
Local $sFile = @ScriptDir & "\Test.txt"

; Schreibt zuerst das Array in die angegebene Datei
_FileWriteFromArray($sFile, $avCommon, 1)

; &Ouml;ffnet die Datei und h&auml;ngt das zweite Array ans Ende der Datei an
Local $hFile = FileOpen($sFile, 1) ; 1 = append (anh&auml;ngen)
_FileWriteFromArray($hFile, $avUser, 1)
FileClose($hFile)

; Ergebnis anzeigen
Run("notepad.exe " & $sFile)
