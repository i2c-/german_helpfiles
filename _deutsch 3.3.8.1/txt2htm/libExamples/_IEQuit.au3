; *******************************************************
; Beispiel 1 - Erstellt ein unsichtbares Browserfenster, navigiert zu einer Website, ruft einige Informationen auf und beendet den Internet-Explorer.
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://sourceforge.net", 0, 0)
; Zeigt den inneren Text in einem Element der Seite namens "sfmarquee"
Local $oMarquee = _IEGetObjByName($oIE, "sfmarquee")
MsgBox(0, "SourceForge Information", $oMarquee.innerText)
_IEQuit($oIE)
