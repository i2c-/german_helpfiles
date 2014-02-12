#include <GUIConstantsEx.au3>

GUICreate("Benutzerdefinierte Msgbox", 210, 80)

$YesID = GUICtrlCreateButton("Ja", 10, 50, 50, 20)
$NoID = GUICtrlCreateButton("Nein", 80, 50, 50, 20)
$ExitID = GUICtrlCreateButton("Beenden", 150, 50, 50, 20)

GUISetState() ;zeigt die GUI an

Do
	$msg = GUIGetMsg()

	Select
		Case $msg = $YesID
			MsgBox(0, "Es wurde folgender Button angeklickt", "Ja")
		Case $msg = $NoID
			MsgBox(0, "Es wurde folgender Button angeklickt", "Nein")
		Case $msg = $ExitID
			MsgBox(0, "Es wurde folgender Button angeklickt", "Beenden")
		Case $msg = $GUI_EVENT_CLOSE
			MsgBox(0, "Es wurde folgender Button angeklickt", "Schlie&szlig;en")
	EndSelect
Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID
