#include <Constants.au3>
#NoTrayIcon

Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

TrayCreateItem("Exit")
TrayItemSetOnEvent(-1, "ExitEvent")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "SpecialEvent")
TraySetOnEvent($TRAY_EVENT_SECONDARYUP, "SpecialEvent")

TraySetState()

While 1
	Sleep(10) ; CPU-Last verhindern
WEnd

Exit


; Funktionen
Func SpecialEvent()
	Select
		Case @TRAY_ID = $TRAY_EVENT_PRIMARYDOUBLE
			MsgBox(64, "SpecialEvent-Info", "Erster Mausbutton wurde doppelgeklickt.")
		Case @TRAY_ID = $TRAY_EVENT_SECONDARYUP
			MsgBox(64, "SpecialEvent-Info", "Zweiter Mausbutton wurde geklickt.")
	EndSelect
EndFunc   ;==>SpecialEvent


Func ExitEvent()
	Exit
EndFunc   ;==>ExitEvent
