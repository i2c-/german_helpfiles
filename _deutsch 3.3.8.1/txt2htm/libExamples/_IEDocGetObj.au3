; *******************************************************
; Beispiel 1 - &Ouml;ffnet den Browser mit der AutoIt Homepage, holt sich die Referenz
;				auf das Dokumentobjekt und zeigt ein Dokumentattribut an
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oDoc = _IEDocGetObj($oIE)
MsgBox(0, "Document Created Date", $oDoc.fileCreatedDate)
