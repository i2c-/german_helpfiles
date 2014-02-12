#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $getitem = TrayCreateItem("Status ermitteln")
TrayCreateItem("")
Local $aboutitem = TrayCreateItem("&Uuml;ber")
TrayCreateItem("")
Local $exititem = TrayCreateItem("Beenden")

TraySetState()

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $getitem
			MsgBox(64, "Status", TrayItemGetState($aboutitem))
		Case $msg = $aboutitem
			MsgBox(64, "&Uuml;ber:", "AutoIt3-Tray-Beispiel")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
