; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem form-Beispiel; Klick auf das
;				<input type=image> Formularelement mit &uuml;bereinstimmendem Alternativtext ("alt")
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "AutoIt Homepage", "alt")

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit dem form-Beispiel; Klick auf das <input type=image>
;				Formularelement mit &uuml;bereinstimmendem img-Quelltext in der URL (Teilstring)
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
_IEFormImageClick($oIE, "autoit_6_240x100.jpg", "src")

; *******************************************************
; Beispiel 3 - &Ouml;ffnet einen Browser mit dem form-Beispiel; Klick auf das
;				<input type=image> Formularelement mit &uuml;bereinstimmendem Namen
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
_IEFormImageClick($oIE, "imageExample", "name")
