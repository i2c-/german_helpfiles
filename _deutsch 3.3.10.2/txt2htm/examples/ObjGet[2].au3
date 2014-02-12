#include <MsgBoxConstants.au3>

; wie man eine Objektreferenz &uuml;ber den Dateinamen erh&auml;lt
; Eine Excel Datei mit dem Namen Worksheet.xls muss im Hauptverzeichnis C:\
; Vorhanden sein, damit das Beispiel funktioniert.

Example()

Func Example()
	Local $sFileName = "C:\Worksheet.xls"

	If Not FileExists($sFileName) Then
		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Test kann nicht ausgef&uuml;hrt werden, weil diese Exeldatei nicht existiert: " & $sFileName)
		Return False
	EndIf

	Local $oExcelDoc = ObjGet($sFileName) ; Die Excel Objektreferenz mit dem Dateinamen erzeugen

	If IsObj($oExcelDoc) Then

		; Tipp: Folgende Zeilen entkommentieren um Excel sichtbar zu machen (credit: DaleHohm)
		; $oExcelDoc.Windows(1).Visible = 1	 ; Das erste Arbeitsblatt in der Arbeitsmappe sichtbar machen
		; $oExcelDoc.Application.Visible = 1 ; Die Anwendung anzeigen (ohne dies wird Excel beendet)

		Local $sString = "" ; String f&uuml;r Anzeigezwecke

		For $oProperty In $oExcelDoc.BuiltinDocumentProperties
			$sString &= $oProperty.Name & ":" & $oProperty.Value & @CRLF
		Next

		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Die Dokumenteneigenschaften von " & $sFileName & " sind:" & @CRLF & @CRLF & $sString)

		$oExcelDoc.Close ; Exceldokument schlie&szlig;en

	Else
		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Fehler: Die Datei " & $sFileName & " konnte nicht als Excelobjekt ge&ouml;ffnet werden.")
	EndIf
EndFunc   ;==>Example
