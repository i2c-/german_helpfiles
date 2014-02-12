#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $FileMenu, $OptionsMenu
	Local $ExitItem, $HelpMenu, $AboutItem
	Local $EndBtn, $Msg


	GUICreate("Meine GUI", 300, 200)

	$FileMenu = GUICtrlCreateMenu("&Datei")
	GUICtrlCreateMenuitem("&&Ouml;ffnen", $FileMenu)
	GUICtrlCreateMenuitem("&Speichern", $FileMenu)
	GUICtrlCreateMenuitem("", $FileMenu)

	$OptionsMenu = GUICtrlCreateMenu("O&ptionen", $FileMenu)
	GUICtrlCreateMenuitem("Ansicht", $OptionsMenu)
	GUICtrlCreateMenuitem("", $OptionsMenu)
	GUICtrlCreateMenuitem("Tools", $OptionsMenu)

	GUICtrlCreateMenuitem("", $FileMenu)
	$ExitItem = GUICtrlCreateMenuitem("&Beenden", $FileMenu)

	$HelpMenu = GUICtrlCreateMenu("&?")
	$AboutItem = GUICtrlCreateMenuitem("&&Uuml;ber", $HelpMenu)

	$EndBtn = GUICtrlCreateButton("Beenden", 110, 140, 70, 20)

	SetMenuColor($FileMenu, 0xEEBB99) ; RGB Farbwert
	SetMenuColor($OptionsMenu, 0x66BB99); RGB Farbwert
	SetMenuColor($HelpMenu, 0x99BBEE) ; RGB Farbwert

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$Msg = GUIGetMsg()

		Switch $Msg
			Case $ExitItem, $EndBtn, $GUI_EVENT_CLOSE
				ExitLoop

			Case $AboutItem
				MsgBox($MB_SYSTEMMODAL, "&Uuml;ber", "Farbiges Men&uuml;beispiel")
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Farbe im Men&uuml; anwenden
Func SetMenuColor($nMenuID, $nColor)
	Local $hMenu, $hBrush, $stMenuInfo
	Local Const $MIM_APPLYTOSUBMENUS = 0x80000000
	Local Const $MIM_BACKGROUND = 0x00000002

	$hMenu = GUICtrlGetHandle($nMenuID)

	$hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $nColor)
	$hBrush = $hBrush[0]

	$stMenuInfo = DllStructCreate("dword;dword;dword;uint;dword;dword;ptr")
	DllStructSetData($stMenuInfo, 1, DllStructGetSize($stMenuInfo))
	DllStructSetData($stMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($stMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "ptr", DllStructGetPtr($stMenuInfo))

	; Freigabe der Struktur nicht erforderlich, solange sie lokal ist
	$stMenuInfo = 0
EndFunc   ;==>SetMenuColor
