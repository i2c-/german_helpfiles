#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Global $oMyError

Example()

Func Example()
	Local $myedit, $msg

	GUICreate("Meine GUI mit einem Edit-Feld") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$myedit = GUICtrlCreateEdit("Erste Zeile" & @CRLF, 176, 32, 121, 97, $ES_AUTOVSCROLL + $WS_VSCROLL)

	GUISetState(@SW_SHOW)

	Send("{END}")

	; Wird hinzugef&uuml;gt, 3. Parameter nicht vergessen!
	GUICtrlSetData($myedit, "Zweite Zeile", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example
