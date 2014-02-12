#include <GUIConstantsEx.au3>

Global $iUserDummy

Example()

Func Example()
	Opt("GUIOnEventMode", 1) ; Setzt die Option, damit GUIOnEventMode. verwendet wird.

	GUICreate("GUISendToDummy", 220, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe der GUI
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnClick") ; Setzt ein Event welches die 'OnClick'-Funktion aufruft wenn der Schlie&szlig;en-Button der GUI gedr&uuml;ckt wurde.

	$iUserDummy = GUICtrlCreateDummy()
	GUICtrlSetOnEvent(-1, "OnExit") ; Setzt ein Event welches die 'OnExit'-Funktion aufruft wenn dieses Control ausgew&auml;hlt wurde.

	GUICtrlCreateButton("Close", 70, 170, 85, 25)
	GUICtrlSetOnEvent(-1, "OnClick") ; Setzt ein Event welches die 'OnExit'-Funktion aufruft wenn dieses Control ausgew&auml;hlt wurde.

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Sleep(100)
	WEnd
EndFunc   ;==>Example

Func OnClick()
	Return GUICtrlSendToDummy($iUserDummy) ; Sendet eine Nachricht zu dem Dummy-Control, dass der Schlie&szlig;en-Button ausgew&auml;hlt wurde. Dieses ruft dann die 'OnExit'-Funktion auf.
EndFunc   ;==>OnClick

Func OnExit()
	Exit ; Beendet das Skript
EndFunc   ;==>OnExit
