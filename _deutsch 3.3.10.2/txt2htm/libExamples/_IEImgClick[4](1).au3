#include <IE.au3>

; Klickt auf ein Bild (IMG) anhand eines kompletten Strings des Quelltextes

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "http://www.autoitscript.com/images/autoit_6_240x100.jpg")
