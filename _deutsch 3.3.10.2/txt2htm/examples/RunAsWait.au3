#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Hier den Benutzername und Passwort eingeben, die dem System entsprechen.
	Local $sUserName = "Username"
	Local $sPassword = "Password"

	; Startet den Editor und wartet bis der Prozess nicht mehr existiert. Der Editor l&auml;uft unter dem obigen Benutzer.
	Local $iReturn = RunAsWait($sUserName, @ComputerName, $sPassword, 0, "notepad.exe")

	; Zeigt den R&uuml;ckgabewert des Editorprozesses an.
	MsgBox($MB_SYSTEMMODAL, "", "The return code from Notepad was: " & $iReturn)
EndFunc   ;==>Example
