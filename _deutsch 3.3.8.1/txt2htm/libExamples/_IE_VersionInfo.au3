; *******************************************************
; Exemple 1 - Abrufen und anzeigen von IE.au3 Versionsinformationen
; *******************************************************

#include <IE.au3>

Local $aVersion = _IE_VersionInfo()
MsgBox(0, "IE.au3 Version", $aVersion[5] & " released " & $aVersion[4]) 4])
