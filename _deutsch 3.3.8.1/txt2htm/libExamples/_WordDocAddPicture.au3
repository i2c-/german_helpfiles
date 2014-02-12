; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster mit einem neuen leeren Dokument
;				und f&uuml;gt dann ein paar Bilder in das Dokument ein.
; *******************************************************
;
#include <Word.au3>

Local $sPath = @WindowsDir & "\"
Local $search = FileFindFirstFile($sPath & "*.bmp")

; Pr&uuml;ft, ob die Suche erfolgreich war
If $search = -1 Then
	MsgBox(0, "Fehler", "Keine Bilder gefunden")
	Exit
EndIf

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)

While 1
	Local $file = FileFindNextFile($search)
	If @error Then ExitLoop
	Local $oShape = _WordDocAddPicture($oDoc, $sPath & $file, 0, 1)
	If Not @error Then $oShape.Range.InsertAfter(@CRLF)
WEnd

; Schlie&szlig;t das Suchhandle
FileClose($search)
