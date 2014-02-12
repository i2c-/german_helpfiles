; *******************************************************
; Beispiel 1 - Ermittelt die Version der Word.au3 und zeigt diese dann an
; *******************************************************
;
#include <Word.au3>

Local $aVersion = _Word_VersionInfo()
MsgBox(0, "Word.au3 Version", $aVersion[5] & " ver&ouml;ffentlicht " & $aVersion[4])
