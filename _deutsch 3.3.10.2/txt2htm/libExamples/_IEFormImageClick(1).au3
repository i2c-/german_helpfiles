#include <IE.au3>

; &Ouml;ffnet einen Browser mit dem form-Beispiel; Klick auf das <input type=image> Formularelement mit &uuml;bereinstimmendem Alternativtext ("alt")

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "AutoIt Homepage", "alt")
