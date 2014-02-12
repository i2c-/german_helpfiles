#include <File.au3>
#include <Array.au3>

Local $FileList = _FileListToArray(@DesktopDir)
If @error = 1 Then
	MsgBox(0, "", "Keine Ordner gefunden.")
	Exit
EndIf
If @error = 4 Then
	MsgBox(0, "", "Keine Dateien gefunden.")
	Exit
EndIf
_ArrayDisplay($FileList, "$FileList")
