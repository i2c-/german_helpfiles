; *******************************************************
; Beispiel 1 - &ouml;ffnet das iFrame-Beispiel und bekommt den Bezug zu dem iFrame
;               mit dem Namen "iFrameTwo" und Ersetzt seinen HTML-Body.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hello <b>iFrame!</b>")
_IELoadWait($oFrame)
