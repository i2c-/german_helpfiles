; Beispiel wie man eine Objektreferenz &uuml;ber den Klassennamen erh&auml;lt
;
; Excel muss gestartet sein, damit das Beispiel funktioniert

Local $oExcel = ObjGet("", "Excel.Application") ; Existierendes Excel Objekt referenzieren

If @error Then
	MsgBox(0, "ExcelTest", "Fehler beim Referenzieren eines bestehenden Excel Objekts. Fehlernummer: " & Hex(@error, 8))
	Exit
EndIf

$oExcel.Visible = 1 ; Das Objekt anzeigen
$oExcel.workbooks.add ; Eine neue Arbeitsmappe hinzuf&uuml;gen
Exit



; Beispiel wie man eine Objektreferenz &uuml;ber den Dateinamen erh&auml;lt
;
; Eine Excel Datei mit dem Namen Worksheet.xls muss im Hauptverzeichnis C:\
; Vorhanden sein, damit das Beispiel funktioniert.

Local $FileName = "C:\Worksheet.xls"

If Not FileExists($FileName) Then
	MsgBox(0, "Excel Datei Test", "Test kann nicht ausgef&uuml;hrt werden, weil diese Exeldatei nicht existiert: " & $FileName)
	Exit
EndIf

Local $oExcelDoc = ObjGet($FileName) ; Die Excel Objektreferenz mit dem Dateinamen erzeugen

If IsObj($oExcelDoc) Then

	; Tipp: Folgende Zeilen entkommentieren um Excel sichtbar zu machen (credit: DaleHohm)
	; $oExcelDoc.Windows(1).Visible = 1	; Das erste Arbeitsblatt in der Arbeitsmappe sichtbar machen
	; $oExcelDoc.Application.Visible = 1	; Die Anwendung anzeigen (ohne dies wird Excel beendet)

	Local $String = "" ; String f&uuml;r Anzeigezwecke

	; Einige Dokumenteneigenschaften geben keinen Wert zur&uuml;ck, das werden wir ignorieren
	Local $OEvent = ObjEvent("AutoIt.Error", "nothing"); Vergleichbar mit On Error Resume Next in VBscript

	For $Property In $oExcelDoc.BuiltinDocumentProperties
		$String = $String & $Property.Name & ":" & $Property.Value & @CRLF
	Next

	MsgBox(0, "Excel Datei Test", "Die Dokumenteneigenschaften von " & $FileName & " sind:" & @CRLF & @CRLF & $String)

	$oExcelDoc.Close ; Exceldokument schlie&szlig;en

Else
	MsgBox(0, "Excel Datei Test", "Fehler: Die Datei " & $FileName & " konnte nicht als Excelobjekt ge&ouml;ffnet werden.")
EndIf
