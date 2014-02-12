#include <MsgBoxConstants.au3>
; Dr&uuml;cke Esc um das Skript zu beenden, Pause um es zu pausieren

Global $fPaused = False

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d

;;;; Hier ist der Hauptteil des Programms ;;;;
While 1
	Sleep(100)
WEnd
;;;;;;;;

Func TogglePause()
	$fPaused = Not $fPaused
	While $fPaused
		Sleep(100)
		ToolTip('Script ist pausiert', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
	Exit
EndFunc   ;==>Terminate

Func ShowMessage()
	MsgBox($MB_SYSTEMMODAL, "", "Das ist eine Nachricht.")
EndFunc   ;==>ShowMessage
