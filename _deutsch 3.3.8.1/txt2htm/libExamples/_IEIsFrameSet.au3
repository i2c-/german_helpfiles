; *******************************************************
; Beispiel 1 - Zeigt das frameset-Beispiel an, erstellt eine Frame-Auflistung,
;				fragt die Anzahl der Frames ab, zeigt die Anzahl vorhandener Frames oder iFrames an
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("frameset")
Local $oFrames = _IEFrameGetCollection($oIE)
Local $iNumFrames = @extended
If $iNumFrames > 0 Then
	If _IEIsFrameSet($oIE) Then
		MsgBox(0, "Frame Info", "Die Seite enth&auml;lt " & $iNumFrames & " Frames in einem FrameSet")
	Else
		MsgBox(0, "Frame Info", "Die Seite enth&auml;lt " & $iNumFrames & " iFrames")
	EndIf
Else
	MsgBox(0, "Frame Info", "Die Seite enth&auml;lt keine Frames")
EndIf
