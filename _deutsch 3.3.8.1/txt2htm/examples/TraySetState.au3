#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $exititem = TrayCreateItem("Beenden")

TraySetIcon("Warnung")
TraySetToolTip("SOS")

TraySetState() ; Zeigt das Tray Icon

Local $toggle = 0

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			Sleep(1000)
			If $toggle = 0 Then
				TraySetState() ; Zeigt das Tray Icon
				$toggle = 1
			Else
				TraySetState(2) ; Versteckt das Tray Icon
				$toggle = 0
			EndIf
		Case $msg = $exititem
			ExitLoop
	EndSelect

WEnd

Exit
