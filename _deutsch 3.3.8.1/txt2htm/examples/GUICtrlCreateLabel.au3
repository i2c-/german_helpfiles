#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $widthCell, $msg, $iOldOpt

	GUICreate("Mein GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetHelp("notepad.exe") ; Startet den Editor, wenn F1 gedr&uuml;ckt wird
	$iOldOpt = Opt("GUICoordMode", 2)

	$widthCell = 80
	GUICtrlCreateLabel("Zeile 1, Zelle 1", 10, 30, $widthCell) ; Erste Zelle, Breite 80
	GUICtrlCreateLabel("Zeile 2, Zelle 1", -1, 0) ; N&auml;chste Zeile
	GUICtrlCreateLabel("Zeile 3, Zelle 2", 0, 0) ; N&auml;chste Zeile und n&auml;chste Zelle
	GUICtrlCreateLabel("Zeile 3, Zelle 3", 0, -1) ; N&auml;chste Zelle, gleiche Zeile
	GUICtrlCreateLabel("Zeile 4, Zelle 1", -3 * $widthCell, 0) ; N&auml;chste Zeile, Zelle 1

	GUISetState() ; Zeigt eine leere Dialogbox an

	; GUI starten, bis der Dialog beendet wird
	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE

	$iOldOpt = Opt("GUICoordMode", $iOldOpt)
EndFunc   ;==>Example
