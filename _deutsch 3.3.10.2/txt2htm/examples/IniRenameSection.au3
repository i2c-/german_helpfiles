#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Sektion in der ini mit der Struktur eines Strings.
	Local $sSection = "Title=AutoIt" & @CRLF & "Version=" & @AutoItVersion & @CRLF & "OS=" & @OSVersion

	; Schreibt den String in die Sektions 'General', 'Version' und 'andere'.
	IniWriteSection(@TempDir & "\Example.ini", "General", $sSection)
	IniWriteSection(@TempDir & "\Example.ini", "Version", $sSection)
	IniWriteSection(@TempDir & "\Example.ini", "andere", $sSection)

	; Benennt die Sektion 'General' in 'System' um.
	IniRenameSection(@TempDir & "\Example.ini", "General", "System")

	; Liest die Sektions der ini-Datei. Es wird ein 1-dimensionales Array zur&uuml;ckgegeben.
	Local $aArray = IniReadSectionNames(@TempDir & "\Example.ini")

	; Pr&uuml;ft, ob ein Fehler aufgetreten ist.
	If Not @error Then
		; Durchl&auml;uft das Array und stellt die einzelnen Sektions dar.
		For $i = 1 To $aArray[0]
			MsgBox($MB_SYSTEMMODAL, "", "Sektion: " & $aArray[$i])
		Next
	EndIf

	; L&ouml;scht die ini-Datei.
	FileDelete(@TempDir & "\Example.ini")
EndFunc   ;==>Example
