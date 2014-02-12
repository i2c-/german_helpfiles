#include <MsgBoxConstants.au3>

If WinActive("[CLASS:Notepad]") Then ; Pr&uuml;ft, ob das Editorfenster das aktive Fenster ist.
	MsgBox($MB_SYSTEMMODAL, "", "WinActive" & @CRLF & "Notepad ist das aktive Fenster.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "WinActive" & @CRLF & "Notepad ist nicht das aktive Fenster.")
EndIf
