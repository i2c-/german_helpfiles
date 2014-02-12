#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Example()

Func Example()
	Local $nEdit, $nOk, $nCancel, $msg

	Opt("GUICoordMode", 2)
	GUICreate("Meine InputBox", 190, 114, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Legt den Stil fest

	GUISetFont(8, -1, "Arial")

	GUICtrlCreateLabel("Eingabeaufforderung", 8, 7) ; F&uuml;gt Info hinzu
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP)

	$nEdit = GUICtrlCreateInput("Standard", -1, 3, 175, 20, $ES_PASSWORD) ; F&uuml;gt das Input-Control hinzu
	GUICtrlSetState($nEdit, $GUI_FOCUS)
	GUICtrlSetResizing($nEdit, $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

	$nOk = GUICtrlCreateButton("OK", -1, 3, 75, 24) ; F&uuml;gt den Button hinzu, der die GUI schliesst
	GUICtrlSetResizing($nOk, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	$nCancel = GUICtrlCreateButton("Abbrechen", 25, -1) ; F&uuml;gt den Button hinzu, der die GUI schliesst
	GUICtrlSetResizing($nCancel, $GUI_DOCKBOTTOM + $GUI_DOCKSIZE + $GUI_DOCKHCENTER)

	GUISetState(@SW_SHOW) ; Um die GUI anzuzeigen

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
