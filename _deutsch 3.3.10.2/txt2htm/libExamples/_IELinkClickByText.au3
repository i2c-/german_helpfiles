#include <IE.au3>

; &Ouml;ffnet Browser mit basic-Beispiel, klickt auf den Link mit dem Text "user forum"

Local $oIE = _IE_Example("basic")
_IELinkClickByText($oIE, "user forum")
