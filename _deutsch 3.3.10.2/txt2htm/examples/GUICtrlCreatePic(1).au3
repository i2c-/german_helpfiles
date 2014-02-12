#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $gui, $guiPos, $pic, $picPos

Example1()

;----- Beispiel 1 ----
Func Example1()
	Local $n, $msg

	GUICreate("Meine GUI mit Bild", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird.

	GUISetBkColor(0xE0FFFF)
	$n = GUICtrlCreatePic("..\GUI\mslogo.jpg", 50, 50, 200, 50)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Ver&auml;ndere die Gr&ouml;&szlig;e des Controls
	GUICtrlSetPos($n, 50, 50, 200, 100)
	GUICtrlSetImage($n, "..\GUI\mslogo.jpg")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	GUIDelete()
EndFunc   ;==>Example1
