#include <IE.au3>

; &Ouml;ffnet einen Browser mit dem form-Beispiel; Klick auf das <input type=image> Formularelement mit &uuml;bereinstimmendem img-Quelltext in der URL (Teilstring)

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "autoit_6_240x100.jpg", "src")
