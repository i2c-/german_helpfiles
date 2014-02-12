; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem Grundlagen Beispiel,
; Sammelt alle Elemente und zeigt den Tag-Namen sowie den Text innerhalb an
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oElements = _IETagNameAllGetCollection($oIE)
For $oElement In $oElements
	MsgBox(0, "Element Info", "Tagname: " & $oElement.tagname & @CR & "innerText: " & $oElement.innerText)
Next
