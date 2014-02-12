#include <Constants.au3>

Opt("TrayMenuMode", 1) ; Blendet das Standard Tray-Kontextmen&uuml; aus

Global Const $MIM_APPLYTOSUBMENUS = 0x80000000
Global Const $MIM_BACKGROUND = 0x00000002

TraySetIcon("shell32.dll", 21)
TraySetToolTip("Hier ist ein einfaches kleines Beispiel, das zeigt, dass farbige Tray-Men&uuml;s" & @LF & "unter Windows 2000 und h&ouml;her leicht m&ouml;glich sind.")

Local $OptionsMenu = TrayCreateMenu("Optionen")
$OnTopItem = TrayCreateItem("Immer im Vordergrund", $OptionsMenu)
TrayItemSetState(-1, $TRAY_CHECKED)
$RepeatItem = TrayCreateItem("Immer wiederholen", $OptionsMenu)
TrayCreateItem("")
Local $AboutItem = TrayCreateItem("&Uuml;ber")
TrayCreateItem("")
Local $ExitItem = TrayCreateItem("Beispiel beenden")

SetMenuColor(0, 0xEEBB99) ; BGR Farbwert, '0' bedeutet, dass das Tray Kontext-Men&uuml; dies selbst regelt
SetMenuColor($OptionsMenu, 0x66BB99); BGR Farbwert

While 1
	Local $Msg = TrayGetMsg()

	Switch $Msg
		Case $ExitItem
			ExitLoop

		Case $AboutItem
			MsgBox(64, "&Uuml;ber...", "Farbiges Tray-Men&uuml; Beispiel")
	EndSwitch
WEnd

Exit


; Wendet die Farbe auf das Men&uuml; an
Func SetMenuColor($nMenuID, $nColor)
	Local $hMenu = TrayItemGetHandle($nMenuID) ; Holt den internen Men&uuml;-Handle

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $nColor)
	$hBrush = $hBrush[0]

	Local $stMenuInfo = DllStructCreate("dword;dword;dword;uint;dword;dword;ptr")
	DllStructSetData($stMenuInfo, 1, DllStructGetSize($stMenuInfo))
	DllStructSetData($stMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($stMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "ptr", DllStructGetPtr($stMenuInfo))
EndFunc   ;==>SetMenuColor
