#include <Array.au3>
Local $sAttribute = FileGetAttrib(@ScriptFullPath) ; Gibt die Dateiattribute von diesem Skript zur&uuml;ck.
If @error Then
	MsgBox(4096, "Fehler", "Kann die Dateiattribute nicht auslesen.")
	Exit
Else
	If StringInStr($sAttribute, "R") Then ; Wenn der Attributs-String den Buchstaben "R" enth&auml;lt, dann ist die Datei schreibgesch&uuml;tzt.
		MsgBox(4096, "", "Die Datei ist schreibgesch&uuml;tzt.")
	EndIf
EndIf

; Erstellt ein eindimensionales Array, das die Buchstaben der Dateiattribute enth&auml;lt.
Local $aInput = StringSplit("R,A,S,H,N,D,O,C,T", ",")

; Erstellt ein eindimensionales Array, das die Dateiattributsbezeichnungen enth&auml;lt.
Local $aOutput = StringSplit("Read-only /, Archive /, System /, Hidden /" & _
		", Normal /, Directory /, Offline /, Compressed /, Temporary /", ",")

; Ersetzt innerhalb der Schleife die Buchstaben der Dateiattribute durch die Dateiattributsbezeichnungen, z.B. A wird durch Archive ersetzt.
For $i = 1 To $aInput[0]
	$sAttribute = StringReplace($sAttribute, $aInput[$i], $aOutput[$i], 0, 1)
Next

; Entfernt das einfache Leerzeichen und den angeh&auml;ngten Slash.
$sAttribute = StringTrimRight($sAttribute, 2)

; Gibt die konvertierten Dateiattributsbuchstaben aus.
MsgBox(4096, "Vollst&auml;ndige Dateiattribute:", $sAttribute)
