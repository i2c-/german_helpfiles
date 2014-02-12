; *******************
; * Erstes Beispiel *
; *******************

#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $prefsitem = TrayCreateItem("Vorz&uuml;ge")
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
		Case $msg = $prefsitem
			MsgBox(64, "Vorz&uuml;ge:", "OS:" & @OSVersion)
		Case $msg = $aboutitem
			MsgBox(64, "&Uuml;ber:", "AutoIt3-Tray-Beispiel")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit


; ********************
; * Zweites Beispiel *
; ********************

#include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

; Wir erzeugen 2 Gruppen von Options-Men&uuml;feldern
Local $radio1 = TrayCreateItem("Radiobutton1", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
TrayCreateItem("Radiobutton2", -1, -1, 1)
TrayCreateItem("Radiobutton3", -1, -1, 1)

TrayCreateItem("") ; Die Men&uuml;eintr&auml;ge von den Radiobuttons k&ouml;nnen durch eine Trennlinie oder einen anderen Men&uuml;punkt getrennt werden


TrayCreateItem("Radiobutton4", -1, -1, 1)
TrayCreateItem("Radiobutton5", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
TrayCreateItem("Radiobutton6", -1, -1, 1)

TrayCreateItem("")

$aboutitem = TrayCreateItem("&Uuml;ber")
TrayCreateItem("")
$exititem = TrayCreateItem("Beenden")

TraySetState()

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			MsgBox(64, "&Uuml;ber:", "AutoIt3-Tray-Beispiel mit Gruppen von Men&uuml;eintr&auml;gen.")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
