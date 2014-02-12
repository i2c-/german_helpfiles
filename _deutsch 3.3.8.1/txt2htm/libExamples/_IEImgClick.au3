; *******************************************************
; Beispiel 1 - Klickt auf ein Bild (Tag img) anhand eines Alternativtextes (Attribut alt)
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "AutoIt Homepage Image", "alt")

; *******************************************************
; Beispiel 2 - Klickt auf ein Bild (IMG) anhand des Namens
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEImgClick($oIE, "AutoItImage", "name")

; *******************************************************
; Beispiel 3 - Klickt auf ein Bild (IMG) anhand eines Teilstrings des Quelltextes
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEImgClick($oIE, "autoit_6_240x100.jpg", "src")

; *******************************************************
; Beispiel 4 - Klickt auf ein Bild (IMG) anhand eines kompletten Strings des Quelltextes
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEImgClick($oIE, "http://www.autoitscript.com/images/autoit_6_240x100.jpg")
