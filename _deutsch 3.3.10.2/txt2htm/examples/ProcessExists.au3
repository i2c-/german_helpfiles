#include <MsgBoxConstants.au3>

If ProcessExists("notepad.exe") Then ; Pr&uuml;ft, ob der Notepad Prozess l&auml;uft
	MsgBox($MB_SYSTEMMODAL, "", "Der Editor l&auml;uft.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Der Editor l&auml;uft nicht.")
EndIf
