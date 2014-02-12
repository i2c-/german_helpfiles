#NoTrayIcon

Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

TraySetClick(16) ; Nur wenn die zweite Maustaste gedr&uuml;ckt wird, wird das Traymen&uuml; anzeigt.

TrayCreateItem("Info")
TrayItemSetOnEvent(-1, "ShowInfo")

TrayCreateItem("")

TrayCreateItem("Beenden")
TrayItemSetOnEvent(-1, "ExitScript")

TraySetState()

While 1
	Sleep(10) ; CPU-Last verhindern
WEnd

Exit


; Funktionen
Func ShowInfo()
	MsgBox(0, "Info", "Tray OnEvent Demo")
EndFunc   ;==>ShowInfo


Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
