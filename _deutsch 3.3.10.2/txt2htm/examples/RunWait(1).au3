#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor und wartet bis der Prozess nicht mehr existiert.
	Local $iReturn = RunWait("notepad.exe")

	; Zeigt den R&uuml;ckgabewert des Editorprozesses an.
	MsgBox($MB_SYSTEMMODAL, "", "The return code from Notepad was: " & $iReturn)
EndFunc   ;==>Example
