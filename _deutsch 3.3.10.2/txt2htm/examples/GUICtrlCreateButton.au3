#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Erstellt ein Button-Control.
	Local $iNotepad = GUICtrlCreateButton("Editor starten", 120, 170, 85, 25)
	Local $iClose = GUICtrlCreateButton("Schlie&szlig;en", 210, 170, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	Local $iPID = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

			Case $iNotepad
				; Startet den Editor mit einem maximierten Fenster.
				$iPID = Run("notepad.exe", "", @SW_SHOWMAXIMIZED)

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)

; Schlie&szlig;t den Editorprozess durch die Verwendung der von Run zur&uuml;ckgegebenen PID.
	If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Example
