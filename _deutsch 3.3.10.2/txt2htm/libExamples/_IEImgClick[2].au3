#include <IE.au3>

; Klickt auf ein Bild (IMG) anhand des Namens

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "AutoItImage", "id") ; f&uuml;r HTML5-Seiten ist "name" zu verwenden
