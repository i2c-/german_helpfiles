; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit einer Beispiel-Form, bestimmt den Verweis der Form,
; W&auml;hlt den byValue-Wert der Checkboxen aus und  wieder ab.  Wenn $s_Name nicht spezifiziert ist, arbeitet es
; Mit der Auswahl aller <input type=checkbox> Elemente in der Form
;				Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementCheckBoxSelect($oForm, "Basketball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Fu&szlig;ball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Tennis", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Baseball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Basketball", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Fu&szlig;ball", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Tennis", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Baseball", "", 0, "byValue")
	Sleep(1000)
Next

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit einer Beispiel-Form, bestimmt den Verweis der Form,
; W&auml;hlt den byIndex-Wert der Checkboxen aus und  wieder ab.  Wenn $s_Name nicht spezifiziert ist, arbeitet es
; Mit der Auswahl aller <input type=checkbox> Elemente in der Form
;				Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("Form")
$oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementCheckBoxSelect($oForm, 3, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 2, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 3, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 2, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "", 0, "byIndex")
	Sleep(1000)
Next

; *******************************************************
; Beispiel 3 - &Ouml;ffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; W&auml;hlt die byIndex-Werte der Checkboxen in der Gruppe, die sich den Namen  checkboxG2Example teilt, aus und wieder ab

;		Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("Form")
$oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementCheckBoxSelect($oForm, 0, "checkboxG2Example", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "checkboxG2Example", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "checkboxG2Example", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "checkboxG2Example", 0, "byIndex")
	Sleep(1000)
Next
