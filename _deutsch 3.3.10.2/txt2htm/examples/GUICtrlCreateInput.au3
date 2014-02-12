#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $file, $btn, $msg

	GUICreate("Meine GUI die Dateien akzeptiert", 320, 120, @DesktopWidth / 2 - 160, @DesktopHeight / 2 - 45, -1, $WS_EX_ACCEPTFILES)
	$file = GUICtrlCreateInput("", 10, 5, 300, 20)
	GUICtrlSetState(-1, $GUI_DROPACCEPTED)
	GUICtrlCreateInput("", 10, 35, 300, 20) ; Akzeptiert kein Drag&Drop von Dateien
	$btn = GUICtrlCreateButton("Ok", 40, 75, 60, 20)

	GUISetState(@SW_SHOW)

	$msg = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While $msg <> $GUI_EVENT_CLOSE
		$msg = GUIGetMsg()
		Select
			Case $msg = $btn
				ExitLoop
		EndSelect
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Drag&Drop Datei", GUICtrlRead($file))
EndFunc   ;==>Example
