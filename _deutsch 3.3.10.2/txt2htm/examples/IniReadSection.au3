#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Sektion in der ini mit der Struktur eines Strings.
	Local $sSection = "Titel=AutoIt" & @CRLF & "Version=" & @AutoItVersion & @CRLF & "OS=" & @OSVersion

	; Schreibt den String in die Sektion 'General'.
	IniWriteSection(@TempDir & "\Example.ini", "General", $sSection)

	; Liest die Sektion 'General'. Es wird ein 2-dimensionales Array zur&uuml;ckgegeben.
	Local $aArray = IniReadSection(@TempDir & "\Example.ini", "General")

	; Pr&uuml;ft, ob ein Fehler aufgetreten ist.
	If Not @error Then
		; Durchl&auml;uft das Array und stellt die einzelnen Schl&uuml;ssel und deren Werte dar.
		For $i = 1 To $aArray[0][0]
			MsgBox($MB_SYSTEMMODAL, "", "Schl&uuml;ssel: " & $aArray[$i][0] & @CRLF & "Wert: " & $aArray[$i][1])
		Next
	EndIf

	; L&ouml;scht die ini-Datei.
	FileDelete(@TempDir & "\Example.ini")
EndFunc   ;==>Example
