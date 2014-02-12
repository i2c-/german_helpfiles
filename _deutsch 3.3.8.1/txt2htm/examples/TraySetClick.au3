#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $settingsitem = TrayCreateMenu("Einstellungen")
$displayitem = TrayCreateItem("Anzeige", $settingsitem)
$printeritem = TrayCreateItem("Drucker", $settingsitem)
TrayCreateItem("")
Local $aboutitem = TrayCreateItem("&Uuml;ber")
TrayCreateItem("")
Local $exititem = TrayCreateItem("Beenden")

TraySetState()
TraySetClick(16)

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			MsgBox(64, "&Uuml;ber:", "AutoIt3-Tray-Beispiel")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
