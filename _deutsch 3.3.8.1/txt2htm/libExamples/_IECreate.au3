; *******************************************************
; Beispiel 1 - Erstellt ein Browserfenster und navigiert zu einer Webseite.
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("www.autoit.de")

; *******************************************************
; Beispiel 2 - Erstellt neue Browserfenster, die 3 verschiedene URL zeigen,
;               auch wenn noch keine existiert ($f_tryAttach = 1) nicht warten,
;                bis die Seite fertig geladen ist ($f_wait = 0).
; *******************************************************

#include <IE.au3>

_IECreate("www.autoitscript.com", 1, 1, 0)
_IECreate("http://www.autoit.de/hilfe/", 1, 1, 0)
_IECreate("www.metager2.de", 1, 1, 0)

; *******************************************************
; Beispiel 3 - Versucht einen bereits existierenden Browser anzusprechen, der eine spezielle Webseiten-URL anzeigt.
;               Erstellt einen neuen Browser und navigiert zu dieser Seite, falls sie noch nicht existiert.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("www.autoit.de", 1)
; Der Wiedergabewert @extended muss &uuml;berpr&uuml;ft werden, um zu checken, ob das Verbinden erfolgreich war.
If @extended Then
	MsgBox(0, "", "An existierenden Browser angeh&auml;ngt")
Else
	MsgBox(0, "", "Neuen Browser erzeugt")
EndIf

; *******************************************************
; Beispiel 4 - Erstellt ein unsichtbares Browserfenster, navigiert zu einer
;               Webseite, fragt Informationen ab und schlie&szlig;t den Browser.

; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://dict.leo.org", 0, 0)
Local $oElement = "keywords"
; Zeigt den "content" des Elementes mit dem Namen "keywords" auf der Seite an.
Local $oInfo = _IEGetObjByName($oIE, $oElement)
MsgBox(0, "Objektinformation: " & $oElement, $oInfo.content)
_IEQuit($oIE)

; *******************************************************
; Beispiel 5 - Erstellt ein Browser-Fenster, welches an eine neue Instanz von iexplore.exe angeh&auml;ngt wird.
;				Dies ist oft notwendig, um einen neuen Cookie-Kontext der Sitzung zu erhalten.
;				(Sitzungs-Cookies sind f&uuml;r alle Browserinstanzen, die die gleiche iexplore.exe verwenden).
; *******************************************************

#include <IE.au3>

ShellExecute("iexplore.exe", "about:blank")
WinWait("Leere Seite")
$oIE = _IEAttach("about:blank", "url")
_IELoadWait($oIE)
_IENavigate($oIE, "http://www.heise.de")

; *******************************************************
; Beispiel 6 - Erstellt ein leeres Browserfenster und versieht es mit eigenem HTML-Text.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate()
$sHTML = "<h1>Hallo Welt!</h1>"
_IEBodyWriteHTML($oIE, $sHTML)
