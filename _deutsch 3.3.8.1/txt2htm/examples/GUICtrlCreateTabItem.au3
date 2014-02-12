#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $tab
	Local $msg

	GUICreate("Meine GUI mit Tabs", 250, 175); Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetBkColor(0x00E0FFFF)
	GUISetFont(9, 300)

	$tab = GUICtrlCreateTab(10, 10, 200, 100)

	GUICtrlCreateTabItem("Tab0")
	GUICtrlCreateLabel("Beschriftung0", 30, 80, 80, 20)
	GUICtrlCreateButton("OK0", 20, 50, 50, 20)
	GUICtrlCreateInput("Standard", 80, 50, 70, 20)

	GUICtrlCreateTabItem("Tab----1")
	GUICtrlCreateLabel("Beschriftung1", 30, 80, 80, 20)
	GUICtrlCreateCombo("", 20, 50, 60, 120)
	GUICtrlSetData(-1, "Trids|CyberSlug|Larry|Jon|Tylo", "Jon") ; Standardwert Jon
	GUICtrlCreateButton("OK1", 80, 50, 50, 20)

	GUICtrlCreateTabItem("Tab2")
	GUICtrlSetState(-1, $GUI_SHOW) ; Erscheint zuerst
	GUICtrlCreateLabel("Beschriftung2", 30, 80, 80, 20)
	GUICtrlCreateButton("OK2", 140, 50, 50)

	GUICtrlCreateTabItem(""); Beendet die Tab Definition

	GUICtrlCreateLabel("Klicke auf einen Tab und dessen Beschriftung wird sichtbar", 20, 130, 250, 40)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
		If $msg = $tab Then
			; Der angeklickte Tab erscheint
			WinSetTitle("Meine GUI mit Tabs", "", "Meine GUI mit Tabs" & GUICtrlRead($tab))
		EndIf
	WEnd
EndFunc   ;==>Example
