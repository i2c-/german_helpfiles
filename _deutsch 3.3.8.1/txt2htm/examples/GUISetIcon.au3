#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt", "InstallDir") & "\icons\filetype1.ico"
	Local $msg

	GUICreate("Meine GUI mit neuem Icon") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetIcon($sFile) ; &Auml;ndert das Symbol (Icon)

	GUISetState() ; Zeigt ein leeres Dialogfenster an

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
