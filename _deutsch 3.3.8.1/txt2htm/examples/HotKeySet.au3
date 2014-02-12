; Dr&uuml;cke Esc um das Skript zu beenden, Pause um es zu pausieren

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d

;;;; Hier ist der Hauptteil des Programms ;;;;
While 1
	Sleep(100)
WEnd
;;;;;;;;

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script ist pausiert', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate

Func ShowMessage()
	MsgBox(4096, "", "Das ist eine Nachricht.")
EndFunc   ;==>ShowMessage
