; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit einem Formular Beispiel,
; Sammelt alle INPUT tags und zeigt sie den Form-Namen, sowie alle Typen dieser an
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oInputs = _IETagNameGetCollection($oIE, "input")
For $oInput In $oInputs
	MsgBox(0, "Fromular Input Typ", "Formular: " & $oInput.form.name & " Typ: " & $oInput.type)
Next
