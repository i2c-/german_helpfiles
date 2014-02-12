#NoTrayIcon

Opt("TrayMenuMode", 1) ; Standard Traymen&uuml;eintr&auml;ge (Skript pausieren/beenden) werden nicht angezeigt.

Local $exititem = TrayCreateItem("Beenden")

TraySetState()

Local $start = 0
While 1
	Local $msg = TrayGetMsg()
	If $msg = $exititem Then ExitLoop
	Local $diff = TimerDiff($start)
	If $diff > 1000 Then
		Local $num = -Random(0, 100, 1) ; Negativ um die Ordinalnummerierung zu verwenden
		ToolTip("#icon=" & $num)
		TraySetIcon("Shell32.dll", $num)
		$start = TimerInit()
	EndIf
WEnd

Exit
