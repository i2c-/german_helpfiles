#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Schreibt den Wert von 'AutoIt' in den Schl&uuml;ssel 'Titel' und in die Sektion 'General'.
	IniWrite(@TempDir & "\Example.ini", "General", "Titel", "AutoIt")

	; Liest in der ini-Datei den Wert von 'Titel' in der Sektion 'General'.
	Local $sRead = IniRead(@TempDir & "\Example.ini", "General", "Titel", "Default Value")

	; Zeigt den Wert der von IniRead zur&uuml;ckgegeben wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert von 'Titel' in der Sektion 'General' lautet: " & $sRead)

	; L&ouml;scht den Schl&uuml;ssel 'Titel'
	IniDelete(@TempDir & "\Example.ini", "General", "Titel")

	; Liest in der ini-Datei den Wert von 'Titel' in der Sektion 'General'.
	$sRead = IniRead(@TempDir & "\Example.ini", "General", "Titel", "Default Value")

	; Zeigt den Wert der von IniRead zur&uuml;ckgegeben wurde. Falls es dort keinen Schl&uuml;ssel gibt, wird der Standardwert &uuml;bergeben von IniRead angezeigt.
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert von 'Titel' in der Sektion 'General' lautet: " & $sRead)

	; L&ouml;scht die ini-Datei.
	FileDelete(@TempDir & "\Example.ini")
EndFunc   ;==>Example
