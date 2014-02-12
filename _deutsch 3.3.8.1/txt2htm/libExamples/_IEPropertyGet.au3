; *******************************************************
; Beispiel 1 - &Ouml;ffnet eine Browser-Instanz mit dem Grundbeispiel, pr&uuml;ft ob die
;				Adressleiste sichtbar ist. Falls sie sichtbar ist wird sie versteckt und umgekehrt.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
If _IEPropertyGet($oIE, "addressbar") Then
	MsgBox(0, "Adressleiste Status", "Adressleiste sichtbar, verstecken der Adressleiste")
	_IEPropertySet($oIE, "addressbar", False)
Else
	MsgBox(0, "Adressleiste Status", "Adressleiste versteckt, einblenden der Adressleiste")
	_IEPropertySet($oIE, "addressbar", True)
EndIf

; *******************************************************
; Beispiel 2 - &Ouml;ffnet eine Browser-Instanz mit dem Formularbeispiel und erh&auml;lt einen Bezug zum Formularelement
;				"Text".  Erh&auml;lt die Koordinaten und die Abma&szlig;e vom Textbereich,
;				umf&auml;hrt seine Kontur mit der Maus und bewegt sich zum Schlu&szlig; in die Mitte des Formularelements
; *******************************************************

$oIE = _IE_Example("form")

Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oTextArea = _IEFormElementGetObjByName($oForm, "textareaExample")

; Erh&auml;lt die Koordinaten und Abma&szlig;e vom Textbereich
Local $iScreenX = _IEPropertyGet($oTextArea, "screenx")
Local $iScreenY = _IEPropertyGet($oTextArea, "screeny")
Local $iBrowserX = _IEPropertyGet($oTextArea, "browserx")
Local $iBrowserY = _IEPropertyGet($oTextArea, "browserY")
Local $iWidth = _IEPropertyGet($oTextArea, "width")
Local $iHeight = _IEPropertyGet($oTextArea, "height")

; Umf&auml;hrt seine Kontur mit der Maus und bewegt sich zum Schlu&szlig; in die Mitte des Formularelements
MouseMove($iScreenX, $iScreenY)
MouseMove($iScreenX + $iWidth, $iScreenY)
MouseMove($iScreenX + $iWidth, $iScreenY + $iHeight)
MouseMove($iScreenX, $iScreenY + $iHeight)
MouseMove($iScreenX, $iScreenY)
MouseMove($iScreenX + $iWidth / 2, $iScreenY + $iHeight / 2)
