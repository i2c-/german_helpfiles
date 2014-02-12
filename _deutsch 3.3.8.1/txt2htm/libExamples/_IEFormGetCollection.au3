; *******************************************************
; Beispiel 1 - Stellt einen Verweis auf eine spezifische Form vom 0-basierenden Index her;
; In diesem Fall die erste Form auf der Seite
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 1)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; Beispiel 2 - Stellt einen Verweis auf die Sammlung von Formen auf einer Seite her
; Und zeigt dann, in einer Schleife, alle Informationen f&uuml;r jede Form an
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
Local $oForms = _IEFormGetCollection($oIE)
MsgBox(0, "Formen Informationen", "Es befinden sich " & @extended & " Formen auf dieser Seite")
For $oForm In $oForms
	MsgBox(0, "Form Information", $oForm.name)
Next

; *******************************************************
; Beispiel 3 - Stellt einen Verweis auf die Sammlung von Formen auf einer Seite her
; Und zeigt dann, in einer Schleife, alle Informationen f&uuml;r jede Anzeige-Nutzung vom Form-Index an
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
$oForms = _IEFormGetCollection($oIE)
Local $iNumForms = @extended
MsgBox(0, "Formen Informationen", "Es befinden sich " & $iNumForms & " Formen auf dieser Seite")
For $i = 0 To $iNumForms - 1
	$oForm = _IEFormGetCollection($oIE, $i)
	MsgBox(0, "Form Information", $oForm.name)
Next
