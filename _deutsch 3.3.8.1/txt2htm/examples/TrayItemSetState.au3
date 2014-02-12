#include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $chkitem = TrayCreateItem("Markiere es")
TrayCreateItem("")
Local $checkeditem = TrayCreateItem("Markiert")
TrayCreateItem("")
Local $exititem = TrayCreateItem("Beenden")

TraySetState()

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $chkitem
			TrayItemSetState($checkeditem, $TRAY_CHECKED)
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
