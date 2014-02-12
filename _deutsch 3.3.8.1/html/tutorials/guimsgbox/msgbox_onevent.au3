#include <GuiConstantsEx.au3>

Opt("GuiOnEventMode", 1)

GUICreate("Benutzerdefinierte Msgbox", 210, 80)

$YesID = GUICtrlCreateButton("Ja", 10, 50, 50, 20)
GUICtrlSetOnEvent(-1, "OnYes")
$NoID = GUICtrlCreateButton("Nein", 80, 50, 50, 20)
GUICtrlSetOnEvent(-1, "OnNo")
$ExitID = GUICtrlCreateButton("Beenden", 150, 50, 50, 20)
GUICtrlSetOnEvent(-1, "OnExit")

GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")

GUISetState() ;zeigt die GUI an

While 1
	Sleep(10)
WEnd

;--------------- Funktionen ---------------
Func OnYes()
	MsgBox(0, "Es wurde folgender Button angeklickt", "Ja")
EndFunc   ;==>OnYes

Func OnNo()
	MsgBox(0, "Es wurde folgender Button angeklickt", "Nein")
EndFunc   ;==>OnNo

Func OnExit()
	If @GUI_CtrlId = $ExitID Then
		MsgBox(0, "Es wurde folgender Button angeklickt", "Beenden")
	Else
		MsgBox(0, "Es wurde folgender Button angeklickt", "Schlie&szlig;en")
	EndIf

	Exit
EndFunc   ;==>OnExit
