; *******************************************************
; Beispiel 1 - &Ouml;ffnet ein "frameset" Beispiel,
; Bestimmt eine Sammlung an "frames" und erstellt
; Eine Schleife, die deren URL-Quellen anzeigt
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("frameset")
Local $oFrames = _IEFrameGetCollection($oIE)
Local $iNumFrames = @extended
For $i = 0 to ($iNumFrames - 1)
	$oFrame = _IEFrameGetCollection($oIE, $i)
	MsgBox(0, "Frame Info", _IEPropertyGet($oFrame, "locationurl"))
Next
