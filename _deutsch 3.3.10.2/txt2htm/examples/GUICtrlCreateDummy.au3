#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $gui, $user, $button, $cancel, $msg

	$gui = GUICreate("GUICtrlCreateDummy", 250, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe

	$user = GUICtrlCreateDummy()
	$button = GUICtrlCreateButton("OK", 75, 170, 70, 20)
	$cancel = GUICtrlCreateButton("Abbrechen", 150, 170, 70, 20)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $button
				GUICtrlSendToDummy($user)
			Case $msg = $cancel
				GUICtrlSendToDummy($user)
			Case $msg = $user
				; Besondere Anweisungen vor Skriptende
				; ...
				WinClose($gui)
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
