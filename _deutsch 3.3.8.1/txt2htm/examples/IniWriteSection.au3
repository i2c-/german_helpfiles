; Das ist die INI Datei in die wir schreiben wollen. Sie wird auf dem Desktop erstellt.
Local $sIni = @DesktopDir & "\AutoIt-Test.ini"

; Demonstration vom erstellen einer neuen Sektion mit einem String.
Local $sData = "Key1=Value1" & @LF & "Key2=Value2" & @LF & "Key3=Value3"
IniWriteSection($sIni, "Sektion1", $sData)

; Demonstration vom erstellen einer neuen Sektion mit einem Array.
Local $aData1 = IniReadSection($sIni, "Sektion1") ; Lesen was wir oben geschrieben haben.
For $i = 1 To UBound($aData1) - 1
	$aData1[$i][1] &= "-" & $i ; &Auml;ndere die Daten
Next

IniWriteSection($sIni, "Sektion2", $aData1) ; Schreibt in eine neue Sektion

; Demonstration vom manuellen erstellen eines Arrays welches dann als Quelle f&uuml;r die INI verwendet wird.
Local $aData2[3][2] = [["ErsterSchl&uuml;ssel", "ErsterWert"],["ZweiterSchl&uuml;ssel", "ZweiterWert"],["DritterSchl&uuml;ssel", "DritterWert"]]
; Das Array welches wir erstellt haben startet bei Element 0. Wir m&uuml;ssen IniWriteSection() verwenden um bei Element 0 das Schreiben zu starten.
IniWriteSection($sIni, "Section3", $aData2, 0)
