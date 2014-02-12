; *******************************************************
; Beispiel 1 - &Ouml;ffnet den Browser mit dem Grundbeispiel und erh&auml;lt eine Verbindung zur Sammlung,
;				durchl&auml;uft die einzelnen Eintr&auml;ge und zeigt die damit verbundenen URLs Referenzen
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended
MsgBox(0, "Link Info", $iNumLinks & " Links gefunden")
For $oLink In $oLinks
	MsgBox(0, "Link Info", $oLink.href)
Next
