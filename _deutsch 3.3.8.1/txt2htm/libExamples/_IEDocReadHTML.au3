; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem Grundbeispiel, liest den HTML-Quelltext des Dokuments
;				(kompletten HTML-Quelltext einschlie&szlig;lich dem <HEAD> und dem Code) und stellt ihn in einer MsgBox dar.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $sHTML = _IEDocReadHTML($oIE)
MsgBox(0, "Document Source", $sHTML)
