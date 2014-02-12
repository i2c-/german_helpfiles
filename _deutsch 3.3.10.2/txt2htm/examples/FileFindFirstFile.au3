#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist eine lokale Variable dem Handle von allen DSateien in dem aktuellen Verzeichnis zu.
	Local $hSearch = FileFindFirstFile("*.*")

	; Pr&uuml;ft, ob die Suche erfolgreich war. Falls nicht wird eine Nachricht dargestellt und False zur&uuml;ckgegeben.
	If $hSearch = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Fehler: Es passt keine Dateien bzw. Ordner zu dem Suchmuster.")
		Return False
	EndIf

	;Weist eine lokale Variable dem leeren String zu welcher die Namen der gefundenen Dateien enth&auml;lt.
	Local $sFileName = "", $iResult = 0

	While 1
		$sFileName = FileFindNextFile($hSearch)
		; Falls es keine passenden Dateien mehr gibt.
		If @error Then ExitLoop

		; Zeigt den Dateienamen.
		$iResult = MsgBox(BitOR($MB_SYSTEMMODAL, $MB_OKCANCEL), "", "Datei: " & $sFileName)
		If $iResult <> $IDOK Then ExitLoop ; Falls der Benutzer den Abbrechen oder Schlie&szlig;en Button anklickt.
	WEnd

	; Schlie&szlig;t das Suchhandle.
	FileClose($hSearch)
EndFunc   ;==>Example
