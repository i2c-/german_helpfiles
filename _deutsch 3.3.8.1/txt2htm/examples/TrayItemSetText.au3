#include <Constants.au3>
#NoTrayIcon

Opt("TrayAutoPause", 0) ; Das Skript pausiert nicht, wenn auf das Trayicon geklickt wird.

Local $valitem = TrayCreateItem("Wert:")
TrayCreateItem("")
Local $aboutitem = TrayCreateItem("&Uuml;ber")

TraySetState()

TrayItemSetText($TRAY_ITEM_EXIT, "Programm beenden")
TrayItemSetText($TRAY_ITEM_PAUSE, "Programm pausieren")

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $valitem
			TrayItemSetText($valitem, "Wert:" & Int(Random(1, 10, 1)))
		Case $msg = $aboutitem
			MsgBox(64, "&Uuml;ber:", "AutoIt3-Tray-Beispiel")
	EndSelect
WEnd

Exit
