#include <GUIConstantsEx.au3>

Global $user

Example()

Func Example()
	Local $iOldOpt
	$iOldOpt = Opt("GUIOnEventMode", 1)

	GUICreate("GUI Senden an Dummy", 220, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe
	GUICtrlSetOnEvent($GUI_EVENT_CLOSE, "OnClick") ; Was soll beim Klick auf den Button passieren?

	$user = GUICtrlCreateDummy()
	GUICtrlSetOnEvent(-1, "Onexit") ; Was soll beim Klick auf den Button passieren?
	GUICtrlCreateButton("Ablauf", 75, 170, 70, 20)
	GUICtrlSetOnEvent(-1, "OnClick") ; Was soll beim Klick auf den Button passieren?
	GUISetState()

	While 1
		Sleep(100)
	WEnd

	Opt("GUIOnEventMode", $iOldOpt)

EndFunc   ;==>Example

Func OnClick()
	GUICtrlSendToDummy($user) ; Erstes Dummy-Control
EndFunc   ;==>OnClick

Func OnExit()
	; Besondere Aktion vor dem Beenden des Skripts
	Exit
EndFunc   ;==>OnExit
