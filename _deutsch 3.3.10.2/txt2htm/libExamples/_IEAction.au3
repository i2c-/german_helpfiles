#include <IE.au3>

; &Ouml;ffnet das "form" - Beispiel im Standardbrowser.
; Nun wird ein Klick auf den Submit-Button simuliert, welcher anhand seiner Beschriftung erkannt wurde.
; Diese Technik ist sinnvoll, weil sehr viele Input-Controls &uuml;ber JavaScript gesteuert werden, bei welchen eine standardm&auml;&szlig;ige "onClick" Ereignis&uuml;bergabe mit_IEFormSubmit() nicht immer dass gew&uuml;nschte Ergebnis hervorruft.

Local $oIE = _IE_Example("form")
Local $oSubmit = _IEGetObjByName($oIE, "submitExample")
_IEAction($oSubmit, "click")
_IELoadWait($oIE)
