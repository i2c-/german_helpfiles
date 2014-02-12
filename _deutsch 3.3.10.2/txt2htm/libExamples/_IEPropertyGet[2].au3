#include <IE.au3>

;&Ouml;ffnet eine Browser-Instanz mit dem Formularbeispiel und erh&auml;lt einen Bezug zum Formularelement "Text".
;Erh&auml;lt die Koordinaten und die Abma&szlig;e vom Textbereich, umf&auml;hrt seine Kontur mit der Maus und bewegt sich zum Schlu&szlig; in die Mitte des Formularelements

Local $oIE = _IE_Example("form")

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
Local $mousespeed = 50
MouseMove($iScreenX, $iScreenY, $mousespeed)
MouseMove($iScreenX + $iWidth, $iScreenY, $mousespeed)
MouseMove($iScreenX + $iWidth, $iScreenY + $iHeight, $mousespeed)
MouseMove($iScreenX, $iScreenY + $iHeight, $mousespeed)
MouseMove($iScreenX, $iScreenY, $mousespeed)
MouseMove($iScreenX + $iWidth / 2, $iScreenY + $iHeight / 2, $mousespeed)
