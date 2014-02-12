; Damit das Beispiel funktioniert, muss mindestens ein ge&ouml;ffnetes Notepad existieren, in dem "hier rein" vorkommt!

; Ermittelt das Handle des vordersten Editor-Fensters, welches "hier rein" enth&auml;lt.
Local $handle = WinGetHandle("classname=Notepad", "hier rein")
If @error Then
	MsgBox(4096, "Fehler", "Das richtige Fenster konnte nicht gefunden werden")
Else
	; Es wird etwas Text in das &Auml;nderungsfeld des Fensters geschrieben.
	ControlSend($handle, "", "Edit1", " AbCdE")
EndIf
