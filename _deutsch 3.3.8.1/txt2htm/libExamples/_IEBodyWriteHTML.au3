; *******************************************************
; Beispiel 1 - &ouml;ffnet einen Browser mit dem iFrame-Beispiel, einen Bezug zu dem iFrame
;				 mit dem Namen "iFrameTwo" zu bekommen und dessen body-HTML zu ersetzen.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hello <b>iFrame!</b>"
