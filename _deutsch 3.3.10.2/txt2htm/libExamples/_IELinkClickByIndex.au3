#include <IE.au3>

; &Ouml;ffnet Browser mit basic-Beispiel, Klick auf den dritten Link auf der Seite (Anmerkung: Der Index beginnt bei 0)

Local $oIE = _IE_Example("basic")
_IELinkClickByIndex($oIE, 2)
